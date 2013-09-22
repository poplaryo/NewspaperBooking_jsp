<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>用户信息</title>
  </head>
  <body>
    <div class="right-top">
                    管理员账号：
      <% String aid=(String)session.getAttribute("aid");
         out.println(aid);
         if(aid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("查看用户信息失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——用户信息</h1><br />
      <h3>勾选用户信息的选择框可删除相应用户</h3>
      <form name="myform_6" method="post"   action="Deluser.jsp">
        <table class="spe">
          <tr>
            <th class="spe">选择</th>
            <th class="spe">序号</th>
            <th class="spe">用户账号</th>
            <th class="spe">用户姓名</th>
            <th class="spe">身份证号</th>
            <th class="spe">用户电话</th>
            <th class="spe">用户地址</th>
            <th class="spe">所在部门</th>
          </tr>
          <tr>
          <%
            //连接数据库
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //定义查询语句 
            String sqls="select uid,uname,uidnum,uphone,uad,[USER].did,dname from [USER],[DEPARTMENT] where [USER].did=[DEPARTMENT].did";
            //执行查询语句
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//若rs.next()能获得查询结果，循环输出查询到的用户信息
		 	for(int i=1;rs.next();i++)
			{
	 		    //取得SELECT语句查询到的结果
	 		    String uid    = rs.getString(1);
	 		    String uname  = rs.getString(2);
                String uidnum = rs.getString(3);
                String uphone = rs.getString(4);
                String uad    = rs.getString(5);
                String dname  = rs.getString(7);
                //输出查询结果
	 		    out.print("<td class='spe'><input type=checkbox name=check value="+uid+"></td>");
	 		    out.print("<td class='spe'>"+i+"</td>");
	 		    out.print("<td class='spe'>"+uid+"</td>");
	 		    out.print("<td class='spe'>"+uname+"</td>");
	 		    out.print("<td class='spe'>"+uidnum+"</td>");
	 		    out.print("<td class='spe'>"+uphone+"</td>");
	 		    out.print("<td class='spe'>"+uad+"</td>");
	 	     	out.print("<td class='spe'>"+dname+"</td>");
	 		    out.print("</tr>");
	 		}
	 	    out.print("</table>");
	 	    rs.close();
	 	    stmt.close();
	 	    conn.close();
	 	    }
	 	  %>
	      </tr>
	   </table>
	   <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="删除用户" /></td>
          </tr>
        </table>
      </form>
      <table>
          <tr>
            <td>
              <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="管理员页面" />管理员页面</a>
            </td>
          </tr>
      </table>
    </div>
   
  </body>
</html>