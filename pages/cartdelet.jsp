<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/";
			Connection con=DriverManager.getConnection(url,"root","1234");
			String productID = request.getParameter("productID");
			//String userID = (String) session.getAttribute("userID");
			String userID="1";
			String sql="USE toy";
			con.createStatement().execute(sql);
			
				sql="delete from cart where productID = '"+productID+"' AND userID='"+userID+"'";
                con.createStatement().execute(sql);
			    out.print("<script>alert('你刪除了這項商品'); window.location='shppping%20cart.jsp'</script>");
%>