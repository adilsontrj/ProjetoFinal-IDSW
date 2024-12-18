<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Mídia</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Alterar Mídia</h1>

    <form method="post" action="${cp}/processaMidias">

      <input name="acao" type="hidden" value="alterar"/>
      <input name="id" type="hidden" value="${requestScope.midia.id}"/>

      <table>
        <tr>
          <td class="alinharDireita">Título:</td>
          <td>
            <input name="titulo"
                   type="text"
                   size="10"
                   maxlength="100"
                   required
                   value="${requestScope.midia.titulo}"/>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Ano de Lançamento:</td>
          <td>
            <input name="anoLancamento"
                   type="text"
                   size="10"
                   maxlength="100"
                   required
                   value="${requestScope.midia.anoLancamento}"/>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Código de Barras:</td>
          <td>
            <input name="codigoBarras"
                   type="text"
                   size="20"
                   pattern="\d{13}"
                   placeholder="9999999999999"
                   required
                   value="${requestScope.midia.codigoBarras}"/>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Duração em Minutos:</td>
          <td>
            <input name="duracaoEmMinutos"
                   type="number"
                   maxlength="10"
                   required
                   value="${requestScope.midia.duracaoEmMinutos}"/>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Ator/Atriz Principal:</td>
          <td>
            <jsp:useBean
                id="servicos"
                scope="page"
                class="locacaomidias.servicos.AtorServices"/>

            <select name="idAtor" required>
              <c:forEach items="${servicos.todos}" var="ator">
                <c:choose>
                  <c:when test="${requestScope.midia.atorPrincipal.id eq ator.id}">
                    <option value="${ator.id}" selected>
                      ${ator.nome} ${ator.sobrenome}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${ator.id}">
                      ${ator.nome} ${ator.sobrenome}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>

          </td>
        </tr><tr>
          <td class="alinharDireita">Ator/Atriz Coadjuvante:</td>
          <td>

            <jsp:useBean
                id="servicos2"
                scope="page"
                class="locacaomidias.servicos.AtorServices"/>

            <select name="idAtor2" required>
              <c:forEach items="${servicos.todos}" var="ator2">
                <c:choose>
                  <c:when test="${requestScope.midia.atorCoadjuvante.id eq ator2.id}">
                    <option value="${ator2.id}" selected>
                      ${ator2.nome} ${ator2.sobrenome}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${ator2.id}">
                      ${ator2.nome} ${ator2.sobrenome}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>

          </td>
        </tr><tr>
          <td class="alinharDireita">Gênero:</td>
          <td>
            <jsp:useBean
                id="servicosG"
                scope="page"
                class="locacaomidias.servicos.GeneroServices"/>

            <select name="idGenero" required>
              <c:forEach items="${servicosG.todos}" var="genero">
                <c:choose>
                  <c:when test="${requestScope.midia.genero.id eq genero.id}">
                    <option value="${genero.id}" selected>
                      ${genero.descricao}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${genero.id}">
                      ${genero.descricao}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>

          </td>
        </tr><tr>
          <td class="alinharDireita">Classificação Etária:</td>
          <td>
              
            <jsp:useBean
                id="servicosCe"
                scope="page"
                class="locacaomidias.servicos.ClassificacaoEtariaServices"/>

            <select name="idClassificacaoEtaria" required>
              <c:forEach items="${servicosCe.todos}" var="classificacaoEtaria">
                <c:choose>
                  <c:when test="${requestScope.midia.classificacaoEtaria.id eq classificacaoEtaria.id}">
                    <option value="${classificacaoEtaria.id}" selected>
                      ${classificacaoEtaria.descricao}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${classificacaoEtaria.id}">
                      ${classificacaoEtaria.descricao}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Tipo:</td>
          <td>
              <jsp:useBean
                id="servicosT"
                scope="page"
                class="locacaomidias.servicos.TipoServices"/>

            <select name="idTipo" required>
              <c:forEach items="${servicosT.todos}" var="tipo">
                <c:choose>
                  <c:when test="${requestScope.midia.tipo.id eq tipo.id}">
                    <option value="${tipo.id}" selected>
                      ${tipo.descricao}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${tipo.id}">
                      ${tipo.descricao}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Classificação Interna:</td>
          <td>
              <jsp:useBean
                id="servicosCi"
                scope="page"
                class="locacaomidias.servicos.ClassificacaoInternaServices"/>

            <select name="idClassificacaoInterna" required>
              <c:forEach items="${servicosCi.todos}" var="classificacaoInterna">
                <c:choose>
                  <c:when test="${requestScope.midia.classificacaoInterna.id eq classificacaoInterna.id}">
                    <option value="${classificacaoInterna.id}" selected>
                      ${classificacaoInterna.descricao} R$ ${classificacaoInterna.valorAluguel}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${classificacaoInterna.id}">
                      ${classificacaoInterna.descricao} R$ ${classificacaoInterna.valorAluguel}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>
              
          </td>
        </tr>
        <tr>
          <td>
            <a href="${cp}/formularios/midias/listagem.jsp">
              Voltar
            </a>
          </td>
          <td class="alinharDireita">
            <input type="submit" value="Alterar"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
