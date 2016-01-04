<%-- 
    Document   : choosedoc
    Created on : 14 Nov, 2015, 1:10:12 PM
    Author     : Nikhilsss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

session.setAttribute("template", request.getParameter("template"));

%>
<!DOCTYPE html>
<html>
    <body>
    
        <form method="post" action="uploaddoc" enctype="multipart/form-data">
                
            <center><br><br><br><br><br><br><br><br><br><br>
            <label>Thrust Area of the Document</label> 
            <select name="thrust">    
                <option value="1" selected="">HIGH DIMENSIONAL DATA ANALYSIS</option>
                <option value="2">VISUAL COMPUTING</option>
                <option value="3">FORMAL METHODS</option>
                <option value="4">COMPUTATIONAL BIOINFORMATICS</option>
                <option value="5">COMPUTER NETWORKS & WEB CONTENT MANAGEMENT</option>
                <option value="6">Big Data Analysis and DataBase Integration</option>
                <option value="7">Mobile Applications</option>
            </select><br><br><br><br><br><br>       
            <br><br><br>
            <label>Choose document</label><input type="file" name="file" accept=".doc"> <input type="submit" value="Upload">
            </center>
        </form>  
    
    </body>
</html>
    