<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>CheckAdd</title>
  </head>
  
  <body>
      <div class="right-top">
                                 管理员账号：
      <% 
          String aid=(String)session.getAttribute("aid");
          out.println(aid);
          if(aid==null)
          {
             %>
                 <Script Language="JavaScript">
                        alert("添加报刊失败。未登录系统，请先登录！");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
          }else if(aid.equals("admin_2")){
          //获取表单中的变量
          request.setCharacterEncoding("gb2312");
          String nid   = (String)request.getParameter("nid");
          String nname = (String)request.getParameter("nname");
          String nps   = (String)request.getParameter("nps");
          int npd      = new Integer(request.getParameter("npd")).intValue();
          int nct      = new Integer(request.getParameter("nct")).intValue();
          String npr   = (String)request.getParameter("npr");
          int nnum     = new Integer(request.getParameter("nnum")).intValue();
          String sid   = (String)request.getParameter("sid"); 
      
          //连接数据库
          //连接驱动，连接端口及将要连接的数据库名称
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin";
          Connection conn = DriverManager.getConnection(url);
              
          //定义查询语句 
          String sqls="select * from [NEWSPAPER] where NID='"+nid+"'";
          //执行查询语句
          Statement stmt = conn.createStatement();        
          ResultSet rs   = stmt.executeQuery(sqls);
          if(rs.next())  
            {
              %>
                <Script Language="JavaScript">
                alert("系统已存在输入的报刊号，请重新输入信息！！");
                window.location.href="Addnewsp.jsp"; 
              </Script>
              <%
            }  
          else
          {
            //定义插入语句 
            String sql_in="INSERT [NEWSPAPER] VALUES('"+nname+"','"+nid+"','"+nps+"','"+npd+"','"+nct+"','"+npr+"','"+nnum+"','"+sid+"','"+aid+"')";
            //执行插入语句
            Statement stmtin = conn.createStatement(); 
            stmtin.executeUpdate(sql_in);
            stmtin.close();  
            %>
              <Script Language="JavaScript">
                alert("添加成功！");
                window.location.href="Newsp_a.jsp"; 
              </Script>
            <%
          }
          rs.close();    
          stmt.close();
          conn.close();
          }else{
                %>
                    <Script Language="JavaScript">
                        alert("管理员权限不足，无法添加报刊！");
                        window.location.href="Admin.jsp"; 
                    </Script>
                    
                <%
            }
          
          
      %>    
      </div>
  </body>
</html>