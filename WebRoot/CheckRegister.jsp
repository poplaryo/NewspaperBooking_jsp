<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>CheckRegister</title>
  </head>
  
  <body>
      <div>
        <%
          //获取表单中的变量
          request.setCharacterEncoding("gb2312");
          String uid    = (String)request.getParameter("uid");
          String upass  = (String)request.getParameter("upass");
          String uname  = (String)request.getParameter("uname");
          String uidnum = (String)request.getParameter("uidnum");
          String uphone = (String)request.getParameter("uphone");
          String uad    = (String)request.getParameter("uad");
          String did    = (String)request.getParameter("did"); 
          String aid    = "admin_1";
          if(uid.equals("")||upass.equals("")||uname.equals("")||uidnum.equals("")||uphone.equals("")||uad.equals(""))
          {
            %>
              <Script Language="JavaScript">
                alert("表中各项输入不能为空，请重新输入！");
                window.location.href="Register.html"; 
              </Script>
            <%
          }else{  
              //连接数据库
              //连接驱动，连接端口及将要连接的数据库名称
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
              String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_reg;password=register";
              Connection conn = DriverManager.getConnection(url);
              
              //定义查询语句 
              String sqls="select * from [USER] where UID='"+uid+"'";
              //执行查询语句
              Statement stmt = conn.createStatement();        
              ResultSet rs = stmt.executeQuery(sqls);
              if(rs.next())
              {
                      %>
                          <Script Language="JavaScript">
                              alert("系统已存在此用户账号，请选择其他操作！");
                              window.location.href="Index.html"; 
                          </Script>
                      <% 
              }
              else
              {
                  //定义插入语句 
                  String sql_in="insert [USER] values('"+uid+"','"+upass+"','"+uname+"','"+uidnum+"','"+uphone+"','"+uad+"','"+did+"','"+aid+"')";
                  //执行插入语句
                  Statement stmtin = conn.createStatement(); 
                  stmtin.executeUpdate(sql_in);
                  stmtin.close();  
                  %>
                      <Script Language="JavaScript">
                          alert("注册成功，请登录！");
                          window.location.href="Login.html"; 
                      </Script>
                  <%
              }
              rs.close();    
              stmt.close();
              conn.close();
          } 
        %>    
      </div>
  </body>
</html>