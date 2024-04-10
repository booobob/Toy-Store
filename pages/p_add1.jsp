<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
       
<html>

<head>
    <title>產品新增JSP</title>
</head>
<body>

<%  
             Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost/";
            Connection con=DriverManager.getConnection(url,"root","1234");
            String sql="USE toy";
            request.setCharacterEncoding("utf-8");
            con.createStatement().execute(sql);
		
					String type=request.getParameter("type");
                    String name=request.getParameter("name"); 
					String ename=request.getParameter("Ename");
                    String theme=request.getParameter("theme");
					String themeEng=request.getParameter("themeEng");
					String introduction=request.getParameter("introduction");
                    String lines=request.getParameter("lines");
                    String price=request.getParameter("price");
                    String inventory=request.getParameter("inventory");
                    String img1=request.getParameter("img1");
                    String img2=request.getParameter("img2");
                    String img3=request.getParameter("img3");
	
					 sql="SELECT * FROM product WHERE prductCName = '"+name+"' ";  
                     ResultSet rs=con.createStatement().executeQuery(sql); 

                     sql ="INSERT product (prductCName,productEname,theme,introduction,lines,productprice,type,pic_path1,pic_path2,pic_path3,themeEng,inventory)" 
                        +" VALUES ('"+ name + "','"+ename+"','"+theme+"','"+introduction+"','"+lines+"','"+price+"','"+type+"','"+img1+"','"+img2+"','"+img3+"','"+themeEng+"','"+inventory+"')";
                    con.createStatement().execute(sql);                
         //Step 5: 顯示結果          
                out.print("<script>alert('新增成功'); window.location='addproduct.jsp' </script>");
                con.close();
                    %>
            </body>

            </html>