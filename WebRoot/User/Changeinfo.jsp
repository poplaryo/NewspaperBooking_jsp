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
                               用户账号： <%
         String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("修改失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
        %>  
      </div>
      <div>
        <h1>报刊订阅管理系统——修改个人信息</h1><br />
        <h3>下表中，不作修改的信息不用填入。</h3>
        <form name="myform_2" method="post"  action="Changeinfo_2.jsp">
          <table>
            <tr>
              <td>用户姓名：</td>
              <td><input type="text" name="uname" maxlength="20"/></td>
            </tr>
            <tr>
              <td>身份证号：</td>
              <td><input type="text" name="uidnum" maxlength="18"/></td>
            </tr>
            <tr>
              <td>用户电话：</td>
              <td><input type="text" name="uphone" maxlength="12"/></td>
            </tr>
            <tr>
              <td>用户地址：</td>
              <td><input type="text" name="uad" maxlength="30"/></td>
            </tr>
            <tr>
              <td>所在部门：</td>
              <td><select name="did" >
                    <option value="KF001">开发一部 </option>                 
                    <option value="KF002">开发二部 </option>
                    <option value="KF003">开发三部 </option>
                    <option value="KF004">开发四部 </option>
                    <option value="KF005">开发五部 </option>  
                    <option value="KF006">开发六部 </option>                 
                    <option value="XQ101">需求一部 </option>
                    <option value="XQ102">需求二部 </option>
                    <option value="XQ103">需求三部 </option>
                    <option value="SJ201">设计一部 </option> 
                    <option value="SJ202">设计二部 </option>                 
                    <option value="SJ203">设计三部 </option>
                    <option value="SJ204">设计四部 </option>
                    <option value="CS301">测试一部 </option>
                    <option value="CS302">测试二部 </option>
                    <option value="CS303">测试三部 </option>
                    <option value="CS304">测试四部 </option>
                    <option value="BG401">版本管理一部 </option>
                    <option value="BG402">版本管理二部 </option>
                    <option value="YW501">运维一部 </option> 
                    <option value="YW502">运维二部 </option>
                    <option value="YW503">运维三部 </option>
                    <option value="YW504">运维四部 </option>
                    <option value="YW505">运维五部 </option>
                    <option value="YW506">运维六部 </option>           
                  </select>
              </td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" value="确认修改" /></td>
            </tr>
          </table>
          
      </form>
      <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/user.ico" alt="用户页面" />用户页面</a>
            </td>
          </tr>
      </table>
    </div>
  </body>
</html>