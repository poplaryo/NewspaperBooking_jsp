<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>删除用户</title>
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
                        alert("删除用户失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——删除用户</h1><br />
        <%
          //只有admin_1管理员拥有删除用户的权限
          if(aid.equals("admin_1")){
            //连接数据库
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
            
            //取出复选框选中的值
            String result[]=request.getParameterValues("check");
            if(result!=null)
            {
                 for(int i=0;i<result.length;i++){  
                    String sql="DELETE  FROM [USER] WHERE uid='"+result[i]+"'";
                    Statement stmt = conn.createStatement();
                    stmt.executeUpdate(sql);
                    stmt.close();
                 } 
                 %>
                   <Script Language="JavaScript">
                     alert("删除成功！");
                     window.location.href="Getuser.jsp"; 
                   </Script>
                 <%   
            }
            else{
                %>
                  <Script Language="JavaScript">
                    alert("未选择删除的用户！");
                    window.location.href="Getuser.jsp"; 
                  </Script>
                <%
            }
            conn.close();
          }else{
                %>
                    <Script Language="JavaScript">
                        alert("管理员权限不足，无法删除用户信息！");
                        window.location.href="Admin.jsp"; 
                    </Script>
                    
                <%
          }
          }
	 	  %>
    </div>
  </body>
</html>