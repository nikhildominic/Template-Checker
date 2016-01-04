<%-- 
    Document   : generate
    Created on : 14 Nov, 2015, 11:48:43 AM
    Author     : Nikhilsss
--%>

<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
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


<form action="compare.jsp">
   
   

    <table border="1" cellpadding="10" id="mytable">
        <th>Heading No.</th><th>Heading</th><th>Font Name</th><th>Font Size</th><th>Content FontName</th><th>Content FontSize</th>
<%   
    String a=request.getParameter("file");
    
    String ff= FilenameUtils.removeExtension(a);
    
    
String Path_of_file="E:\\MCA\\S5\\Mini Project\\test_app\\doc\\"+a;           
WordExtractor extractor = null ;
File fil = null;
int paragraphNo;
try {
fil = new File(Path_of_file);
FileInputStream fis=new FileInputStream(fil.getAbsolutePath());
POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(fil.getAbsolutePath()));
HWPFDocument document=new HWPFDocument(fis);
extractor = new WordExtractor(document);
Range range= document.getRange();

//xml

DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
Document doc = docBuilder.newDocument();
Element rootElement = doc.createElement("template");
doc.appendChild(rootElement);
    

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
            
            Element heading = doc.createElement("HEADING");
            rootElement.appendChild(heading);
            Element no = doc.createElement("no");
            heading.appendChild(no);
            no.setTextContent(Integer.toString(paragraphNo));
            
            Element head = doc.createElement("head");
            heading.appendChild(head);
            head.setTextContent(extractedString[lasthead]);
            
            Element font = doc.createElement("font");
            heading.appendChild(font);
            font.setTextContent(run.getFontName());
            
            Element size = doc.createElement("size");
            heading.appendChild(size);
            size.setTextContent(Integer.toString(run.getFontSize()/2));
            
            
            for(int w=lasthead+1;w<i;w++){
            Paragraph p = range.getParagraph(w);
            CharacterRun r = p.getCharacterRun(0);
            if(!csize.equals(Integer.toString(r.getFontSize())))
            csize=Integer.toString(r.getFontSize()/2);
            if(!ctype.equals(r.getFontName()))
            ctype=r.getFontName();
            
            
            }
            
            Element cntype = doc.createElement("ctype");
            heading.appendChild(cntype);
            cntype.setTextContent(ctype);
            
            
            
            Element cnsize = doc.createElement("csize");
            heading.appendChild(cnsize);
            cnsize.setTextContent(csize);
            
            
           
            
            
             //xml
            
            
            %>
            


                <tr> 
                           <td><%=paragraphNo++%></td><td><%=extractedString[lasthead]%></td><td><%=run.getFontName()%></td><td><%=run.getFontSize()/2%></td><td><%=ctype%></td><td><%=csize%></td>
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
            
            Element heading = doc.createElement("HEADING");
            rootElement.appendChild(heading);
            Element no = doc.createElement("no");
            heading.appendChild(no);
            no.setTextContent(Integer.toString(paragraphNo));
            
            Element head = doc.createElement("head");
            heading.appendChild(head);
            head.setTextContent(extractedString[lasthead]);
            
            Element font = doc.createElement("font");
            heading.appendChild(font);
            font.setTextContent(run.getFontName());
            
            Element size = doc.createElement("size");
            heading.appendChild(size);
            size.setTextContent(Integer.toString(run.getFontSize()/2));
            
            
            
             //xml
            
            for(int w=lasthead+1;w<i;w++){
            Paragraph p = range.getParagraph(w);
            CharacterRun r = p.getCharacterRun(0);
            if(!csize.equals(Integer.toString(r.getFontSize())))
            csize=Integer.toString(r.getFontSize()/2);
            if(!ctype.equals(r.getFontName()))
            ctype=r.getFontName();
            
            
            }
            
            Element cntype = doc.createElement("ctype");
            heading.appendChild(cntype);
            cntype.setTextContent(ctype);
            
            
            
            Element cnsize = doc.createElement("csize");
            heading.appendChild(cnsize);
            cnsize.setTextContent(csize);
            
            
            %>
            


                <tr> 
                           <td><%=paragraphNo++%></td><td><%=extractedString[lasthead]%></td><td><%=run.getFontName()%></td><td><%=run.getFontSize()/2%></td><td><%=ctype%></td><td><%=csize%></td>
                </tr>
                
            

<%
             
            
            
            
        } 
        
        
}

//xml
TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();
    transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
    
    

    StringWriter sw = new StringWriter();
    StreamResult result = new StreamResult(sw);
    DOMSource source = new DOMSource(doc);
    transformer.transform(source, result);
    
    String xmlString = sw.toString();
    
   File file=new File("E:\\MCA\\S5\\Mini Project\\test_app\\doc_xml\\"+ff+".xml");
    //response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
    //response.setHeader("Content-Type", "text/xml; charset=UTF-8");
  // BufferedWriter bw = new BufferedWriter(new FileWriter(file));
   BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
   bw.write(xmlString);
   bw.flush();
   bw.close();

    
//xml

    out.println("<br><br>Total Paragraphs: "+(--paragraphNo)+"<br>");
    session.setAttribute("file", ff+".xml");
    

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
<input type="hidden" name="template" value="">
<input type="hidden" name="document" value="">
<input type="submit" value="Compare">

</form>