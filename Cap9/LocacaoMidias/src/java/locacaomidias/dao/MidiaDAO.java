package locacaomidias.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.entidades.Midia;
import locacaomidias.entidades.Ator;
import locacaomidias.entidades.Genero;
import locacaomidias.entidades.ClassificacaoEtaria;
import locacaomidias.entidades.Tipo;
import locacaomidias.entidades.ClassificacaoInterna;
import locacaomidias.utils.Utils;

/**
 *
 * @author adils
 */
public class MidiaDAO extends DAO<Midia>{
    
    public MidiaDAO() throws SQLException {
    }

    @Override
    public void salvar( Midia obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "midia( " + 
                "       titulo, " + 
                "       anoLancamento, " + 
                "       codigoBarras, " + 
                "       duracaoEmMinutos, " +
                "       ator_atriz_principal, " + 
                "       ator_atriz_coadjuvante, " + 
                "       genero_id, " + 
                "       classificacao_etaria_id, " + 
                "       tipo_id, " + 
                "       classificacao_interna_id ) " + 
                "VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );",
                new String[]{ "insert_id" } );

        stmt.setString( 1, obj.getTitulo());
        stmt.setString( 2, obj.getAnoLancamento());
        stmt.setString( 3, obj.getCodigoBarras());
        stmt.setLong(4, obj.getDuracaoEmMinutos());
        stmt.setLong( 5, obj.getAtorPrincipal().getId() );
        stmt.setLong( 6, obj.getAtorCoadjuvante().getId() );
        stmt.setLong( 7, obj.getGenero().getId() );
        stmt.setLong( 8, obj.getClassificacaoEtaria().getId() );
        stmt.setLong( 9, obj.getTipo().getId() );
        stmt.setLong( 10, obj.getClassificacaoInterna().getId() );

        stmt.executeUpdate();
        obj.setId( Utils.getChavePrimariaAposInsercao( stmt, "insert_id" ) );
        stmt.close();

    }

    @Override
    public void atualizar( Midia obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE midia " + 
                "SET" + 
                "    titulo = ?," + 
                "    anoLancamento = ?, " + 
                "    codigoBarras = ?, " + 
                "    duracaoEmMinutos = ?, " + 
                "    ator_atriz_principal = ?, " + 
                "    ator_atriz_coadjuvante = ?, " + 
                "    genero_id = ?, " + 
                "    classificacao_etaria_id = ?, " + 
                "    tipo_id = ?, " + 
                "    classificacao_interna_id = ? " + 
                "WHERE" + 
                "    id = ?;" );

        stmt.setString( 1, obj.getTitulo());
        stmt.setString( 2, obj.getAnoLancamento());
        stmt.setString( 3, obj.getCodigoBarras());
        stmt.setLong(4, obj.getDuracaoEmMinutos());
        stmt.setLong( 5, obj.getAtorPrincipal().getId() );
        stmt.setLong( 6, obj.getAtorCoadjuvante().getId() );
        stmt.setLong( 7, obj.getGenero().getId() );
        stmt.setLong( 8, obj.getClassificacaoEtaria().getId() );
        stmt.setLong( 9, obj.getTipo().getId() );
        stmt.setLong( 10, obj.getClassificacaoInterna().getId() );
        stmt.setLong( 11, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Midia obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM midia " + 
                "WHERE" + 
                "    id = ?;" );

        stmt.setLong( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Midia> listarTodos() throws SQLException {

        List<Midia> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
               "SELECT" +
               "  m.id idMidia, " +
               "  m.titulo tituloMidia, " +
               "  m.anoLancamento anoLancamentoMidia, " +
               "  m.codigoBarras codigoBarrasMidia, " +
               "  m.duracaoEmMinutos duracaoEmMinutosMidia, " +
               "  a.id idAtor, " +
               "  a.nome nomeAtor, " +
               "  a.sobrenome sobrenomeAtor, " +
               "  a.dataEstreia dataEstreiaAtor, " +
               "  a2.id idAtor2, " +
               "  a2.nome nomeAtor2, " +
               "  a2.sobrenome sobrenomeAtor2, " +
               "  a2.dataEstreia dataEstreiaAtor2, " +
               "  g.id idGenero, " +
               "  g.descricao descricaoGenero, " +
               "  ce.id idClassificacaoEtaria, " +
               "  ce.descricao descricaoClassificacaoEtaria, " +
               "  t.id idTipo, " +
               "  t.descricao descricaoTipo, " +
               "  ci.id idClassificacaoInterna, " +
               "  ci.descricao descricaoClassificacaoInterna, " +
               "  ci.valorAluguel valorAluguelClassificacaoInterna " +
                "FROM" + 
                "    midia m, " + 
                "    ator_atriz a, " + 
                "    ator_atriz a2, " + 
                "    genero g, " + 
                "    classificacao_etaria ce, " + 
                "    tipo t, " + 
                "    classificacao_interna ci " + 
                "WHERE" + 
                "    m.ator_atriz_principal = a.id AND " +
                "    m.ator_atriz_coadjuvante = a2.id AND " +
                "    m.genero_id = g.id AND " +
                "    m.classificacao_etaria_id = ce.id AND " +
                "    m.tipo_id = t.id AND " +
                "    m.classificacao_interna_id = ci.id " +
                "ORDER BY m.titulo;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Midia m = new Midia();
            Ator a = new Ator();
            Ator a2 = new Ator();
            Genero g = new Genero();
            ClassificacaoEtaria ce = new ClassificacaoEtaria();
            Tipo t = new Tipo();
            ClassificacaoInterna ci = new ClassificacaoInterna();
            
            m.setId(rs.getLong("idMidia"));
            m.setTitulo(rs.getString("tituloMidia"));
            m.setAnoLancamento(rs.getString("anoLancamentoMidia"));
            m.setCodigoBarras(rs.getString("codigoBarrasMidia"));
            m.setDuracaoEmMinutos(rs.getLong("duracaoEmMinutosMidia"));
            m.setAtorPrincipal(a);
            m.setAtorCoadjuvante(a2);
            m.setGenero(g);
            m.setClassificacaoEtaria(ce);
            m.setTipo(t);
            m.setClassificacaoInterna(ci);

            a.setId(rs.getLong("idAtor"));
            a.setNome(rs.getString("nomeAtor"));
            a.setSobrenome(rs.getString("sobrenomeAtor"));
            a.setDataEstreia(rs.getDate("dataEstreiaAtor"));
            
            a2.setId(rs.getLong("idAtor2"));
            a2.setNome(rs.getString("nomeAtor2"));
            a2.setSobrenome(rs.getString("sobrenomeAtor2"));
            a2.setDataEstreia(rs.getDate("dataEstreiaAtor2"));

            g.setId(rs.getLong("idGenero"));
            g.setDescricao(rs.getString("descricaoGenero"));
            
            ce.setId(rs.getLong("idClassificacaoEtaria"));
            ce.setDescricao(rs.getString("descricaoClassificacaoEtaria"));
            
            t.setId(rs.getLong("idTipo"));
            t.setDescricao(rs.getString("descricaoTipo"));
            
            ci.setId(rs.getLong("idClassificacaoInterna"));
            ci.setDescricao(rs.getString("descricaoClassificacaoInterna"));
            ci.setValorAluguel(rs.getBigDecimal("valorAluguelClassificacaoInterna"));

            lista.add( m );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Midia obterPorId( Long id ) throws SQLException {

        Midia midia = null;

        PreparedStatement stmt = getConnection().prepareStatement(
               "SELECT" + 
               "  m.id idMidia, " +
               "  m.titulo tituloMidia, " +
               "  m.anoLancamento anoLancamentoMidia, " +
               "  m.codigoBarras codigoBarrasMidia, " +
               "  m.duracaoEmMinutos duracaoEmMinutosMidia, " +
               "  a.id idAtor, " +
               "  a.nome nomeAtor, " +
               "  a.sobrenome sobrenomeAtor, " +
               "  a.dataEstreia dataEstreiaAtor, " +
               "  a2.id idAtor2, " +
               "  a2.nome nomeAtor2, " +
               "  a2.sobrenome sobrenomeAtor2, " +
               "  a2.dataEstreia dataEstreiaAtor2, " +
               "  g.id idGenero, " +
               "  g.descricao descricaoGenero, " +
               "  ce.id idClassificacaoEtaria, " +
               "  ce.descricao descricaoClassificacaoEtaria, " +
               "  t.id idTipo, " +
               "  t.descricao descricaoTipo, " +
               "  ci.id idClassificacaoInterna, " +
               "  ci.descricao descricaoClassificacaoInterna, " +
               "  ci.valorAluguel valorAluguelClassificacaoInterna " +
                "FROM" + 
                "    midia m, " + 
                "    ator_atriz a, " + 
                "    ator_atriz a2, " + 
                "    genero g, " + 
                "    classificacao_etaria ce, " + 
                "    tipo t, " + 
                "    classificacao_interna ci " + 
                "WHERE" + 
                "    m.id = ? AND " + 
                "    m.ator_atriz_principal = a.id AND " +
                "    m.ator_atriz_coadjuvante = a2.id AND " +
                "    m.genero_id = g.id AND " +
                "    m.classificacao_etaria_id = ce.id AND " +
                "    m.tipo_id = t.id AND " +
                "    m.classificacao_interna_id = ci.id " +
                "ORDER BY m.titulo, m.anoLancamento, m.duracaoEmMinutos;" );

        stmt.setLong( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            midia = new Midia();
            Ator a = new Ator();
            Ator a2 = new Ator();
            Genero g = new Genero();
            ClassificacaoEtaria ce = new ClassificacaoEtaria();
            Tipo t = new Tipo();
            ClassificacaoInterna ci = new ClassificacaoInterna();
            
            midia.setId(rs.getLong("idMidia"));
            midia.setTitulo(rs.getString("tituloMidia"));
            midia.setAnoLancamento(rs.getString("anoLancamentoMidia"));
            midia.setCodigoBarras(rs.getString("codigoBarrasMidia"));
            midia.setDuracaoEmMinutos(rs.getLong("duracaoEmMinutosMidia"));
            midia.setAtorPrincipal(a);
            midia.setAtorCoadjuvante(a2);
            midia.setGenero(g);
            midia.setClassificacaoEtaria(ce);
            midia.setTipo(t);
            midia.setClassificacaoInterna(ci);

            a.setId(rs.getLong("idAtor"));
            a.setNome(rs.getString("nomeAtor"));
            a.setSobrenome(rs.getString("sobrenomeAtor"));
            a.setDataEstreia(rs.getDate("dataEstreiaAtor"));
            
            a2.setId(rs.getLong("idAtor2"));
            a2.setNome(rs.getString("nomeAtor2"));
            a2.setSobrenome(rs.getString("sobrenomeAtor2"));
            a2.setDataEstreia(rs.getDate("dataEstreiaAtor2"));

            g.setId(rs.getLong("idGenero"));
            g.setDescricao(rs.getString("descricaoGenero"));
            
            ce.setId(rs.getLong("idClassificacaoEtaria"));
            ce.setDescricao(rs.getString("descricaoClassificacaoEtaria"));
            
            t.setId(rs.getLong("idTipo"));
            t.setDescricao(rs.getString("descricaoTipo"));
            
            ci.setId(rs.getLong("idClassificacaoInterna"));
            ci.setDescricao(rs.getString("descricaoClassificacaoInterna"));
            ci.setValorAluguel(rs.getBigDecimal("valorAluguelClassificacaoInterna"));

        }

        rs.close();
        stmt.close();

        return midia;

    }
}
