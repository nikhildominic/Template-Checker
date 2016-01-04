<%-- 
    Document   : word_read
    Created on : 16 Sep, 2015, 2:12:26 PM
    Author     : Nikhilsss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.io.*,org.apache.poi.hwpf.HWPFDocument,org.apache.poi.hwpf.extractor.WordExtractor" %>
<%@ page import="org.apache.poi.xwpf.extractor.XWPFWordExtractor"%>
<%@ page import="org.apache.poi.xwpf.usermodel.XWPFDocument"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
File file = null;
WordExtractor extractor = null ;
String res="";
try {
file = new File("E:\\MCA\\S5\\Mini Project\\test_app\\trialdocs\\trial.doc");
FileInputStream fis=new FileInputStream(file.getAbsolutePath());
HWPFDocument document=new HWPFDocument(fis);
extractor = new WordExtractor(document);
String [] fileData = extractor.getParagraphText();
/*
        for(int i=0;i<fileData.length;i++){
if(fileData[i] != null)
res+=fileData[i];}
*/
int c=0;
for(int i=0;i<fileData.length;i++)
{
   
if(fileData[i] != null)
    if(Character.isWhitespace(fileData[i].to))
    {
      c++;
      if(c>1)
      {
          %>
    <br>
    <%
          c=0;
      }
      else
          out.println( fileData[i]);
    }

}

%>
<form>
    <p><b><br><br><br>
<%out.println(res);%>
        </b></p>

</form>
<%
}
catch(Exception exep)
{
out.println(exep.getMessage());
}
%>
    </head>
    
</html>
