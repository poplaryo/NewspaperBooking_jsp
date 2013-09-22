<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>订阅报刊</title>
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
                        alert("订阅失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
         String nid = (String)request.getParameter("choice");
         session.setAttribute("nid",nid);
         //连接数据库
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
         //定义查询语句 
         String sql="SELECT NNAME,NNUM FROM [NEWSPAPER] WHERE NID='"+nid+"'";
         //执行查询语句
         Statement stmt = conn.createStatement();        
         ResultSet rs = stmt.executeQuery(sql);
         //若查询结果不为空，则获取上面SELECT语句查询到的值
         if(rs.next())
         {
             String nname = rs.getString(1);
             int nnum     = rs.getInt(2);
             session.setAttribute("nnum",nnum);
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——订阅报刊</h1><br />
      <form name="myform_7" method="post" onsubmit="return checkinput(this);" action="Booked.jsp">
        <table class="spe">
          <tr>
            <th class="spe">用户账号：</th>
            <td class="spe"><% out.println(uid); %></td>
          </tr>
          <tr>
            <th class="spe">报刊号：</th>
            <td class="spe"><% out.println(nid); %></td>
          </tr>
          <tr>
            <th class="spe">报刊名称：</th>
            <td class="spe"><% out.println(nname); %></td>
          </tr>
          <tr>
            <th class="spe">可订份数：</th>
            <td class="spe"><% out.println(nnum); %></td>
          </tr>
          <tr>
            <th class="spe">输入份数：</th>
            <td class="spe"><input type="text" name="bct" maxlength="3"/></td>
          </tr>
          <tr>
            <th class="spe">订阅月数：</th>
            <td class="spe"><input type="text" name="bmonth" maxlength="3"/></td>
          </tr>
        </table>
        
        <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="确认订阅" /></td>
          </tr>
        </table>                        
      </form>
      <%
            if(nnum<=0){
              %>
                  <Script Language="JavaScript">
                      alert("订阅失败。报刊剩余数量不足，请返回！");
                      window.location.href="Newsp_u.jsp"; 
                  </Script>
              <%
            }
          } 
         else
         {
      %>
         <Script Language="JavaScript">
                alert("订阅失败。未选择报刊，请重新选择！");
                window.location.href="Newsp_u.jsp"; 
         </Script><%
         rs.close();
         stmt.close();
         conn.close();
         }
      }%>
      <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/admin.ico" alt="用户页面" />用户页面</a>
            </td>
            <td>
              <a href="Newsp_u.jsp"><img class="small" src="../pics/newsp.ico" alt="查看报刊" />查看报刊</a>
            </td>
          </tr>
      </table>
    </div>
  </body>
</html>