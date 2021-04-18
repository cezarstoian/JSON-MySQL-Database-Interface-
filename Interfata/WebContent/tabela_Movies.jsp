<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Movies</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Movies:</h1>
	<br />
	<p align="center">
		<a href="nou_Movies.jsp"><b>Adauga un nou film</b></a>
	</p>
	<form action="sterge_Movies.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Movie_id:</b></td>
				<td><b>Titlu:</b></td>
				<td><b>Buget:</b></td>
				<td><b>Venituri:</b></td>
				<td><b>Rating:</b></td>
				<td><b>Popularitate:</b></td>

			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("movies");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("movie_id");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("titlu")%></td>
				<td><%= rs.getInt("buget")%></td>
				<td><%= rs.getInt("venituri")%></td>
				<td><%= rs.getInt("rating")%></td>
				<td><%= rs.getString("popularitate")%></td>
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