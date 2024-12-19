package locacaomidias.controladores;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import locacaomidias.dao.ClienteDAO;
import locacaomidias.dao.LocacaoDAO;
import locacaomidias.entidades.Cliente;
import locacaomidias.entidades.Locacao;
import locacaomidias.utils.Utils;


@WebServlet(name = "LocacaoServlet", urlPatterns = {"/processaLocacoes"})
public class LocacoesServlet extends HttpServlet {

    protected void processRequest( HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        LocacaoDAO locDao = null;
        ClienteDAO clDao = null;
        RequestDispatcher disp = null;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        try {locDao = new LocacaoDAO();
            clDao = new ClienteDAO();

            if (acao.equals("inserir")) {

                String dataInicio = request.getParameter("dataInicio");
                String dataFim = request.getParameter("dataFim");
                boolean cancelada = Boolean.parseBoolean(request.getParameter("cancelada"));

                Long cliente_id = Long.parseLong(request.getParameter("idCliente"));

                Cliente cliente = new Cliente();
                cliente.setId(cliente_id);

                Locacao l = new Locacao();
                l.setDataInicio(Date.valueOf(LocalDate.parse(dataInicio, dtf)));
                l.setDataFim(Date.valueOf(LocalDate.parse(dataFim, dtf)));
                l.setCancelada(cancelada);
                l.setCliente(cliente);

                locDao.salvar(l);

                disp = request.getRequestDispatcher(
                        "/formularios/locacoes/listagem.jsp");

            } else if (acao.equals("cancelar")) {

                Locacao l = new Locacao();
                l.setId(Long.parseLong(request.getParameter("id")));

                l.setCancelada(Boolean.TRUE);

                disp = request.getRequestDispatcher(
                        "/formularios/locacoes/listagem.jsp");

            } else {

                Long id = Long.parseLong(request.getParameter("id"));
                Locacao l = locDao.obterPorId(id);
                request.setAttribute("locacao", l);

                if (acao.equals("prepararAlteracao")) {
                    disp = request.getRequestDispatcher(
                            "/formularios/locacoes/alterar.jsp");
                } else if (acao.equals("prepararExclusao")) {
                    disp = request.getRequestDispatcher(
                            "/formularios/locacoes/excluir.jsp");
                }
            }

        } catch ( SQLException exc ) {
            disp = Utils.prepararDespachoErro( request, exc.getMessage() );
        }

        if ( disp != null ) {
            disp.forward( request, response );
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "LocacoesServlet";
    }
}
