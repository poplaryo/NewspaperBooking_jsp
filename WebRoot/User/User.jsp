<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>用户界面</title>
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
                        alert("未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——用户页面</h1><br /><br/>
      <h2>您好，<% out.println(uid);%>用户，您已登录成功！请选择相应操作。
      </h2><br/><br/>
      <table>
        <tr>
          <td>
            <a href="../Logout.jsp"><img class="small" src="../pics/logout.ico" alt="退出系统" />退出系统</a>
          </td>
          <td>
            <a href="Changepass.jsp"><img class="small" src="../pics/changepass.ico" alt="修改密码" />修改密码</a>
          </td>
          <td>
            <a href="UserInfo.jsp"><img class="small" src="../pics/userinfo.ico" alt="个人信息" />个人信息</a>
          </td>
        </tr>
        <tr>
          <td>
            <a href="Newsp_u.jsp"><img class="small" src="../pics/newsp.ico" alt="查看报刊" />查看报刊</a>
          </td>
          <td>
            <a href="Bookinfo_u.jsp"><img class="small" src="../pics/booking.ico" alt="订阅信息" />订阅信息</a>
          </td>
          <td></td>
        </tr>
      </table>
    </div>
  </body>
</html>