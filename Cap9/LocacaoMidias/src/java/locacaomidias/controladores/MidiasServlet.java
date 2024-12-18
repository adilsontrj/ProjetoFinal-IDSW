package locacaomidias.controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import locacaomidias.dao.MidiaDAO;
import locacaomidias.dao.AtorDAO;
import locacaomidias.dao.GeneroDAO;
import locacaomidias.dao.ClassificacaoEtariaDAO;
import locacaomidias.dao.TipoDAO;
import locacaomidias.dao.ClassificacaoInternaDAO;
import locacaomidias.entidades.Midia;
import locacaomidias.entidades.Ator;
import locacaomidias.entidades.Genero;
import locacaomidias.entidades.ClassificacaoEtaria;
import locacaomidias.entidades.Tipo;
import locacaomidias.entidades.ClassificacaoInterna;
import locacaomidias.utils.Utils;

/**
 *
 * @author fecre
 */
@WebServlet(name = "MidiasServlet", urlPatterns = {"/processaMidias"})
public class MidiasServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        RequestDispatcher disp = null;

        try ( MidiaDAO daoMidia = new MidiaDAO();
              AtorDAO daoAtor = new AtorDAO();
              AtorDAO daoAtor2 = new AtorDAO();
              GeneroDAO daoGenero = new GeneroDAO();
              ClassificacaoEtariaDAO daoClassificacaoEtaria = new ClassificacaoEtariaDAO();
              ClassificacaoInternaDAO daoClassificacaoInterna = new ClassificacaoInternaDAO();
              TipoDAO daoTipo = new TipoDAO() ){ 
            
            
            if ( acao.equals( "inserir" ) ) {

                String titulo = request.getParameter("titulo");
                String anoLancamento = request.getParameter("anoLancamento");
                String codigoBarras = request.getParameter("codigoBarras");
                Long duracaoEmMinutos = Utils.getLong(request, "duracaoEmMinutos");
                Long idAtor_atriz_principal = Utils.getLong(request, "idAtor");
                Long idAtor_atriz_coadjuvante = Utils.getLong(request, "idAtor2");
                Long idGenero = Utils.getLong(request, "idGenero");
                Long idClassificacaoEtaria = Utils.getLong(request, "idClassificacaoEtaria");
                Long idTipo = Utils.getLong(request, "idTipo");
                Long idClassificacaoInterna = Utils.getLong(request, "idClassificacaoInterna");
                
                Ator a = daoAtor.obterPorId(idAtor_atriz_principal);
                Ator a2 = daoAtor2.obterPorId(idAtor_atriz_coadjuvante);
                Genero g = daoGenero.obterPorId(idGenero);
                ClassificacaoEtaria ce = daoClassificacaoEtaria.obterPorId(idClassificacaoEtaria);
                Tipo t = daoTipo.obterPorId(idTipo);
                ClassificacaoInterna ci = daoClassificacaoInterna.obterPorId(idClassificacaoInterna);
                
                Midia m = new Midia();
                m.setTitulo(titulo);
                m.setAnoLancamento(anoLancamento);
                m.setCodigoBarras(codigoBarras);
                m.setDuracaoEmMinutos(duracaoEmMinutos);
                m.setAtorPrincipal(a);
                m.setAtorCoadjuvante(a2);
                m.setGenero(g);
                m.setClassificacaoEtaria(ce);
                m.setTipo(t);
                m.setClassificacaoInterna(ci);
                               
                
                Utils.validar( m, "id" );
                daoMidia.salvar( m );
                disp = request.getRequestDispatcher(
                        "/formularios/midias/listagem.jsp" );

            } else if ( acao.equals( "alterar" ) ) {

                Long id = Utils.getLong( request, "id" );
                String titulo = request.getParameter("titulo");
                String anoLancamento = request.getParameter("anoLancamento");
                String codigoBarras = request.getParameter("codigoBarras");
                Long duracaoEmMinutos = Utils.getLong(request, "duracaoEmMinutos");
                Long idAtor_atriz_principal = Utils.getLong(request, "idAtor");
                Long idAtor_atriz_coadjuvante = Utils.getLong(request, "idAtor2");
                Long idGenero = Utils.getLong(request, "idGenero");
                Long idClassificacaoEtaria = Utils.getLong(request, "idClassificacaoEtaria");
                Long idTipo = Utils.getLong(request, "idTipo");
                Long idClassificacaoInterna = Utils.getLong(request, "idClassificacaoInterna");
                
                Ator a = daoAtor.obterPorId(idAtor_atriz_principal);
                Ator a2 = daoAtor2.obterPorId(idAtor_atriz_coadjuvante);
                Genero g = daoGenero.obterPorId(idGenero);
                ClassificacaoEtaria ce = daoClassificacaoEtaria.obterPorId(idClassificacaoEtaria);
                Tipo t = daoTipo.obterPorId(idTipo);
                ClassificacaoInterna ci = daoClassificacaoInterna.obterPorId(idClassificacaoInterna);

                Midia m = daoMidia.obterPorId(id);
                m.setTitulo(titulo);
                m.setAnoLancamento(anoLancamento);
                m.setCodigoBarras(codigoBarras);
                m.setDuracaoEmMinutos(duracaoEmMinutos);
                m.setAtorPrincipal(a);
                m.setAtorCoadjuvante(a2);
                m.setGenero(g);
                m.setClassificacaoEtaria(ce);
                m.setTipo(t);
                m.setClassificacaoInterna(ci);
                
                Utils.validar( m );
                daoMidia.atualizar( m );
                disp = request.getRequestDispatcher(
                        "/formularios/midias/listagem.jsp" );

            } else if ( acao.equals( "excluir" ) ) {

                Long id = Utils.getLong( request, "id" );
                Midia m = daoMidia.obterPorId( id );

                daoMidia.excluir( m );
                disp = request.getRequestDispatcher(
                        "/formularios/midias/listagem.jsp" );

            } else {
                
                Long id = Utils.getLong( request, "id" );
                Midia m = daoMidia.obterPorId( id );
                request.setAttribute( "midia", m );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/midias/alterar.jsp" );
                } else if ( acao.equals( "prepararExclusao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "/formularios/midias/excluir.jsp" );
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
