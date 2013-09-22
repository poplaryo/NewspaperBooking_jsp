<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>修改密码</title>
  </head>
  <body>
    <div class="right-top">管理员账号： 
      <% String aid=(String)session.getAttribute("aid");
         out.println(aid);
         if(aid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("修改密码失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>  
    </div>
      <%
          String pass_1 = (String)request.getParameter("pass_1");
          String pass_2 = (String)request.getParameter("pass_2");
          String pass_3 = (String)request.getParameter("pass_3");
          //连接数据库
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin";
          Connection conn = DriverManager.getConnection(url);
         
          //定义查询语句 
          String sqls="select apass from [ADMIN] where AID='"+aid+"'";
          //执行查询语句
          Statement stmt = conn.createStatement();        
          ResultSet rs   = stmt.executeQuery(sqls);
          if(rs.next())
          {
            String upass = rs.getString(1);
            //确认密码是否正确
            if(!upass.equals(pass_1))
            {
              %>
                <Script Language="JavaScript">
                  alert("原密码输入错误，请重新输入！");
                  window.location.href="Changepass.jsp"; 
                </Script>
              <%
            }
          }
          //定义修改密码语句
          String sqlch ="UPDATE [ADMIN]  SET apass='"+pass_2+"' WHERE AID='"+aid+"'";
          Statement stmtch = conn.createStatement();        
          stmtch.executeUpdate(sqlch);
          rs.close();
          stmtch.close();
          conn.close();
          }
          %>
            <Script Language="JavaScript">
              alert("密码修改成功！");
              window.location.href="Admin.jsp"; 
            </Script>
  </body>
</html>