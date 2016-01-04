package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class choosedoc_jsp extends org.apache.jasper.runtime.HttpJspBase
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


session.setAttribute("template", request.getParameter("template"));


      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <body>\n");
      out.write("    \n");
      out.write("        <form method=\"post\" action=\"uploaddoc\" enctype=\"multipart/form-data\">\n");
      out.write("                \n");
      out.write("            <label>Thrust Area of the Document</label> \n");
      out.write("            <select name=\"thrust\">    \n");
      out.write("                <option value=\"1\" selected=\"\">HIGH DIMENSIONAL DATA ANALYSIS</option>\n");
      out.write("                <option value=\"2\">VISUAL COMPUTING</option>\n");
      out.write("                <option value=\"3\">FORMAL METHODS</option>\n");
      out.write("                <option value=\"4\">COMPUTATIONAL BIOINFORMATICS</option>\n");
      out.write("                <option value=\"5\">COMPUTER NETWORKS & WEB CONTENT MANAGEMENT</option>\n");
      out.write("                <option value=\"6\">Big Data Analysis and DataBase Integration</option>\n");
      out.write("                <option value=\"7\">Mobile Applications</option>\n");
      out.write("            </select>\n");
      out.write("            <br><br><br>\n");
      out.write("            <label>Choose document</label><input type=\"file\" name=\"file\" accept=\".doc\"> <input type=\"submit\" value=\"Upload\">\n");
      out.write("                \n");
      out.write("        </form>  \n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("    ");
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
