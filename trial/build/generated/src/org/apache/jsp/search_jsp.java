package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.io.*;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Search</title>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            p {\n");
      out.write("   \n");
      out.write("    margin-right: 600px;\n");
      out.write("    \n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"search.jsp\">\n");
      out.write("            <br><br><br><center>\n");
      out.write("            <input type=\"text\" name=\"search\">           \n");
      out.write("            <input type=\"submit\" value=\"Search\"><br><br><br></center>\n");
      out.write("        </form>\n");
      out.write("        ");

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
            
      out.write("\n");
      out.write("            <h2>Search Results</h2>\n");
      out.write("        \n");
      out.write("        ");

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject?zeroDateTimeBehavior=convertToNull","root","password");
        String query="select distinct fname from search where tags LIKE '%"+s+"%'";
        
        
        Statement ss=conn.createStatement();
        ResultSet rs=ss.executeQuery(query);
        
        while(rs.next())
        {
            try {
file = new File("E:\\MCA\\S5\\Mini Project\\test_app\\trialdocs\\"+rs.getString(1));
FileInputStream fis=new FileInputStream(file.getAbsolutePath());
HWPFDocument document=new HWPFDocument(fis);
extractor = new WordExtractor(document);
String [] fileData = extractor.getParagraphText();
int i;
temp="";
for(i=0;i<fileData.length;i++)
{
    fileData[i]=fileData[i].trim();
    temp=temp+fileData[i];
    
    if(temp.length()>50)
        break;
    
    }}
catch(Exception exep)
{
out.println(exep.getMessage());
}
            
      out.write("\n");
      out.write("           \n");
      out.write("            <a href=\"#\"><b><font color=\"#0266C8\" size=\"5\">");
      out.print(rs.getString(1).toUpperCase());
      out.write("</font></b><br></a>\n");
      out.write("                \n");
      out.write("            <p>");
      out.print(temp);
      out.write("</p>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            \n");
      out.write("        ");

         
        }}
            
        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
