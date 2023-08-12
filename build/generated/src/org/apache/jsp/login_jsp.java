package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\" />\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"author\" content=\"\" />\n");
      out.write("        <link href=\"css/styles.css\" rel=\"stylesheet\" />\n");
      out.write("        <link href=\"css/index.css\" rel=\"stylesheet\" />\n");
      out.write("        <script src=\"https://use.fontawesome.com/releases/v6.3.0/js/all.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("            \n");
      out.write("    <body class=\"bg-primary\" style=\"background-image: url(img/5.jpg); background-size: 100% auto;\">\n");
      out.write("        <div id=\"layoutAuthentication\">\n");
      out.write("            <div id=\"layoutAuthentication_content\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"row justify-content-center\">\n");
      out.write("                            <div class=\"col-lg-5\">\n");
      out.write("                                <div class=\"card shadow-lg border-0 rounded-lg mt-5\">\n");
      out.write("                                    <div class=\"card-header\"><h3 class=\"text-center font-weight-light my-4\">Login</h3></div>\n");
      out.write("                                    <div class=\"card-body\">\n");
      out.write("                                        <form name = \"login\" method = \"post\" action = \"valida_login.do\">\n");
      out.write("                                            <div class=\"form-floating mb-3\">\n");
      out.write("                                                <input class=\"form-control\" id=\"inputLogin\" name=\"login\" type=\"text\" placeholder=\"Username\" required/>\n");
      out.write("                                                <label for=\"inputLogin\">Usuário</label>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-floating mb-3\">\n");
      out.write("                                                <input class=\"form-control\" id=\"inputPassword\" name=\"senha\" type=\"password\" placeholder=\"Password\" required/>\n");
      out.write("                                                <label for=\"inputPassword\">Senha</label>\n");
      out.write("                                            </div>\n");
      out.write("                                                <button href=\"form_cadastrar_menu.jsp\" class=\"btn btn-primary\">Entrar</button>\n");
      out.write("                                            </div>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"layoutAuthentication_footer\">\n");
      out.write("                <footer class=\"py-4 bg-light mt-auto\">\n");
      out.write("                    <div class=\"container-fluid px-4\">\n");
      out.write("                        <div class=\"d-flex align-items-center justify-content-between small\">\n");
      out.write("                            <div class=\"text-muted\">Copyright &copy; TCC ETB Turma 4°C 2023</div>\n");
      out.write("                            <div>\n");
      out.write("                                <a href=\"#\">Privacy Policy</a>\n");
      out.write("                                &middot;\n");
      out.write("                                <a href=\"#\">Terms &amp; Conditions</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </footer>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
