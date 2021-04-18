<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Film</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
        	int buget, venituri, rating;
            String titlu = request.getParameter("titlu");
            String buget1 = request.getParameter("buget");
            String venituri1 = request.getParameter("venituri");
            String rating1 = request.getParameter("rating");
            String popularitate = request.getParameter("popularitate");
            if (titlu != null) {
                jb.connect();
                jb.adaugaFilm(titlu, java.lang.Integer.parseInt(buget1), java.lang.Integer.parseInt(venituri1), java.lang.Integer.parseInt(rating1), popularitate);
                jb.disconnect();
        %> 
		<%-- 
		trebuie neaparat sa adaug bugetul, veniturile si ratingul ca sa mearga adaugarea
		--%>
		
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Movies.</h1>
        <form action="nou_Movies.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Titlu (Camp obligatoriu):</td>
                    <td> <input type="text" name="titlu" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Buget (Camp obligatoriu):</td>
                    <td> <input type="text" name="buget" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Venituri (Camp obligatoriu):</td>
                    <td> <input type="text" name="venituri" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Rating (Camp obligatoriu):</td>
                    <td> <input type="text" name="rating" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Popularitate:</td>
                    <td> <input type="text" name="popularitate" size="40" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Filmul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Revino la pagina principala</b></a>
        <br/>
    </body>
</html>