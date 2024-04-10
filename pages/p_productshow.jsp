<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
  <head>
  <title>產品瀏覽</title> 

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
    padding: 30px;
}

h1
{
	padding-left:10px;
}


</style>
  </head>
  <body>
        <h1>所有商品</h1>
      
<%
		  Class.forName("com.mysql.jdbc.Driver");
          String url="jdbc:mysql://localhost/";
          Connection con=DriverManager.getConnection(url,"root","1234");
          String sql="USE demo";
          request.setCharacterEncoding("utf-8");
          con.createStatement().execute(sql);

					
							sql="SELECT * FROM product "; //挑出資料庫中相似的影片名稱
							ResultSet rs =  con.createStatement().executeQuery(sql);
							rs.last();														//移到檔尾, getRow()後, 就可知道共有幾筆記錄
							int RowCount = rs.getRow();                                    //RowCount=共有幾筆資料
							rs.beforeFirst();												//再回到檔首
							if(RowCount>=1)													//如果資料數大於1
							{
								
								while(rs.next())
								{%>
									<div class="col message_border ">
										<img src="<%=rs.getString("img1") %> " class="product" width="290" height="250"><br>

										<p>產品編號：<%=rs.getString("product_ID") %></p>
							
										<p>產品名稱：<%=rs.getString("name") %></p>
										<p>產品成分：<%=rs.getString("raw_materials") %></p>
										<p>產品特色：<%=rs.getString("feature") %></p>
										<p>產品價格：<%=rs.getString("price")+ "元" %></p>
										<p>產品最佳賞味期：<%=rs.getString("expiration_date")+"天" %></p>
										<p>產品庫存：<%=rs.getString("inventory")+"個" %></p>
										
									</div>
									
							<%
							}
							}

%>
        

      
  

      




      


  </body>
</html>