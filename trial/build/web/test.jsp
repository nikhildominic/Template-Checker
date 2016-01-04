<%-- 
    Document   : test
    Created on : 3 Jan, 2016, 4:10:03 PM
    Author     : Nikhilsss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String a="sfsdfs";
        a=a.replace('s', 'x');
        %>
        <h1><%=a%></h1>
    </body>
</html>
