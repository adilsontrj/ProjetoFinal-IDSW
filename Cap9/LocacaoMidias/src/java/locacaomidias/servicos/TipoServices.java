package locacaomidias.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.dao.TipoDAO;
import locacaomidias.entidades.Tipo;

/**
 *
 * @author adils
 */
public class TipoServices {
    public List<Tipo> getTodos() {

        List<Tipo> lista = new ArrayList<>();

        try ( TipoDAO dao = new TipoDAO() ) {
            lista = dao.listarTodos();
        } catch ( SQLException exc ) {
            exc.printStackTrace();
        }

        return lista;

    }
}
