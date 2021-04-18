<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Categories</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Categories:</h1>
        <br/>
        <p align="center"><a href="nou_Category.jsp"><b>Adauga o noua categorie.</b></a> <a href="index.html"><b>Revino la pagina principala</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("category_id"));
            String Nume_Categorie = request.getParameter("nume_categorie");
            String Popularitate_Gen = request.getParameter("popularitate_gen");
            String Audienta_Tinta = request.getParameter("audienta_tinta");

            String[] valori = {Nume_Categorie, Popularitate_Gen, Audienta_Tinta};
            String[] campuri = {"nume_categorie", "popularitate_gen", "audienta_tinta"};
            jb.modificaTabela("categories", "category_id", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Revino la pagina principala</b></a>
            <br/>
    </body>
</html>