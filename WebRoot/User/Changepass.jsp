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
    <div class="right-top">
                    用户账号：
      <% String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("修改密码失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——修改密码</h1><br /><br/>
      <form name="myform_3" method="post" onsubmit="return checkinput(this);" action="Changepass_2.jsp">
        <table>
          <tr>
            <td>用户账号：</td>
            <td><% out.println(uid); %></td>
          </tr>
          <tr>
            <td>请输入原密码：</td>
            <td><input type="password" name="pass_1" /></td>
          </tr>
          <tr>
            <td>请输入新密码：</td>
            <td><input type="password" name="pass_2" /></td>
          </tr>
          <tr>
            <td>请确认新密码：</td>
            <td><input type="password" name="pass_3" /></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="确认" /></td>
          </tr>
          </table>
        </form>
        <script type="text/javascript"> 
	      function checkinput(myform_3)
          {
             if(myform_3.pass_1.value=="")
             {
               alert("请输入现有密码!");
               return false;
             }
             if(myform_3.pass_2.value==""||myform_3.pass_3.value=="")
             {
               alert("新密码不能为空!");
               return false;
             }
             if(myform_3.pass_2.value != myform_3.pass_3.value)
             {
               alert("新密码两次输入不一致，请重新输入!");
               return false;
             }
          }
     </script>
     <table>
        <tr>
          <td>
            <a href="User.jsp"><img class="small" src="../pics/user.ico" alt="用户界面" />用户界面</a>
          </td>
        </tr>
      </table>   
    </div>
  </body>
</html>