<%-- 
    Document   : word_read
    Created on : 16 Sep, 2015, 2:12:26 PM
    Author     : Nikhilsss
--%>

<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.hwpf.HWPFDocument"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.hwpf.extractor.WordExtractor"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
File file = null;
WordExtractor extractor = null ;
String res="";
POIFSFileSystem fs = null;
try 
{
    file = new File("E:\\MCA\\S5\\Mini Project\\trial.doc");
    FileInputStream fis=new FileInputStream(file.getAbsolutePath());
    fs = new POIFSFileSystem(new FileInputStream(file.getAbsolutePath()));
    HWPFDocument document=new HWPFDocument(fis);
    
    extractor = new WordExtractor(document);
    String [] fileData = extractor.getParagraphText();
    for(int i=0;i<fileData.length;i++)
    {
    fileData[i]=fileData[i].trim();
    out.println(fileData[i]);            
    }
 }

catch(Exception exep)
{
    out.println(exep.getMessage());
}
%>
    </head>
    
</html>
