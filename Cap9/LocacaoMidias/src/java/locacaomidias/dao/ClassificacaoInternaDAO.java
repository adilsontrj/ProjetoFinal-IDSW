package locacaomidias.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.utils.Utils;
import locacaomidias.entidades.ClassificacaoInterna;

/**
 *
 * @author fecre
 */
public class ClassificacaoInternaDAO extends DAO<ClassificacaoInterna> {
    
    public ClassificacaoInternaDAO() throws SQLException {
    }

    @Override
    public void salvar( ClassificacaoInterna obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "classificacao_interna(" + 
                "    descricao, " + 
                "    valorAluguel ) " + 
                "VALUES( ?, ?);",
                new String[]{ "insert_id" } ); // para retorno da chave
                                               // primária gerada

        stmt.setString( 1, obj.getDescricao() );
        stmt.setBigDecimal( 2, obj.getValorAluguel() );

        stmt.executeUpdate();
        obj.setId( Utils.getChavePrimariaAposInsercao( stmt, "insert_id" ) );
        stmt.close();

    }

    @Override
    public void atualizar( ClassificacaoInterna obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE classificacao_interna " + 
                "SET" + 
                "    descricao = ?, " + 
                "    valorAluguel = ?" + 
                "WHERE" + 
                "    id = ?;" );

        stmt.setString( 1, obj.getDescricao() );
        stmt.setBigDecimal( 2, obj.getValorAluguel() );
        stmt.setLong( 3, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( ClassificacaoInterna obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM classificacao_interna " + 
                "WHERE" + 
                "    id = ?;" );

        stmt.setLong( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<ClassificacaoInterna> listarTodos() throws SQLException {

        List<ClassificacaoInterna> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM classificacao_interna " + 
                "ORDER BY valorAluguel, descricao;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            ClassificacaoInterna c = new ClassificacaoInterna();
            
            c.setId( rs.getLong( "id" ) );
            c.setDescricao(rs.getString( "descricao" ) );
            c.setValorAluguel(rs.getBigDecimal( "valorAluguel" ) );

            lista.add( c );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public ClassificacaoInterna obterPorId( Long id ) throws SQLException {

        ClassificacaoInterna classificacaoInterna = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM classificacao_interna " + 
                "WHERE id = ?;" );

        stmt.setLong( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            classificacaoInterna = new ClassificacaoInterna();

            classificacaoInterna.setId( rs.getLong( "id" ) );
            classificacaoInterna.setDescricao(rs.getString( "descricao" ) );
            classificacaoInterna.setValorAluguel(rs.getBigDecimal( "valorAluguel" ));

        }

        rs.close();
        stmt.close();

        return classificacaoInterna;

    }
}
