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
        <h1 align="center">Tabela Categories:</h1>
        <br/>
        <p align="center"><a href="nou_Category.jsp"><b>Adauga o noua Categorie.</b></a> <a href="index.html"><b>Revino la pagina principala</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("categories", "category_id", aux);
            rs.first();
            String Nume_Categorie = rs.getString("nume_categorie");
            String Popularitate_Gen = rs.getString("popularitate_gen");
            String Audienta_Tinta = rs.getString("audienta_tinta");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Category.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Category_id:</td>
                    <td> <input type="text" name="category_id" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume Categorie:</td>
                    <td> <input type="text" name="nume_categorie" size="30" value="<%= Nume_Categorie%>"/></td>
                </tr>
                <tr>
                    <td align="right">Popularitate Gen:</td>
                    <td> <input type="text" name="popularitate_gen" size="30" value="<%= Popularitate_Gen%>"/></td>
                </tr>
                <tr>
                    <td align="right">Audienta Tinta:</td>
                    <td> <input type="text" name="audienta_tinta" size="30" value="<%= Audienta_Tinta%>"/></td>
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