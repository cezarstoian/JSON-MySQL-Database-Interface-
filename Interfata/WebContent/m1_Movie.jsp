<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Movies</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Movies:</h1>
        <br/>
        <p align="center"><a href="nou_Movies.jsp"><b>Adauga un nou Film.</b></a> <a href="index.html"><b>Revino la pagina principala</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("movies", "movie_id", aux);
            rs.first();
            String Titlu = rs.getString("titlu");
            int Buget = rs.getInt("buget");
            int Venituri = rs.getInt("venituri");
            int Rating = rs.getInt("rating");
            String Popularitate = rs.getString("popularitate");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Movie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Movie_id:</td>
                    <td> <input type="text" name="movie_id" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Titlu:</td>
                    <td> <input type="text" name="titlu" size="30" value="<%= Titlu%>"/></td>
                </tr>
                <tr>
                    <td align="right">Buget:</td>
                    <td> <input type="text" name="buget" size="30" value="<%= Buget%>"/></td>
                </tr>
                <tr>
                    <td align="right">Venituri:</td>
                    <td> <input type="text" name="venituri" size="30" value="<%= Venituri%>"/></td>
                </tr>
                <tr>
                    <td align="right">Rating:</td>
                    <td> <input type="text" name="rating" size="30" value="<%= Rating%>"/></td>
                </tr>
                <tr>
                    <td align="right">Popularitate:</td>
                    <td> <input type="text" name="popularitate" size="30" value="<%= Popularitate%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Revino la pagina principala</b></a>
            <br/>
    </body>
</html>