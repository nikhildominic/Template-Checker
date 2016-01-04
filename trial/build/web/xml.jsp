<%-- 
    Document   : xml
    Created on : 7 Oct, 2015, 10:03:47 AM
    Author     : Nikhilsss
--%>

<%@page import="javax.xml.transform.OutputKeys"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>  
<%!
public void createXml(String graph) throws Exception{
try{
    String str="trial";
    DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
    Document doc = docBuilder.newDocument();
    // questionset elements
    Element rootElement = doc.createElement("questionset");
    doc.appendChild(rootElement);
    // question elements
    Element question = doc.createElement("question");
    rootElement.appendChild(question);
    question.setTextContent("trial");
    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();

    transformer.setOutputProperty(OutputKeys.INDENT, "yes");

    StringWriter sw = new StringWriter();
    StreamResult result = new StreamResult(sw);
    DOMSource source = new DOMSource(doc);
    transformer.transform(source, result);
    String xmlString = sw.toString();

    File file=new File("C:\\xml\\"+str+".xml");
    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
    bw.write(xmlString);
    bw.flush();
    bw.close();
}
catch(Exception e)
{
System.out.println(e);
}   
}
%>
<% 
String graph=request.getParameter("graph");
createXml(graph);
%>