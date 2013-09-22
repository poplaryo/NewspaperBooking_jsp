<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>CheckLogin</title>
  </head>
  <body>
      <div>
        <%
          //获取表单中的变量
          String id=(String)request.getParameter("id");
          String pass=(String)request.getParameter("pass");
          String identity=(String)request.getParameter("identity");
      
          try{
              //连接数据库
              //连接驱动，连接端口及将要连接的数据库名称
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
              String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook";
              
              //为不同的身份设置不同的登录名和密码
              if(identity.equals("student"))
              { 
                  //用户身份的登录名和密码
                  String dbname="nb_user";
                  String dbpass="user"; 
                  Connection conn = DriverManager.getConnection(url, dbname, dbpass);
                  //定义查询语句 
                  String sqls="select * from [USER] where UID='"+id+"' and UPASS='"+pass+"'";
                  //执行查询语句
                  Statement stmt = conn.createStatement();        
                  ResultSet rs = stmt.executeQuery(sqls);
                  if(null == rs)
                  {
                      //测试查询为空
                      System.out.println("null!");
                  }

                  //k为查询到的记录数
                  int k=0;
                  if(rs.next())    k=k+1;
     
                  //如果查询记录数大于0则跳转到User.jsp,否则重新回到输入页面
                  if(k>0)        
                  {  
                      session.setAttribute("uid",id);
                      response.sendRedirect("User/User.jsp");
                  } 
                  else
                  {
                      %>
                          <Script Language="JavaScript">
                              alert("用户账号，用户密码或用户身份输入错误，请重新登录！");
                              window.location.href="Login.html"; 
                          </Script>
                      <%  
                  }
                  conn.close();
              } 
              else
              { 
                  //管理员身份的登录名和密码
                  String dbname="nb_admin";
                  String dbpass="admin"; 
                  Connection conn = DriverManager.getConnection(url, dbname, dbpass);
                  //定义查询语句 
                  String sqls="select * from [ADMIN] where AID='"+id+"' and APASS='"+pass+"'";
                  //执行查询语句
                  Statement stmt = conn.createStatement();        
                  ResultSet rs = stmt.executeQuery(sqls);
                  if(null == rs)
                  {
                      //测试查询为空
                      System.out.println("null!");
                  }

                  //k为查询到的记录数
                  int k=0;
                  if(rs.next())    k=k+1;
     
                  //如果查询记录数大于0则跳转到Admin.jsp,否则重新回到输入页面
                  if(k>0)        
                  {   
                      session.setAttribute("aid",id);
                      response.sendRedirect("Admin/Admin.jsp");
                  } 
                  else
                  {
                      %>
                          <Script Language="JavaScript">
                              alert("用户账号，用户密码或用户身份输入错误，请选择其他操作！");
                              window.location.href="Index.html"; 
                          </Script>
                      <%  
                  }
                  conn.close();
              }
          }catch(Exception e){
              out.println(e.toString());
          }
        %>    
      </div>
  </body>
</html>
