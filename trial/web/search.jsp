<%-- 
    Document   : search
    Created on : 29 Dec, 2015, 2:23:08 PM
    Author     : Nikhilsss
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.io.*,org.apache.poi.hwpf.HWPFDocument,org.apache.poi.hwpf.extractor.WordExtractor" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        
        
        <style>
            p {
   
    margin-right: 600px;
    
            }
        </style>
    </head>
    <body>
        <form action="search.jsp">
            <br><br><br><center>
            <input type="text" name="search">           
            <input type="submit" value="Search"><br><br><br></center>
        </form>
        <%
            String s="";
            File file = null;
            WordExtractor extractor = null ;
            String res="";
            String temp="";
        try
        {
            s=request.getParameter("search").trim();
        }
        catch(Exception e)
        {
            
        }
        if(s.equals(null)||s.equals(""))
        {}
        else
        {
            %>
            <h2>Search Results</h2>
        
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject?zeroDateTimeBehavior=convertToNull","root","password");
        String query="select distinct fname from search where tags LIKE '%"+s+"%'";
        
        
        Statement ss=conn.createStatement();
        ResultSet rs=ss.executeQuery(query);
        
        while(rs.next())
        {
            try {
file = new File("E:\\MCA\\S5\\Mini Project\\test_app\\doc\\"+rs.getString(1));
FileInputStream fis=new FileInputStream(file.getAbsolutePath());
HWPFDocument document=new HWPFDocument(fis);
extractor = new WordExtractor(document);
String [] fileData = extractor.getParagraphText();
int i;
temp="";
for(i=0;i<fileData.length;i++)
{
    fileData[i]=fileData[i].trim();
    if(!fileData[i].isEmpty()){
    temp=temp+fileData[i];
    if(temp.length()>100)
        break;
    
    }}}
catch(Exception exep)
{
out.println(exep.getMessage());
}
            %>
            
            <a href="E:/MCA/S5/Mini Project/test_app/doc/<%=rs.getString(1)%>" target="_blank" download><b><font color="#0266C8" size="5"><%=rs.getString(1).toUpperCase()%></font></b><br></a>
                
            <p><%=temp%></p>
            <br>
            <br>
            
        <%
         
        }}
            
        %>
        
    </body>
</html>
