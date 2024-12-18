package locacaomidias.controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import locacaomidias.dao.AtorDAO;
import locacaomidias.entidades.Ator;
import locacaomidias.utils.Utils;


@WebServlet(name = "AtoresServlet", urlPatterns = {"/processaAtores"})
public class AtoresServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        RequestDispatcher disp = null;

        try ( AtorDAO dao = new AtorDAO() ){

            if ( acao.equals( "inserir" ) ) {

                String nome = request.getParameter( "nome" );
                String sobrenome = request.getParameter( "sobrenome" );
                String dataEstreia = request.getParameter( "dataEstreia" );
                
                Ator a = new Ator();
                a.setNome(nome);
                a.setSobrenome(sobrenome);
                a.setDataEstreia(Utils.getDate(dataEstreia));

                Utils.validar( a, "id" );
                dao.salvar( a );
                disp = request.getRequestDispatcher(
                        "/formularios/atores/listagem.jsp" );

            } else if ( acao.equals( "alterar" ) ) {

                Long id = Utils.getLong( request, "id" );
                String nome = request.getParameter( "nome" );
                String sobrenome = request.getParameter( "sobrenome" );
                String dataEstreia = request.getParameter( "dataEstreia" );

                Ator a = dao.obterPorId( id );
                a.setNome(nome);
                a.setSobrenome(sobrenome);
                a.setDataEstreia(Utils.getDate(dataEstreia));

                Utils.validar( a );
                dao.atualizar( a );
                disp = request.getRequestDispatcher(
                        "/formularios/atores/listagem.jsp" );

            } else if ( acao.equals( "excluir" ) ) {

                Long id = Utils.getLong( request, "id" );
                Ator a = dao.obterPorId( id );

                dao.excluir( a );
                disp = request.getRequestDispatcher(
                        "/formularios/atores/listagem.jsp" );

            } else {
                
                Long id = Utils.getLong( request, "id" );
                Ator a = dao.obterPorId( id );
                request.setAttribute( "ator", a );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/atores/alterar.jsp" );
                } else if ( acao.equals( "prepararExclusao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/atores/excluir.jsp" );
                }
                
            }

        } catch ( SQLException exc ) {
            disp = Utils.prepararDespachoErro( request, exc.getMessage() );
        }

        if ( disp != null ) {
            disp.forward( request, response );
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
