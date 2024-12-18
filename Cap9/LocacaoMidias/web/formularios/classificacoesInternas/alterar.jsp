<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Classificação Interna</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Alterar Classificação Interna</h1>

    <form method="post" action="${cp}/processaClassificacaoesInternas">

      <input name="acao" type="hidden" value="alterar"/>
      <input name="id" type="hidden" value="${requestScope.classificacaoInterna.id}"/>

      <table>
        <tr>
          <td class="alinharDireita">Descrição:</td>
          <td>
            <input name="descricao"
                   type="text"
                   size="20"
                   maxlength="30"
                   required
                   value="${requestScope.classificacaoInterna.descricao}"/>
          </td>
        </tr>
        <tr>
        <td class="alinharDireita">Valor de Aluguel(R$):</td>
          <td>
            <input name="valorAluguel"
                   type="number"
                   placeholder="R$ 9,99"
                   step="0.01"
                   min="0"
                   required
                   value="${requestScope.classificacaoInterna.valorAluguel}"/>
          </td>
        </tr>
        <tr>
          <td>
            <a href="${cp}/formularios/classificacoesInternas/listagem.jsp">
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
