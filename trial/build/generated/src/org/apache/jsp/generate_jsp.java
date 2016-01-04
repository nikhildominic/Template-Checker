package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hwpf.usermodel.CharacterRun;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.extractor.WordExtractor;
import java.io.*;
import org.apache.poi.hwpf.*;
import org.apache.poi.xssf.extractor.*;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import java.io.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

public final class generate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("<form action=\"compare.jsp\">\n");
      out.write("   \n");
      out.write("   \n");
      out.write("\n");
      out.write("    <table border=\"1\" cellpadding=\"10\" id=\"mytable\">\n");
      out.write("        <th>Heading No.</th><th>Heading</th><th>Font Name</th><th>Font Size</th><th>Content FontName</th><th>Content FontSize</th>\n");
   
    String a=request.getParameter("file");
    
    String ff= FilenameUtils.removeExtension(a);
    
    
String Path_of_file="E:\\MCA\\S5\\Mini Project\\test_app\\doc\\"+a;           
WordExtractor extractor = null ;
int paragraphNo;
try {
FileInputStream fis=new FileInputStream(new File(Path_of_file));
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
            
            
            
      out.write("\n");
      out.write("            \n");
      out.write("\n");
      out.write("\n");
      out.write("                <tr> \n");
      out.write("                           <td>");
      out.print(paragraphNo++);
      out.write("</td><td>");
      out.print(extractedString[lasthead]);
      out.write("</td><td>");
      out.print(run.getFontName());
      out.write("</td><td>");
      out.print(run.getFontSize()/2);
      out.write("</td><td>");
      out.print(ctype);
      out.write("</td><td>");
      out.print(csize);
      out.write("</td>\n");
      out.write("             </tr>\n");
      out.write("                \n");
      out.write("            \n");
      out.write("\n");

             
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
            
            
            
      out.write("\n");
      out.write("            \n");
      out.write("\n");
      out.write("\n");
      out.write("                <tr> \n");
      out.write("                           <td>");
      out.print(paragraphNo++);
      out.write("</td><td>");
      out.print(extractedString[lasthead]);
      out.write("</td><td>");
      out.print(run.getFontName());
      out.write("</td><td>");
      out.print(run.getFontSize()/2);
      out.write("</td><td>");
      out.print(ctype);
      out.write("</td><td>");
      out.print(csize);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("            \n");
      out.write("\n");

             
            
            
            
        } 
        
        
}

//xml
TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();

    transformer.setOutputProperty(OutputKeys.INDENT, "yes");

    StringWriter sw = new StringWriter();
    StreamResult result = new StreamResult(sw);
    DOMSource source = new DOMSource(doc);
    transformer.transform(source, result);
    String xmlString = sw.toString();
    
    File file=new File("E:\\MCA\\S5\\Mini Project\\test_app\\doc_xml\\"+ff+".xml");
    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
    bw.write(xmlString);
    bw.flush();
    bw.close();

    
//xml

    out.println("<br><br>Total Paragraphs: "+(--paragraphNo)+"<br>");
    session.setAttribute("file", ff+".xml");
    


      out.write("\n");
      out.write("</table>\n");
      out.write("<input type=\"hidden\" value=\"");
      out.print(paragraphNo);
      out.write("\" name=\"paragraphNo\">\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("function selectAll(chk) {\n");
      out.write("    if(chk.checked)\n");
      out.write("    {\n");
      out.write("        for(var i=");
      out.print(paragraphNo);
      out.write(";i>0;i--)\n");
      out.write("        document.getElementById(\"p\"+i).checked=true;\n");
      out.write("        \n");
      out.write("      \n");
      out.write("        \n");
      out.write("        \n");
      out.write("    }\n");
      out.write("    else\n");
      out.write("       {\n");
      out.write("        for(var i=");
      out.print(paragraphNo);
      out.write(";i>0;i--)\n");
      out.write("        document.getElementById(\"p\"+i).checked=false;\n");
      out.write("       }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("    \n");



}
catch(Exception exep)
{
out.println(exep.getMessage());
}


      out.write("  \n");
      out.write("<input type=\"hidden\" name=\"template\" value=\"\">\n");
      out.write("<input type=\"hidden\" name=\"document\" value=\"\">\n");
      out.write("<input type=\"submit\" value=\"Compare\">\n");
      out.write("\n");
      out.write("</form>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
