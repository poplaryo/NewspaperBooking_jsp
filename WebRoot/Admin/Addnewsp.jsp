<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>添加报刊</title>
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
                        alert("添加报刊失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>
    </div>
    <div>
      <h1>报刊订阅管理系统——添加报刊</h1><br />
      <form name="myform_7" method="post" onsubmit="return checkinput(this);" action="Checkadd.jsp">
        <table>
          <tr>
            <td>报&nbsp;刊&nbsp;号 &nbsp;：</td>
            <td><input type="text" name="nid" maxlength="5"/></td>
            <td class="spe2">请输入报刊号(5位)</td>
          </tr>
          <tr>
            <td>报刊名称：</td>
            <td><input type="text" name="nname" maxlength="20"/></td>
            <td class="spe2">请输入报刊名称(20位)</td>
          </tr>
          <tr>
            <td>出版报社：</td>
            <td><input type="text" name="nps" maxlength="20"/></td>
            <td class="spe2">请输入出版报社名称(20位)</td>
          </tr>
          <tr>
            <td>出版周期：</td>
            <td><input type="text" name="npd" maxlength="3"/></td>
            <td class="spe2">(以天为单位)，请输入数字</td>
          </tr>
          <tr>
            <td>季度报价：</td>
            <td><input type="text" name="nct" maxlength="3"/></td>
            <td class="spe2">(以元为单位)，请输入数字</td>
          </tr>
          <tr>
            <td>内容介绍：</td>
            <td><input type="text" name="npr" maxlength="30"/></td>
            <td class="spe2">请输入报刊号(5位)</td>
          </tr>
          <tr>
            <td>可订份数：</td>
            <td><input type="text" name="nnum" maxlength="3"/></td>
            <td class="spe2">(以份为单位)，请输入数字</td>
          </tr>
          <tr>
            <td>分类名称：</td>
            <td><select name="sid" >
                    <option value="01">时事新闻 </option>                 
                    <option value="02">经济新闻</option>
                    <option value="03">娱乐新闻</option>
                    <option value="04">体育新闻 </option>
                    <option value="05">科普新闻 </option>  
                    <option value="06">健康新闻</option>                 
                    <option value="07">国外新闻</option>        
                 </select>
            </td>
            <td class="spe2">请选择报刊类别</td>
          </tr>
          <tr>
             <td></td>
             <td><input type="submit" value="确认添加" /></td>
             <td></td>
          </tr>
        </table> 
                               
      </form>
      <table>
          <tr>
            <td>
              <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="管理员页面" />管理员页面</a>
            </td>
            <td>
              <a href="Newsp_a.jsp"><img class="small" src="../pics/newsp.ico" alt="查看报刊" />查看报刊</a>
            </td>
          </tr>
      </table>
    </div>
    
    <script type="text/javascript"> 
	  function checkinput(myform_7)
      {
         //是否输入用户账号
         if(myform_7.nid.value=="")
         {
           alert("报刊号输入格式错误!");
           return false;
         }
         if(myform_7.nname.value=="")
         {
           alert("报刊名称报刊号输入格式错误!");
           return false;
         }
         if(myform_7.nps.value=="")
         {
           alert("出版报社报刊号输入格式错误!");
           return false;
         }
         if(myform_7.npd.value=="")
         {
           alert("出版周期报刊号输入格式错误!");
           return false;
         }
         if(myform_7.nct.value=="")
         {
           alert("季度报价报刊号输入格式错误!");
           return false;
         }
         if(myform_2.npr.value=="")
         {
           alert("内容介绍报刊号输入格式错误!");
           return false;
         }
         if(myform_2.nnum.value=="")
         {
           alert("可订份数报刊号输入格式错误!");
           return false;
         }
         if((!isN(docment.myform_7.npd))||(!isN(docment.myform_7.npd))||(!isN(docment.myform_7.npd)))
         {  
           alert("出版周期，季度报价，可订份数的输入只能为数字!");
           return false;
         }  
      }
      function isN(str){
         reg = /^d{1,3}$/;
         reg.test(str);
      }
     </script>
  </body>
</html>