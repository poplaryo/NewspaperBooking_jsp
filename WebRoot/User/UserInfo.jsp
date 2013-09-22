<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>个人信息</title>
  </head>
  <body>
    <div class="right-top">
                    用户账号：
      <% String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("查看个人信息失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else {
         //连接数据库
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
         //定义查询语句 
         String sqls="select uid,uname,uidnum,uphone,uad,[USER].did,dname from [USER],[DEPARTMENT] where UID='"+uid+"' and [USER].did=[DEPARTMENT].did";
         //执行查询语句
         Statement stmt = conn.createStatement();        
         ResultSet rs = stmt.executeQuery(sqls);
         //若查询结果不为空，则获取上面SELECT语句查询到的值
         if(rs.next())
         {
           String uname  = rs.getString(2);
           String uidnum = rs.getString(3);
           String uphone = rs.getString(4);
           String uad    = rs.getString(5);
           String did    = rs.getString(6);
           String dname  = rs.getString(7);
         
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——个人信息</h1><br /><br/>
      <form name="myform_4" method="post"  action="Changeinfo.jsp">
        <table class="spe">
          <tr>
            <th class="spe">用户账号：</td>
            <td class="spe"><% out.println(uid); %></td>
          </tr>
          <tr>
            <th class="spe">用户姓名：</th>
            <td class="spe"><% out.println(uname); %></td>
          </tr>
          <tr>
            <th class="spe">身份证号：</th>
            <td class="spe"><% out.println(uidnum); %></td>
          </tr>
          <tr>
            <th class="spe">用户电话：</th>
            <td class="spe"><% out.println(uphone); %></td>
          </tr>
          <tr>
            <th class="spe">用户地址：</th>
            <td class="spe"><% out.println(uad); %></td>
          </tr>
          <tr>
            <th class="spe">所在部门：</th>
            <td class="spe"><% out.println(dname); }
                   rs.close();    
                   stmt.close();
                   conn.close();
         }         %>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="修改信息" /></td>
          </tr>
        </table>
         
        <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/user.ico" alt="用户页面" />用户页面</a>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>