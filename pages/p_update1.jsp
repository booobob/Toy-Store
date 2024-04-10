<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
    <head>
        <title>商品修改</title>
    </head>
    <body>      
	   <%  		
	      Class.forName("com.mysql.jdbc.Driver");
          String url="jdbc:mysql://localhost/";
          Connection con=DriverManager.getConnection(url,"root","1234");
          String sql="USE demo";
          request.setCharacterEncoding("utf-8");
          con.createStatement().execute(sql);
		  
					String product_ID=request.getParameter("product_ID");
           			String type1=request.getParameter("type");
                    String name=request.getParameter("name"); 
					String raw_materials=request.getParameter("raw_materials");
                    String feature=request.getParameter("feature");
					String price=request.getParameter("price");
					String inventory=request.getParameter("inventory");
					String expiration_date=request.getParameter("expiration_date");
                    String img1=request.getParameter("img1");
                    String img2=request.getParameter("img2");
                    String img3=request.getParameter("img3");
                    String bg=request.getParameter("bg");

					
					sql = "UPDATE product SET type = '"+type1+"',name = '"+name+"',raw_materials = '"+raw_materials+"',feature = '"+feature+"',price = '"+price+"',inventory = '"+inventory+"',expiration_date = '"+expiration_date+"',img1 = '"+img1+"',img2 = '"+img2+"',img3 = '"+img3+"',bg = '"+bg+"' WHERE product_ID = '"+product_ID+"' ";

             con.createStatement().execute(sql);
				
        	 // 顯示結果          
         		out.print("<script>alert('新增成功'); window.location='addproduct.jsp' </script>");
    		}
    		else{
			out.println("<script>alert('你尚未登入!!');window.location='login.jsp'</script>");
			}
         		
                con.close();
%>

       
    </body>
</html>
