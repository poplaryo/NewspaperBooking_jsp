<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>报刊信息</title>
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
                        alert("查看报刊失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>   
    </div>
    <div>
      <h1>报刊订阅管理系统——报刊信息</h1><br />
      <h3>勾选用户信息的选择框可删除相应报刊，每次只能订阅一种报刊。</h3>
      <form name="myform_8" method="post"  onsubmit="return checkinput(this);" action="Booking.jsp">
        <table class="spe">
          <tr>
            <th class="spe">选择</th>
            <th class="spe">序号</th>
            <th class="spe">报刊号</th>
            <th class="spe">报刊名称</th>
            <th class="spe">出版报社</th>
            <th class="spe">出版周期</th>
            <th class="spe">季度报价</th>
            <th class="spe">内容介绍</th>
            <th class="spe">可订份数</th>
            <th class="spe">分类名称</th>
          </tr>
          <tr>
          <%
            //连接数据库
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //定义查询语句 
            String sqls="SELECT NID,NNAME,NPS,NPD,NCT,NPR,NNUM,SNAME FROM [NEWSPAPER],[SORT] WHERE [NEWSPAPER].SID=[SORT].SID";
            //执行查询语句
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//若rs.next()能获得查询结果，循环输出查询到的用户信息
		 	for(int i=1;rs.next();i++)
			{
	 		    //取得SELECT语句查询到的结果
	 		    String nid    = rs.getString(1);
	 		    String nname  = rs.getString(2);
                String nps    = rs.getString(3);
                String npd    = rs.getString(4);
                String nct    = rs.getString(5);
                String npr    = rs.getString(6);
                String nnum   = rs.getString(7);
                String sname  = rs.getString(8);
                //输出查询结果
	 		    out.print("<td class='spe'><input type='radio' name='choice' value="+nid+"></td>");
	 		    out.print("<td class='spe'>"+i+"</td>");
	 		    out.print("<td class='spe'>"+nid+"</td>");
	 		    out.print("<td class='spe'>"+nname+"</td>");
	 		    out.print("<td class='spe'>"+nps+"</td>");
	 		    out.print("<td class='spe'>"+npd+"</td>");
	 		    out.print("<td class='spe'>"+nct+"</td>");
	 	     	out.print("<td class='spe'>"+npr+"</td>");
	 	     	out.print("<td class='spe'>"+nnum+"</td>");
	 	     	out.print("<td class='spe'>"+sname+"</td>");
	 		    out.print("</tr>");
	 		}
	 	    out.print("</table>");
	 	    rs.close();
	 	    stmt.close();
	 	    conn.close();
	 	  %>
	      </tr>
	   </table>
	   <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="订阅报刊" /></td>
          </tr>
        </table>
      </form>
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