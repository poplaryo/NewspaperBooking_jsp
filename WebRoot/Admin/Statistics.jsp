<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>统计信息</title>
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
                        alert("查看统计信息失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
         //连接数据库
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——统计信息</h1><br />
        <table class="spe">
          <tr>
            <th class="spe" colspan="2">部门订阅统计</th>
          </tr>
          <tr>
            <th class="spe">部门名称</th>
            <th class="spe">订阅份数</th>
          </tr>
          <tr>
          <%
             //定义查询语句 
             String sql_1="SELECT [部门名称],[订阅总数] FROM [ST_DEP]";
             //执行查询语句
             Statement stmt_1 = conn.createStatement();        
             ResultSet rs_1 = stmt_1.executeQuery(sql_1);
             //若rs.next()能获得查询结果，循环输出查询到的用户信息
		 	 for(int i=1;rs_1.next();i++)
			 {
	 		    //取得SELECT语句查询到的结果
	 		    String dp_name = rs_1.getString(1);
	 		    String count_1 = rs_1.getString(2);
                //输出查询结果
	 		    out.print("<td class='spe'>"+dp_name+"</td>");
	 		    out.print("<td class='spe'>"+count_1+"</td>");
	 		    out.print("</tr>");
	 		
	 	     }
	 	     out.print("</table>");
	 	     rs_1.close();
	 	     stmt_1.close();
	 	  %>
	      </tr>
        </table><br/><br/>
	   <table class="spe">
	      <tr>
            <th class="spe" colspan="2">报刊分类订阅统计</th>
          </tr>
          <tr>
            <th class="spe">报刊分类</th>
            <th class="spe">订阅份数</th>
          </tr>
          <tr>
          <%
             //定义查询语句 
             String sql_2="SELECT [报刊类别],[订阅总数] FROM [ST_NSP]";
             //执行查询语句
             Statement stmt_2 = conn.createStatement();        
             ResultSet rs_2 = stmt_2.executeQuery(sql_2);
             //若rs.next()能获得查询结果，循环输出查询到的用户信息
		 	 for(int i=1;rs_2.next();i++)
			 {
	 		    //取得SELECT语句查询到的结果
	 		    String st_name = rs_2.getString(1);
	 		    String count_2 = rs_2.getString(2);
                //输出查询结果
	 		    out.print("<td class='spe'>"+st_name+"</td>");
	 		    out.print("<td class='spe'>"+count_2+"</td>");
	 		    out.print("</tr>");
	 		
	 	     }
	 	     out.print("</table>");
	 	     rs_2.close();
	 	     stmt_2.close();
	 	     conn.close();
	 	     }
	 	  %>
	      </tr>
	   </table><br/><br/>
      <table>
          <tr>
            <td>
              <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="管理员页面" />管理员页面</a>
            </td>
            <td>
            </td>
          </tr>
      </table>
    </div>
   
  </body>
</html>