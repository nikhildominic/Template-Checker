/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.eclipse.jdt.internal.compiler.parser.Parser;

/**
 *
 * @author Nikhilsss
 */
@WebServlet(urlPatterns = {"/UploadFile"})
public class UploadFile extends HttpServlet {
private final String UPLOAD_DIRECTORY = "E:\\MCA\\S5\\Mini Project\\test_app\\doc";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name="";
       Boolean temp=true;
        if(ServletFileUpload.isMultipartContent(request)){

            try {

                List<FileItem> multiparts = new ServletFileUpload(

                                         new DiskFileItemFactory()).parseRequest(request);

               

                for(FileItem item : multiparts){

                    if(!item.isFormField()){

                        name = new File(item.getName()).getName();
                        
                        
                        if(FilenameUtils.getExtension(name).equalsIgnoreCase("doc"))
                        temp=false;
                        if(temp)
                        {
                            PrintWriter out = response.getWriter();
                            out.println("<script>alert('Invalid document');window.location.href='index.jsp'</script>");
                            

                        
                        }
                        
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));

                    }

                }
                        
            

               //File uploaded successfully
               response.sendRedirect("read_trial.jsp?file="+name);
        
               request.setAttribute("message", "File Uploaded Successfully");

            } catch (Exception ex) {

               request.setAttribute("message", "File Upload Failed due to " + ex);

            }         

          

        }else{

            request.setAttribute("message",

                                 "Sorry this Servlet only handles file upload request");

       }

     

        //request.getRequestDispatcher("/chooser.jsp").forward(request, response);
            
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadFile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadFile at " + request.getContextPath() + "</h1>");
            
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
