<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaCidades?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Cidades</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>
      <style>
          body{
              background: #e1e1e1;
          }
          
          .botoes{
              display: flex;
              justify-content: flex-end;
              margin-right: 21%;
              gap: 15%;
              margin-top: 10%;
          }
          
           .botoes a {
            display: inline-block;
            padding: 10px 30px;
            background-color: #0a661b ;
            color: white;
            text-decoration: none;
            border-radius: 40px;
            transition: all 0.3s ease;
            text-align: center;
        }

        .botoes a:hover {
            background-color: #000; 
            transform: scale(1.1);
        }
        
        a{
            color: black;
        }
        
        tbody{
            margin-left: 5px;
        }
      </style>
    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Cidades Cadastradas</h1>

    

    <table class="tabelaListagem">
      <thead>
        <tr>
          <th>Id</th>
          <th>Nome</th>
          <th>Estado</th>
          <th>Alterar</th>
          <th>Excluir</th>
        </tr>
      </thead>
      <tbody>

        <jsp:useBean
            id="servicos"
            scope="page"
            class="locacaomidias.servicos.CidadeServices"/>

        <c:forEach items="${servicos.todos}" var="cidade">
          <tr>
            <td style="color: #000">${cidade.id}</td>
            <td style="color: #000">${cidade.nome}</td>
            <td style="color: #000">${cidade.estado.sigla}</td>
            <td>
              <a href="${cp}/${prefixo}Alteracao&id=${cidade.id}">
                Alterar
              </a>
            </td>
            <td>
              <a href="${cp}/${prefixo}Exclusao&id=${cidade.id}">
                Excluir
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
        <div class="botoes">
            <p>
                <a href="${cp}/formularios/cidades/novo.jsp">Cadastrar Cidade</a>
            </p>  
            <p>
                <a href="${cp}/index.jsp">Voltar</a>
            </p>
        </div>

    

  </body>

</html>
