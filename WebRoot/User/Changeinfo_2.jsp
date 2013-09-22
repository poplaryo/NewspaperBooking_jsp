<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>修改个人信息</title>
  </head>
  
  <body>
      <div class="right-top">
                               用户账号： 
        <% 
          String uid=(String)session.getAttribute("uid");
          out.println(uid);
         
          //连接数据库
          //连接驱动，连接端口及将要连接的数据库名称
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user";
          Connection conn = DriverManager.getConnection(url);
          
          //定义查询语句 
          String sqls="select uid,uname,uidnum,uphone,uad,[USER].did,dname from [USER],[DEPARTMENT] where UID='"+uid+"' and [USER].did=[DEPARTMENT].did";
          //执行查询语句
          Statement stmt = conn.createStatement();        
          ResultSet rs = stmt.executeQuery(sqls);
          if(rs.next())
          {
            //获取当前用户的信息
            String uname_1  = rs.getString(2);
            String uidnum_1 = rs.getString(3);
            String uphone_1 = rs.getString(4);
            String uad_1    = rs.getString(5);
            String did_1    = rs.getString(6);
            
            //获取表中填入的数据
            request.setCharacterEncoding("gb2312");
            String uname  = (String)request.getParameter("uname");
            String uidnum = (String)request.getParameter("uidnum");
            String uphone = (String)request.getParameter("uphone");
            String uad    = (String)request.getParameter("uad");
            String did    = (String)request.getParameter("did"); 
            
            //验证表中是否填入数据，若无填入新数据，则原有数据不修改
            if(uname=="" ||uname.equals(null))    uname  = uname_1;
            if(uidnum==""||uidnum.equals(null))   uidnum = uidnum_1;
            if(uphone==""||uphone.equals(null))   uphone = uphone_1;
            if(uad==""   ||uad.equals(null))      uad    = uad_1;
            if(did==""   ||did.equals(null))      did    = did_1;
            
            //定义插入语句 
            String sqlup="UPDATE [USER] SET  uname='"+uname+"',uidnum='"+uidnum+"',uphone='"+uphone+"',uad='"+uad+"',did='"+did+"' WHERE uid='"+uid+"'";
            //执行插入语句
            Statement stmtup = conn.createStatement(); 
            stmtup.executeUpdate(sqlup);
            stmtup.close();
          }
          //若当前无用户登录，则输出找不到用户
          else{
            %>
              <Script Language="JavaScript">
                alert("找不到用户，请重新登录！");
                window.location.href="../Login.html";
              </Script>
            <%
          }
          stmt.close();
          rs.close();
          conn.close(); 
        %>
        <Script Language="JavaScript">
            alert("修改成功！");
            window.location.href="UserInfo.jsp";
        </Script>
            
      </div>
  </body>
</html>