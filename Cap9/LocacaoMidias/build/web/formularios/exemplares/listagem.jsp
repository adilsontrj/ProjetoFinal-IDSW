<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaExemplares?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Exemplares Cadastrados</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Exemplares Cadastrados</h1>

    <p>
      <a href="${cp}/formularios/exemplares/novo.jsp">
        Novo Produto
      </a>
    </p>

    <table class="tabelaListagem">
      <thead>
        <tr>
          <th>Id</th>
          <th>Disponível</th>
          <th>Mídia</th>
          <th>Alterar</th>
          <th>Excluir</th>
        </tr>
      </thead>
      <tbody>
          
        <jsp:useBean 
            id="servicos"
            scope="page"
            class="locacaomidias.servicos.ExemplarServices"/>

        <c:forEach items="${servicos.todos}" var="exemplar">
          <tr>
            <td>${exemplar.codigoInterno}</td>
            <td>${exemplar.disponivel}</td>
            <td>${exemplar.midia.titulo}</td>
            <td>
              <a href="${cp}/${prefixo}Alteracao&id=${exemplar.codigoInterno}">
                Alterar
              </a>
            </td>
            <td>
              <a href="${cp}/${prefixo}Exclusao&id=${exemplar.codigoInterno}">
                Excluir
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>

    </table>

    <p><a href="${cp}/index.jsp">Tela Principal</a></p>

  </body>

</html>
