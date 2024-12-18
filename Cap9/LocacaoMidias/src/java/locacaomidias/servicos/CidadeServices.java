package locacaomidias.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.dao.CidadeDAO;
import locacaomidias.entidades.Cidade;


public class CidadeServices {

    /**
     * Usa o CidadeDAO para obter todos os Cidades.
     *
     * @return Lista de Cidades.
     */
    public List<Cidade> getTodos() {

        List<Cidade> lista = new ArrayList<>();

        try ( CidadeDAO dao = new CidadeDAO() ) {
            lista = dao.listarTodos();
        } catch ( SQLException exc ) {
            exc.printStackTrace();
        }

        return lista;

    }

}
