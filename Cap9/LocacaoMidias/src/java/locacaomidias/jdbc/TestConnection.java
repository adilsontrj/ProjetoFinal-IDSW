
package locacaomidias.jdbc;



import java.sql.Connection;
import java.sql.SQLException;
/**
 *
 * @author adils
 */
public class TestConnection {
    public static void main(String[] args) {
        System.out.println("Tentando conectar ao banco de dados...");

        try (Connection connection = ConnectionFactory.getConnection()) {
            System.out.println("Conexão bem-sucedida!");
        } catch (SQLException e) {
            System.out.println("Erro ao conectar: " + e.getMessage());
        }
    }
}
