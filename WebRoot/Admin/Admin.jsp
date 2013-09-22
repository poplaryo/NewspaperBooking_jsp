<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>管理员界面</title>
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
                        alert("未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>
    </div>
    <div class="text">
      <h1>报刊订阅管理系统——管理员页面</h1><br /><br/>
      <h2>您好，<% out.println(aid);%>管理员，您已登录成功！请选择相应操作。
      </h2>
    </div>
    <table>
        <tr>
          <td>
            <a href="../Logout.jsp"><img class="small" src="../pics/logout.ico" alt="退出系统" />退出系统</a>
          </td>
          <td>
            <a href="Changepass_a.jsp"><img class="small" src="../pics/changepass.ico" alt="修改密码" />修改密码</a>
          </td>
          <td>
            <a href="Getuser.jsp"><img class="small" src="../pics/getuser.ico" alt="用户信息" />用户信息</a>
          </td>
          <td>
            <a href="Bookinfo_a.jsp"><img class="small" src="../pics/booking.ico" alt="订阅信息" />订阅信息</a> 
          </td>
        </tr>
        <tr>
          <td>
            <a href="Newsp_a.jsp"><img class="small" src="../pics/newsp.ico" alt="查看报刊" />查看报刊</a>
          </td>
          <td>
            <a href="Addnewsp.jsp"><img class="small" src="../pics/addnewsp.ico" alt="添加报刊" />添加报刊</a>
          </td>
          <td>
            <a href="Statistics.jsp"><img class="small" src="../pics/getuser.ico" alt="统计信息" />统计信息</a>
          </td>
          <td></td>
        </tr>
      </table>
  </body>
</html>