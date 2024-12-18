<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Classificação Interna</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Excluir Classificação Interna</h1>

    <form method="post" action="${cp}/processaClassificacaoesInternas">

      <input name="acao" type="hidden" value="excluir"/>
      <input name="id" type="hidden" value="${requestScope.classificacaoInterna.id}"/>

      <table>
        <tr>
          <td class="alinharDireita">Descrição:</td>
          <td>${requestScope.classificacaoInterna.descricao}</td>
        </tr>
        <tr>
          <td class="alinharDireita">Valor do Aluguel:</td>
          <td>${requestScope.classificacaoInterna.valorAluguel}</td>
        </tr>
        <tr>
          <td>
            <a href="${cp}/formularios/classificacoesInternas/listagem.jsp">
              Voltar
            </a>
          </td>
          <td class="alinharDireita">
            <input type="submit" value="Excluir"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
