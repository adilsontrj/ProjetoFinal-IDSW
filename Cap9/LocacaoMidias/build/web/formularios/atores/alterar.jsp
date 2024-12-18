<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Ator/Atriz</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Alterar Ator/Atriz</h1>

    <form method="post"  action="${cp}/processaAtores">

      <input name="acao" type="hidden" value="alterar"/>
      <input name="id" type="hidden" value="${requestScope.ator.id}"/>

      <table>
        <tr>
          <td class="alinharDireita">Nome:</td>
          <td>
            <input name="nome"
                   type="text"
                   size="20"
                   maxlength="30"
                   required
                   value="${requestScope.ator.nome}"/>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Sobrenome:</td>
          <td>
            <input name="sobrenome"
                   type="text"
                   size="20"
                   maxlength="30"
                   required
                   value="${requestScope.ator.sobrenome}"/>
          </td>
        </tr>
        <tr>
          <td class="alinharDireita">Data de Estréia:</td>
          <td>
            <fmt:formatDate 
                pattern="yyyy-MM-dd"
                value="${requestScope.ator.dataEstreia}"
                var="data" scope="page"/>
            <input name="dataEstreia"
                   type="date"
                   size="8"
                   placeholder="dd/mm/aaaa"
                   required
                   value="${data}"/>
          </td>
        </tr>
        <tr>
          <td>
            <a href="${cp}/formularios/atores/listagem.jsp">Voltar</a>
          </td>
          <td class="alinharDireita">
            <input type="submit" value="Alterar"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
