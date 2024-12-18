package locacaomidias.controladores;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.json.JsonValue;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import locacaomidias.dao.ExemplarDAO;
import locacaomidias.dao.MidiaDAO;
import locacaomidias.entidades.Exemplar;
import locacaomidias.entidades.Midia;
import locacaomidias.utils.Utils;


@WebServlet(name = "ExemplarServlet", urlPatterns = {"/processaExemplares"})
public class ExemplarServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String acao = request.getParameter( "acao" );
        RequestDispatcher disp = null;
        
        try ( ExemplarDAO daoExemplar = new ExemplarDAO();
              MidiaDAO daoMidia = new MidiaDAO()) {

            if ( acao.equals( "inserir" ) ) {

                Boolean disponivel = Boolean.parseBoolean(request.getParameter("disponivel"));
                Long idMidia = Utils.getLong(request, "idMidia");
                
                Midia m = daoMidia.obterPorId(idMidia);
                
                Exemplar e = new Exemplar();
                e.setDisponivel(!disponivel);
                e.setMidia(m);
                
                Utils.validar( e, "codigoInterno" );
                daoExemplar.salvar( e );
                
                disp = request.getRequestDispatcher(
                        "/formularios/exemplares/listagem.jsp" );

            }  else if ( acao.equals( "alterar" ) ) {

                Long id = Utils.getLong( request, "id" );
                Boolean disponivel = Boolean.parseBoolean(request.getParameter("disponivel"));
                Long idMidia = Utils.getLong(request, "idMidia");
                
                Midia m = daoMidia.obterPorId(idMidia);

                Exemplar e = daoExemplar.obterPorId(id);
                e.setDisponivel(disponivel);
                e.setMidia(m);
                
                Utils.validar( e, "id" );
                daoExemplar.atualizar( e );
                disp = request.getRequestDispatcher(
                        "/formularios/exemplares/listagem.jsp" );

            }else if ( acao.equals( "excluir" ) ) {

                Long id = Utils.getLong( request, "id" );
                Exemplar e = daoExemplar.obterPorId(id);
                
                daoExemplar.excluir(e);
                disp = request.getRequestDispatcher(
                        "/formularios/exemplares/listagem.jsp" );

            } else {
                
                Long id = Utils.getLong( request, "id" );
                Exemplar e = daoExemplar.obterPorId( id );
                request.setAttribute( "exemplar", e );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/exemplares/alterar.jsp" );
                } else if ( acao.equals( "prepararExclusao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/exemplares/excluir.jsp" );
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
