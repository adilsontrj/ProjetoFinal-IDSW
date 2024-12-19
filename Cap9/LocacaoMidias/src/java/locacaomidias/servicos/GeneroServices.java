package locacaomidias.servicos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.dao.GeneroDAO;
import locacaomidias.entidades.Genero;

/**
 *
 * @author adils
 */
public class GeneroServices {
    public List<Genero> getTodos() {

        List<Genero> lista = new ArrayList<>();

        try ( GeneroDAO dao = new GeneroDAO() ) {
            lista = dao.listarTodos();
        } catch ( SQLException exc ) {
            exc.printStackTrace();
        }

        return lista;

    } 
}