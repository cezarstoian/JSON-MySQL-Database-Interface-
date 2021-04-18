<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Categorie Film</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int movie_id, category_id, Buget, Venituri, Rating;
            String id1, id2, Titlu, Popularitate, NumeCategorie, PopularitateGen, AudientaTinta;
            id1 = request.getParameter("movie_id");
            id2 = request.getParameter("category_id");
            if (id1 != null) {
                jb.connect();
                jb.adaugaMovieCategory(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("movies");
        ResultSet rs2 = jb.vedeTabela("categories");
        %>
        <h1> Suntem in tabela Movie Category.</h1>
        <form action="nou_Movie_Category.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdFilm:</td>
                    <td> 
                        Selectati filmul:
			<SELECT NAME="movie_id">
                                <%
                                    while(rs1.next()){
                                        movie_id = rs1.getInt("movie_id");
                                        Titlu = rs1.getString("titlu");
                                        Buget = rs1.getInt("buget");
                                        Venituri = rs1.getInt("venituri");
                                        Rating = rs1.getInt("rating");
                                        Popularitate = rs1.getString("popularitate");
                                %>
                                    <OPTION VALUE="<%= movie_id%>"><%= movie_id%>,<%= Titlu%>,<%= Buget%>,<%= Venituri%>,<%= Rating%>,<%= Popularitate%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdCategorie:</td>
                    <td> 
                        Selectati categoria:
			<SELECT NAME="category_id">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        category_id = rs2.getInt("category_id");
                                        NumeCategorie = rs2.getString("nume_categorie");
                                        PopularitateGen = rs2.getString("popularitate_gen");
                                        AudientaTinta = rs2.getString("audienta_tinta");
                                %>
                                    <OPTION VALUE="<%= category_id%>"><%= category_id%>,<%= NumeCategorie%>,<%= PopularitateGen%>,<%= AudientaTinta%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
            </table>
            <input type="submit" value="Adauga" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Revino la pagina principala</b></a>
        <br/>
    </body>
</html>