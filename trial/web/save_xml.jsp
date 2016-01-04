<%-- 
    Document   : save_xml
    Created on : 1 Nov, 2015, 10:19:32 PM
    Author     : Nikhilsss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.xml.transform.OutputKeys"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>  

        <%
        String a[]=request.getParameterValues("ch");
        String htext[]=request.getParameterValues("htext");
        String hfont[]=request.getParameterValues("hfont");
        String hsize[]=request.getParameterValues("hsize");
        String ctype[]=request.getParameterValues("ctype");
        String csize[]=request.getParameterValues("csize");
        
        
        
        
        
        DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
        Document doc = docBuilder.newDocument();
        Element rootElement = doc.createElement("template");
        doc.appendChild(rootElement);

        
        
        Integer[] checked=new Integer[a.length];
        int i=0;
        for(String str:a){
        checked[i]=Integer.parseInt(str);
        i++;
        }
        
        int paragraphNo=1;
        
        for(i=0;i<a.length;i++)
        {
            
            
            Element heading = doc.createElement("HEADING");
            rootElement.appendChild(heading);
            Element no = doc.createElement("no");
            heading.appendChild(no);
            no.setTextContent(Integer.toString(paragraphNo++));
            
            Element head = doc.createElement("head");
            heading.appendChild(head);
            head.setTextContent(htext[checked[i]-1]);
            
            Element font = doc.createElement("font");
            heading.appendChild(font);
            font.setTextContent(hfont[checked[i]-1]);
            
            Element size = doc.createElement("size");
            heading.appendChild(size);
            size.setTextContent(hsize[checked[i]-1]);
            
            
           
            
            Element cntype = doc.createElement("ctype");
            heading.appendChild(cntype);
            cntype.setTextContent(ctype[checked[i]-1]);
            
            
            
            Element cnsize = doc.createElement("csize");
            heading.appendChild(cnsize);
            cnsize.setTextContent(csize[checked[i]-1]);
        }
        
        
        
    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();
    
    transformer.setOutputProperty(OutputKeys.INDENT , "yes");
    StringWriter sw = new StringWriter();
    StreamResult result = new StreamResult(sw);
    DOMSource source = new DOMSource(doc);
    transformer.transform(source, result);
    String xmlString = sw.toString();

    File file=new File("E:\\MCA\\S5\\Mini Project\\test_app\\xml\\"+request.getParameter("fname")+".xml");
   // BufferedWriter bw = new BufferedWriter(new FileWriter(file));
    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
    bw.write(xmlString);
    
    
    bw.flush();
    bw.close();

    %>
        
    
    
    <script>
    
    alert("Template generated")
    window.location.href="choosedoc.jsp?template=<%=request.getParameter("fname")+".xml"%>"
        
    </script>
        
        
        
        
        
        
        
        
        
        
