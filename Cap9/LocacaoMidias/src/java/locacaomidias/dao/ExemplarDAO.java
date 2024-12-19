package locacaomidias.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.entidades.Ator;
import locacaomidias.entidades.ClassificacaoEtaria;
import locacaomidias.entidades.ClassificacaoInterna;
import locacaomidias.entidades.Exemplar;
import locacaomidias.entidades.Genero;
import locacaomidias.entidades.Midia;
import locacaomidias.entidades.Tipo;
import locacaomidias.utils.Utils;

/**
 *
 * @author adils
 */
public class ExemplarDAO extends DAO<Exemplar> {
    
    public ExemplarDAO() throws SQLException {
    }

    @Override
    public void salvar( Exemplar obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "exemplar(" + 
                "    disponivel, " + 
                "    midia_id ) " + 
                "VALUES( ?, ? );",
                new String[]{ "insert_id" } ); // para retorno da chave
                                               // primária gerada

        stmt.setBoolean(1, obj.getDisponivel());
        stmt.setLong(2, obj.getMidia().getId());
        
        stmt.executeUpdate();
        obj.setCodigoInterno(Utils.getChavePrimariaAposInsercao( stmt, "insert_id" ) );
        stmt.close();

    }

    @Override
    public void atualizar(Exemplar obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE exemplar " +
                "SET " +
                "    disponivel = ?, " +
                "    midia_id = ? " +
                "WHERE " +
                "    codigo_interno = ?;");

        stmt.setBoolean(1, obj.getDisponivel());
        stmt.setLong(2, obj.getMidia().getId());
        stmt.setLong(3, obj.getCodigoInterno());

        stmt.executeUpdate();
        stmt.close();
    }


    @Override
    public void excluir( Exemplar obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM exemplar " + 
                "WHERE" + 
                "    codigo_interno = ?;" );

        stmt.setLong( 1, obj.getCodigoInterno());

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Exemplar> listarTodos() throws SQLException {

        List<Exemplar> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
               "SELECT" + 
               "  e.codigo_interno codigoInternoExemplar, " + 
               "  e.disponivel disponivelExemplar, " +
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
                "    exemplar e, " + 
                "    midia m, " + 
                "    ator_atriz a, " + 
                "    ator_atriz a2, " + 
                "    genero g, " + 
                "    classificacao_etaria ce, " + 
                "    tipo t, " + 
                "    classificacao_interna ci " + 
                "WHERE" + 
                "    e.midia_id = m.id AND" +
                "    m.ator_atriz_principal = a.id AND " +
                "    m.ator_atriz_coadjuvante = a2.id AND " +
                "    m.genero_id = g.id AND " +
                "    m.classificacao_etaria_id = ce.id AND " +
                "    m.tipo_id = t.id AND " +
                "    m.classificacao_interna_id = ci.id " +
                "ORDER BY e.codigo_interno" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Exemplar e = new Exemplar();
            Midia m = new Midia();
            Ator a = new Ator();
            Ator a2 = new Ator();
            Genero g = new Genero();
            ClassificacaoEtaria ce = new ClassificacaoEtaria();
            Tipo t = new Tipo();
            ClassificacaoInterna ci = new ClassificacaoInterna();
            
            e.setCodigoInterno(rs.getLong("codigoInternoExemplar"));
            e.setDisponivel(rs.getBoolean("disponivelExemplar"));
            e.setMidia(m);
            
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

            lista.add( e );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Exemplar obterPorId( Long id ) throws SQLException {

        Exemplar exemplar = null;

        PreparedStatement stmt = getConnection().prepareStatement(
               "SELECT" + 
               "    e.codigo_interno codigoInternoExemplar, " + 
               "    e.disponivel disponivelExemplar, " +
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
                "    exemplar e, " + 
                "    midia m, " + 
                "    ator_atriz a, " + 
                "    ator_atriz a2, " + 
                "    genero g, " + 
                "    classificacao_etaria ce, " + 
                "    tipo t, " + 
                "    classificacao_interna ci " + 
                "WHERE" + 
                "    e.codigo_interno = ? AND " +
                "    e.midia_id = m.id AND " +
                "    m.ator_atriz_principal = a.id AND " +
                "    m.ator_atriz_coadjuvante = a2.id AND " +
                "    m.genero_id = g.id AND " +
                "    m.classificacao_etaria_id = ce.id AND " +
                "    m.tipo_id = t.id AND " +
                "    m.classificacao_interna_id = ci.id " +
                "ORDER BY e.midia_id" );

        stmt.setLong( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            exemplar = new Exemplar();
            Midia m = new Midia();
            Ator a = new Ator();
            Ator a2 = new Ator();
            Genero g = new Genero();
            ClassificacaoEtaria ce = new ClassificacaoEtaria();
            Tipo t = new Tipo();
            ClassificacaoInterna ci = new ClassificacaoInterna();
            
            exemplar.setCodigoInterno(rs.getLong("codigoInternoExemplar"));
            exemplar.setDisponivel(rs.getBoolean("disponivelExemplar"));
            exemplar.setMidia(m);
            
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

        }

        rs.close();
        stmt.close();

        return exemplar;

    }
    
}
