<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Categories</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Categories:</h1>
	<br />
	<p align="center">
		<a href="nou_Category.jsp"><b>Adauga o noua categorie</b></a>
	</p>
	<form action="sterge_Category.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Category_id:</b></td>
				<td><b>Nume categorie:</b></td>
				<td><b>Popularitate gen:</b></td>
				<td><b>Audienta tinta:</b></td>

			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("categories");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("category_id");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("nume_categorie")%></td>
				<td><%= rs.getString("popularitate_gen")%></td>
				<td><%= rs.getString("audienta_tinta")%></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	
	
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	<p align="center">
		<a href="index.html"><b>Revino la pagina principala</b></a> <br />
	</p>
</body>
</html>