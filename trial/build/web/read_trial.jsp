<%-- 
    Document   : word_read
    Created on : 16 Sep, 2015, 2:12:26 PM
    Author     : Nikhilsss
--%>

<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.hwpf.usermodel.CharacterRun"%>
<%@page import="org.apache.poi.hwpf.usermodel.Paragraph"%>
<%@page import="org.apache.poi.hwpf.usermodel.Range"%>
<%@page import="org.apache.poi.hwpf.extractor.WordExtractor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.poi.hwpf.*" %>
<%@page import="org.apache.poi.xssf.extractor.*" %>

<%@page import="javax.xml.transform.OutputKeys"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>  
<%@page import="org.apache.commons.io.FilenameUtils"%>  


<form action="save_xml.jsp">
   
   

    <table border="1" cellpadding="10" id="mytable">
        <th>Heading No.</th><th>Heading</th><th>Font Name</th><th>Font Size</th><th>Content FontName</th><th>Content FontSize</th><th>Mandatory<br><br>Select All<input type="checkbox" onchange="selectAll(this)" id="mand"></th>
<%   
    String a=request.getParameter("file");
    
    String ff= FilenameUtils.removeExtension(a);
    
String Path_of_file="E:\\MCA\\S5\\Mini Project\\test_app\\doc\\"+a;           
WordExtractor extractor = null ;
File file = null;
int paragraphNo;
try {
    
//FileInputStream fis=new FileInputStream(new File(Path_of_file));
//HWPFDocument document=new HWPFDocument(fis);

file = new File(Path_of_file);
FileInputStream fis=new FileInputStream(file.getAbsolutePath());
POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(file.getAbsolutePath()));
HWPFDocument document=new HWPFDocument(fis);
extractor = new WordExtractor(document);
    

Range range= document.getRange();

//xml

 

//xml



String[] extractedString=extractor.getParagraphText();
String csize="0",ctype="nill";
paragraphNo=1;
int lasthead=0;
boolean notfirst=false;
for(int i=0;i<=extractedString.length;i++)
{
        
        if(i<extractedString.length)
        {
        extractedString[i]=extractedString[i].trim();
        if(!extractedString[i].contains("SEQ"))
        if(!extractedString[i].contains("QUOTE"))
        if(!extractedString[i].contains("EMBED PBrush"))
        if(!extractedString[i].isEmpty() && extractedString[i].length()<50)
        {
            
            
            if(notfirst)
            {
                
            
            Paragraph pr = range.getParagraph(lasthead);
            CharacterRun run = pr.getCharacterRun(0);
            
            //xml
            
            
            for(int w=lasthead+1;w<i;w++){
            Paragraph p = range.getParagraph(w);
            CharacterRun r = p.getCharacterRun(0);
            if(!csize.equals(Integer.toString(r.getFontSize())))
            csize=Integer.toString(r.getFontSize()/2);
            if(!ctype.equals(r.getFontName()))
            ctype=r.getFontName();
            
            
            }
            
            
            
            %>
            


                <tr> 
                           <td><%=paragraphNo%></td><td><%=extractedString[lasthead]%><input type="hidden" name="htext" value="<%=extractedString[lasthead]%>"></td><td><%=run.getFontName()%><input type="hidden" name="hfont" value="<%=run.getFontName()%>"></td><td><%=run.getFontSize()/2%><input type="hidden" name="hsize" value="<%=run.getFontSize()/2%>"></td><td><%=ctype%><input type="hidden" name="ctype" value="<%=ctype%>"></td><td><%=csize%><input type="hidden" name="csize" value="<%=csize%>"></td><td><input type="checkbox" value="<%=paragraphNo%>" name="ch" id="p<%=paragraphNo++%>"></td>
             </tr>
                
            

<%
             
            csize="0";
            ctype="nill";
            
            lasthead=i;
            }
            else{
                lasthead=i;
                notfirst=true;
            }
        }
}
        
         else
        {
            Paragraph pr = range.getParagraph(lasthead);
            CharacterRun run = pr.getCharacterRun(0);
            
            //xml
            
             //xml
            
            for(int w=lasthead+1;w<i;w++){
            Paragraph p = range.getParagraph(w);
            CharacterRun r = p.getCharacterRun(0);
            if(!csize.equals(Integer.toString(r.getFontSize())))
            csize=Integer.toString(r.getFontSize()/2);
            if(!ctype.equals(r.getFontName()))
            ctype=r.getFontName();
            
            
            }
            
            
            
            %>
            


                <tr> 
                    <td><%=paragraphNo%></td><td><%=extractedString[lasthead]%><input type="hidden" name="htext" value="<%=extractedString[lasthead]%>"></td><td><%=run.getFontName()%><input type="hidden" name="hfont" value="<%=run.getFontName()%>"></td><td><%=run.getFontSize()/2%><input type="hidden" name="hsize" value="<%=run.getFontSize()/2%>"></td><td><%=ctype%><input type="hidden" name="ctype" value="<%=ctype%>"></td><td><%=csize%><input type="hidden" name="csize" value="<%=csize%>"></td><td><input type="checkbox" value="<%=paragraphNo%>" name="ch" id="p<%=paragraphNo++%>"></td>
                </tr>
                
            

<%
             
            
            
            
        } 
        
        
}

//xml
//xml

out.println("<br><br>Total Paragraphs: "+(--paragraphNo)+"<br>");


%>
</table>
<input type="hidden" value="<%=paragraphNo%>" name="paragraphNo">
    
    <script>
function selectAll(chk) {
    if(chk.checked)
    {
        for(var i=<%=paragraphNo%>;i>0;i--)
        document.getElementById("p"+i).checked=true;
        
      
        
        
    }
    else
       {
        for(var i=<%=paragraphNo%>;i>0;i--)
        document.getElementById("p"+i).checked=false;
       }
}
</script>

    
<%


}
catch(Exception exep)
{
out.println(exep.getMessage());
}

%>  
<input type="hidden" name="fname" value="<%=ff%>">
<input type="submit">

</form>