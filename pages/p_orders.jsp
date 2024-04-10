<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
  <head>
    <title>訂單管理</title>
	
<style type="text/css">
body 
{
  background-color: #ffffff;
  margin-top: 30px;
  margin-left: 50px;
  font-family: 標楷體;
}
.message_border {
    border-top-style: dotted;
    border-color: #D5D4D5;
    padding: 10px;
}

h1
{
	padding-left:10px;
}


</style>
  </head>
  <body>
        <h1>所有訂單</h1>   
          <%

          Class.forName("com.mysql.jdbc.Driver");
          String url="jdbc:mysql://localhost/";
          Connection con=DriverManager.getConnection(url,"root","1234");
          String sql="USE demo";
          request.setCharacterEncoding("utf-8");
          con.createStatement().execute(sql);
         
					
		  sql="select distinct orders.order_id,ordersdetail.* from orders,  ordersdetail where  orders.order_id = ordersdetail.order_id";
      ResultSet rs=con.createStatement().executeQuery(sql);
        

      //sql="select * from orders, product where order_id='" + rs.getString("order_id")+ "' AND orders.product_ID = product.product_ID ";								
								
								while(rs.next())
								{%>
									<div class="col message_border">

                    <p>訂單編號：<%=rs.getString("order_id") %></p>
                    <p>收件人 :<%=rs.getString("buyer")%></p>
										<p>收件人電話 :<%=rs.getString("tel")%></p>
										<p>收件人地址 :<%=rs.getString("address")%></p>
                    <%
										sql="select * from orders, product where order_id='" + rs.getString("order_id")+ "' AND orders.product_ID = product.product_ID ";
                    ResultSet rss=con.createStatement().executeQuery(sql);
                    while(rss.next()){%>
                      <p>商品名稱 : <%=rss.getString("name")%></p>
                      <%}%> 
									
										
									</div>
									
							<%
							}%>
        

      
  

      




      


  </body>
</html>