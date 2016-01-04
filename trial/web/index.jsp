<%-- 
    Document   : chooser
    Created on : 16 Oct, 2015, 10:32:00 AM
    Author     : Nikhilsss
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <body>
        <form action="search.jsp">
            <br><br><br><center>
            <input type="text" name="search">           
            <input type="submit" value="Search"><br><br><br></center>
        </form>
    <br><br><br><center> <table border="1" cellpadding="10"><th>Choose a Pre-loaded Template</th>
       
            
            
            <%
        File file = new File("E:/MCA/S5/Mini Project/test_app/xml");
        File[] files = file.listFiles();
        for(File f: files){
            
       %>
            
       
       <tr><td><a href="##"><%=f.getName()%></a></td><td><a href="choosedoc.jsp?template=<%=f.getName()%>"><img src="images/proceed.png"></a></td></tr>
            
            
            <%
             }
            %>
            </table>
            
            <form method="post" action="UploadFile" enctype="multipart/form-data">
                
                <label>Choose a word template</label><input type="file" name="file" accept=".doc"> <input type="submit" value="Upload" >
                
            </form>   
            
            
            
    </body>
</html>
