<%-- 
    Document   : compare
    Created on : 14 Nov, 2015, 3:10:07 PM
    Author     : Nikhilsss
--%>


<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/circle.css" type="text/css" />

<html>
    
    <%
            float score=0;
    
   try{
        
        
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

        DocumentBuilder db = dbf.newDocumentBuilder();  
//template
        Document doc = db.parse("E:\\MCA\\S5\\Mini Project\\test_app\\xml\\"+session.getAttribute("template"));
        
        

        NodeList hno = doc.getElementsByTagName("no");
        NodeList heading = doc.getElementsByTagName("head");
        NodeList font = doc.getElementsByTagName("font");
        NodeList size = doc.getElementsByTagName("size");
        NodeList ctype = doc.getElementsByTagName("ctype");
        NodeList csize = doc.getElementsByTagName("csize");
//file
        Document fil = db.parse("E:\\MCA\\S5\\Mini Project\\test_app\\doc_xml\\"+session.getAttribute("file"));

        NodeList fhno = fil.getElementsByTagName("no");
        NodeList fheading = fil.getElementsByTagName("head");
        NodeList ffont = fil.getElementsByTagName("font");
        NodeList fsize = fil.getElementsByTagName("size");
        NodeList fctype = fil.getElementsByTagName("ctype");
        NodeList fcsize = fil.getElementsByTagName("csize");
        
    %>
    <table border="1" cellpadding="10" id="mytable">
        <th>Heading No.</th><th>Heading</th><th> </th><th>Font Name</th><th> </th><th>Font Size</th><th> </th><th>Content FontName</th><th> </th><th>Content FontSize</th><th> </th><th> </th>

        
        <%
        int i,j,loc=0;
        boolean flag;
        for(i=0;i<hno.getLength();i++)
        {
             flag=false;
             for(j=0;j<fhno.getLength();j++)
             {
                 
                 String a=heading.item(i).getFirstChild().getNodeValue().toString();
                 String b=fheading.item(j).getFirstChild().getNodeValue().toString();
                 
                 if(b.equalsIgnoreCase(a))
                 {
                     flag=true;
                     loc=j;
                     break;
                     
                     
                 }
             }
             
        %>
               
           <%if(!flag){%>  
            
         <tr> 
             <td><%=hno.item(i).getFirstChild().getNodeValue()%></td><td><%=heading.item(i).getFirstChild().getNodeValue()%></td><td><img src="images/no.png"></td><td><%=font.item(i).getFirstChild().getNodeValue()%></td><td><img src="images/no.png"></td><td><%=size.item(i).getFirstChild().getNodeValue()%></td><td><img src="images/no.png"></td><td><%=ctype.item(i).getFirstChild().getNodeValue()%></td><td><img src="images/no.png"></td><td><%=csize.item(i).getFirstChild().getNodeValue()%></td><td><img src="images/no.png"></td><td><img src="images/no.png"></td>
         </tr>
        <%}
           else{
               boolean satisfied=true;
        %>
                
         <tr> 
         
             <td>
                 <%=hno.item(i).getFirstChild().getNodeValue()%>
             </td>
             
             <td>
                 
                 <%=heading.item(i).getFirstChild().getNodeValue()%>
                
             </td>
             
             <%
                 if(heading.item(i).getFirstChild().getNodeValue().toString().equalsIgnoreCase(fheading.item(loc).getFirstChild().getNodeValue().toString()))
                 {
             %><td><img src="images/yes.png"></td>
             <%score++;}else{%>
             <td><img src="images/no.png"></td>
             <%satisfied=false;}%>
             
             
             <td>
                 <%=font.item(i).getFirstChild().getNodeValue()%>
             
             </td>
             
             <%
                 if(font.item(i).getFirstChild().getNodeValue().toString().equalsIgnoreCase(ffont.item(loc).getFirstChild().getNodeValue().toString()))
                {
             %><td><img src="images/yes.png"></td>
             <%score++;}else{%>
             <td><img src="images/no.png"></td>
             <%satisfied=false;}%>
             
             
             <td>
                 <%=size.item(i).getFirstChild().getNodeValue()%>
             
             </td>
             
             <%
                 if(size.item(i).getFirstChild().getNodeValue().toString().equalsIgnoreCase(fsize.item(loc).getFirstChild().getNodeValue().toString()))
                 {
             %><td><img src="images/yes.png"></td>
             <%score++;}else{%>
             <td><img src="images/no.png"></td>
             <%satisfied=false;}%>
             
             <td>
                 <%=ctype.item(i).getFirstChild().getNodeValue()%>
             
             </td>
             
             <%
                 if(ctype.item(i).getFirstChild().getNodeValue().toString().equalsIgnoreCase(fctype.item(loc).getFirstChild().getNodeValue().toString()))
                 {
             %><td><img src="images/yes.png"></td>
             <%score++;}else{%>
             <td><img src="images/no.png"></td>
             <%satisfied=false;}%>
             
             <td>
                 <%=csize.item(i).getFirstChild().getNodeValue()%>
             
             </td>
             
             <%
                 if(csize.item(i).getFirstChild().getNodeValue().toString().equalsIgnoreCase(fcsize.item(loc).getFirstChild().getNodeValue().toString()))
                 {
             %><td><img src="images/yes.png"></td>
             <%score++;}else{%>
             <td><img src="images/no.png"></td>
             <%satisfied=false;}%>
             
             
             
             <%if(satisfied){%>
             <td><img src="images/yes.png"></td>
             <%}else{%>
             <td><img src="images/no.png"></td>
             <%}%>
         </tr>
           
           
        <%}}%>
    
        <%
        float t=hno.getLength()*5;
          
          score=score*100/t;
          
        %>
        
<br>
    
        <div class="<%="c100 p"+Math.round(score)%>">
        
  
<span><%=String.format("%.2f", score)%>%</span>

  <div class="slice">

    <div class="bar"></div>

    <div class="fill"></div>

  </div>
</div> 

<%
   }
   catch(Exception e)
   {
       out.println(e.getMessage());
   }
%>
<br><br><br><br><br><br><br><br>
    </table>     
</html>
