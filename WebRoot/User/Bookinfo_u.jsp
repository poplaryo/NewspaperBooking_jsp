<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>订阅信息</title>
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
                        alert("查看失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else {
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——订阅信息</h1><br />
        <table class="spe">
          <tr>
            <th class="spe" colspan="5">用户账号：<% out.println(uid); %></th>
          </tr>
          <tr>
            <th class="spe">订单编号</th>
            <th class="spe">报刊号</th>
            <th class="spe">报刊名称</th>
            <th class="spe">订阅份数</th>
            <th class="spe">订阅月数</th>
          </tr>
          <tr>
          <%
            //连接数据库
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //定义查询语句 
            String sqls="SELECT BID,[BOOKING].NID,NNAME,BCT,BMONTH FROM [BOOKING],[USER],[NEWSPAPER] WHERE [USER].UID=[BOOKING].UID AND [NEWSPAPER].NID=[BOOKING].NID AND [USER].UID='"+uid+"'";
            //执行查询语句
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//若rs.next()能获得查询结果，循环输出查询到的用户信息
		 	for(int i=1;rs.next();i++)
			{
	 		    //取得SELECT语句查询到的结果
	 		    String bid    = rs.getString(1);
	 		    String nid    = rs.getString(2);
	 		    String nname  = rs.getString(3);
                String bct    = rs.getString(4);
                String bmonth = rs.getString(5);
                //输出查询结果
	 		    out.print("<td class='spe'>"+bid+"</td>");
	 		    out.print("<td class='spe'>"+nid+"</td>");
	 		    out.print("<td class='spe'>"+nname+"</td>");
	 		    out.print("<td class='spe'>"+bct+"</td>");
	 		    out.print("<td class='spe'>"+bmonth+"</td>");
	 		    out.print("</tr>");
	 		
	 	    }
	 	    out.print("</table>");
	 	    rs.close();
	 	    stmt.close();
	 	    conn.close();
	 	    }
	 	  %>
	      </tr>
	   </table><br/><br/>
      <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/admin.ico" alt="用户页面" />用户页面</a>
            </td>
            <td>
            </td>
          </tr>
      </table>
    </div>
   
  </body>
</html>