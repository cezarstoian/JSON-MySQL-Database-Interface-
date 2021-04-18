<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Movie Category</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Movie Category:</h1>
        <br/>
        <p align="center"><a href="nou_Movie_Category.jsp"><b>Adauga Categorie Film.</b></a> <a href="index.html"><b>Revino la pagina principala</b></a></p>
        <%
            jb.connect();
            String NumeCategorie, PopularitateGen, AudientaTinta, Titlu, Popularitate;
            int Buget, Venituri, Rating;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceMovieCategoryId(aux);
            rs.first();
            int id1 = rs.getInt("movie_id");
            int id2 = rs.getInt("category_id");

            Titlu = rs.getString("Titlu");
            Buget = rs.getInt("Buget");
            Venituri = rs.getInt("Venituri");
            Rating = rs.getInt("Rating");
            Popularitate = rs.getString("Popularitate");
            NumeCategorie = rs.getString("nume_categorie");
            PopularitateGen = rs.getString("popularitate_gen");
            AudientaTinta = rs.getString("audienta_tinta");
            

            ResultSet rs1 = jb.vedeTabela("movies");
            ResultSet rs2 = jb.vedeTabela("categories");
            int movie_id, category_id;


        %>
        <form action="m2_Movie_Category.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Movie_Category_id:</td>
                    <td> <input type="text" name="movie_category_id" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">movie_id:</td>
                    <td> 
                        <SELECT NAME="movie_id">
                            <%
                                while (rs1.next()) {
                                    movie_id = rs1.getInt("movie_id");
                                    Titlu = rs1.getString("titlu");
                                    Buget = rs1.getInt("buget");
                                    Venituri = rs1.getInt("venituri");
                                    Rating = rs1.getInt("rating");
                                    Popularitate = rs1.getString("popularitate");
                                    if (movie_id != id1) {
                            %>
                            <OPTION VALUE="<%= movie_id%>"><%= movie_id%>, <%= Titlu%>, <%= Buget%>, <%= Venituri%>, <%= Rating%>, <%= Popularitate%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= movie_id%>"><%= movie_id%>, <%= Titlu%>, <%= Buget%>, <%= Venituri%>, <%= Rating%>, <%= Popularitate%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">category_id:</td>
                    <td> 
                        <SELECT NAME="category_id">
                            <%
                                while (rs2.next()) {
                                    category_id = rs2.getInt("category_id");
                                    NumeCategorie = rs2.getString("nume_categorie");
                                    PopularitateGen = rs2.getString("popularitate_gen");
                                    
                            if (category_id != id2) {
                            %>
                            <OPTION VALUE="<%= category_id%>"><%= category_id%>, <%= NumeCategorie%>, <%= PopularitateGen%>, <%= AudientaTinta%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= category_id%>"><%= category_id%>, <%= NumeCategorie%>, <%= PopularitateGen%>, <%= AudientaTinta%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Revino la pagina principala</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>