<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaClientes?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Lista de Clientes</title>
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

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Clientes Cadastrados</h1>
    
    <table class="tabelaListagem">
      <thead>
        <tr>
          <th>Id</th>
          <th>Nome</th>
          <th>Sobrenome</th>
          <th>E-mail</th>
          <th>CPF</th>
          <th>Cidade</th>
          <th>Alterar</th>
          <th>Excluir</th>
        </tr>
      </thead>
      <tbody>

        <jsp:useBean 
            id="servicos"
            scope="page"
            class="locacaomidias.servicos.ClienteServices"/>

        <c:forEach items="${servicos.todos}" var="cliente">
          <tr>
            <td style="color: #000">${cliente.id}</td>
            <td style="color: #000">${cliente.nome}</td>
            <td style="color: #000">${cliente.sobrenome}</td>
            <td style="color: #000">${cliente.email}</td>
            <td style="color: #000">${cliente.cpf}</td>
            <td style="color: #000">${cliente.cidade.nome}</td>
            <td>
              <a href="${cp}/${prefixo}Alteracao&id=${cliente.id}">
                Alterar
              </a>
            </td>
            <td>
              <a href="${cp}/${prefixo}Exclusao&id=${cliente.id}">
                Excluir
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>

    </table>
        <div class="botoes">
            <p>
                <a href="${cp}/formularios/clientes/novo.jsp">Cadastrar Cliente</a>
            </p>
             <p>
                 <a href="${cp}/index.jsp">Voltar</a>
             </p>
        </div>

   

  </body>

</html>
