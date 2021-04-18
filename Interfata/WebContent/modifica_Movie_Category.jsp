<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Movie Category</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Movie Category:</h1>
        <br/>
        <p align="center"><a href="nou_Movie_Category.jsp"><b>Adauga Categorie Film.</b></a> <a href="index.html"><b>Revino la pagina principala</b></a></p>
        <form action="m1_Movie_Category.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>MovieCategotyId:</b></td>
                    <td><b>MovieId:</b></td>
                    <td><b>Titlu:</b></td>
                    <td><b>Buget:</b></td>
                    <td><b>Venituri:</b></td>
                    <td><b>Rating:</b></td>
                    <td><b>Popularitate:</b></td>
                    <td><b>CategoryId:</b></td>
                    <td><b>NumeCategorie:</b></td>
                    <td><b>PopularitateGen:</b></td>
                    <td><b>AudientaTinta:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeMovieCategory();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("movie_category_id");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("movie_id")%></td>
                    <td><%= rs.getString("titlu")%></td>
                    <td><%= rs.getInt("buget")%></td>
                    <td><%= rs.getInt("venituri")%></td>
                    <td><%= rs.getInt("rating")%></td>
                    <td><%= rs.getString("popularitate")%></td>
                    <td><%= rs.getString("category_id")%></td>
                    <td><%= rs.getString("nume_categorie")%></td>
                    <td><%= rs.getString("popularitate_gen")%></td>
                    <td><%= rs.getString("audienta_tinta")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Revino la pagina principala</b></a>
            <br/>
        </p>
    </body>
</html>