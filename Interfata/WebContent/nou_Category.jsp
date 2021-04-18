<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Categorie</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String nume_categorie = request.getParameter("nume_categorie");
            String popularitate_gen = request.getParameter("popularitate_gen");
            String audienta_tinta = request.getParameter("audienta_tinta");
            if (nume_categorie != null) {
                jb.connect();
                jb.adaugaCategorie(nume_categorie, popularitate_gen, audienta_tinta);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Categories.</h1>
        <form action="nou_Category.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Categorie (Camp obligatoriu):</td>
                    <td> <input type="text" name="nume_categorie" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Popularitate Gen:</td>
                    <td> <input type="text" name="popularitate_gen" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Audienta Tinta:</td>
                    <td> <input type="text" name="audienta_tinta" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Categoria" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Revino la pagina principala</b></a>
        <br/>
    </body>
</html>