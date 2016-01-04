package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.File;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"search.jsp\">\n");
      out.write("            <br><br><br><center>\n");
      out.write("            <input type=\"text\" name=\"search\">           \n");
      out.write("            <input type=\"submit\" value=\"Search\"><br><br><br></center>\n");
      out.write("        </form>\n");
      out.write("    <br><br><br><center> <table border=\"1\" cellpadding=\"10\"><th>Choose a Pre-loaded Template</th>\n");
      out.write("       \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            ");

        File file = new File("E:/MCA/S5/Mini Project/test_app/xml");
        File[] files = file.listFiles();
        for(File f: files){
            
       
      out.write("\n");
      out.write("            \n");
      out.write("       \n");
      out.write("       <tr><td><a href=\"##\">");
      out.print(f.getName());
      out.write("</a></td><td><a href=\"choosedoc.jsp?template=");
      out.print(f.getName());
      out.write("\"><img src=\"images/proceed.png\"></a></td></tr>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            ");

             }
            
      out.write("\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("            <form method=\"post\" action=\"UploadFile\" enctype=\"multipart/form-data\">\n");
      out.write("                \n");
      out.write("                <label>Choose a word template</label><input type=\"file\" name=\"file\" accept=\".doc\"> <input type=\"submit\" value=\"Upload\" >\n");
      out.write("                \n");
      out.write("            </form>   \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
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
