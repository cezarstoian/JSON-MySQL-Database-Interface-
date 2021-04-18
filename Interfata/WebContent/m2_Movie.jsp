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
        <h1 align="center"> Tabela Movies:</h1>
        <br/>
        <p align="center"><a href="nou_Movies.jsp"><b>Adauga un nou film.</b></a> <a href="index.html"><b>Revino la pagina principala</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("movie_id"));
            String Titlu = request.getParameter("titlu");
            String Buget = request.getParameter("buget");
            String Venituri = request.getParameter("venituri");
            String Rating = request.getParameter("rating");
            String Popularitate = request.getParameter("popularitate");

            String[] valori = {Titlu, Buget, Venituri, Rating, Popularitate};
            String[] campuri = {"titlu", "buget", "venituri", "rating", "popularitate"};
            jb.modificaTabela("movies", "movie_id", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Revino la pagina principala</b></a>
            <br/>
    </body>
</html>