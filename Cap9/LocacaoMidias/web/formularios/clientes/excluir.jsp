<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Cliente</title>
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
          
          .campos{
              display: flex;
              justify-content: flex-end;
              margin-right: 50px;  
          }
          
           botaoExcluir{
              margin-right: 50%;
          }
              
           input[type="submit"] {
              background-color: #0a661b; 
              color: white; 
              border: none; 
              padding: 15px 32px;
              font-size: 16px;
              cursor: pointer;
              border-radius: 8px;
              transition: background-color 0.3s ease;
         }

            input[type="submit"]:hover {
                background-color: #f80018; 
            }

            input[type="submit"]:active {
                background-color: #f80018;
            }

            input[type="submit"]:focus {
                outline: none;
                box-shadow: 0 0 10px rgba(0, 128, 0, 0.5);
            }

              .volta{
                  margin-right: 50px;
                  color: black;
              }
          
      </style>

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Excluir Cliente</h1>

    <form method="post" action="${cp}/processaClientes">

      <input name="acao" type="hidden" value="excluir"/>
      <input name="id" type="hidden" value="${requestScope.cliente.id}"/>

      <table>
        <tr>
          <td class="campos" style="color: #000">Nome:</td>
          <td style="color: #000">${requestScope.cliente.nome}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Sobrenome:</td>
          <td style="color: #000">${requestScope.cliente.sobrenome}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Data de Nascimento:</td>
          <td style="color: #000">
            <fmt:formatDate 
                pattern="dd/MM/yyyy"
                value="${requestScope.cliente.dataNascimento}"/>
          </td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">CPF:</td>
          <td style="color: #000">${requestScope.cliente.cpf}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">E-mail:</td>
          <td style="color: #000">${requestScope.cliente.email}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Logradouro:</td>
          <td style="color: #000">${requestScope.cliente.logradouro}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Número:</td>
          <td style="color: #000">${requestScope.cliente.numero}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Bairro:</td>
          <td style="color: #000">${requestScope.cliente.bairro}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">CEP:</td>
          <td style="color: #000">${requestScope.cliente.cep}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Cidade:</td>
          <td style="color: #000">${requestScope.cliente.cidade.nome}</td>
        </tr>
        <tr>
          <td>
              <div class="volta">
                <a href="${cp}/formularios/clientes/listagem.jsp">Voltar</a>
              </div>
          </td>
          <td class="botaoExcluir">
            <input type="submit" value="Excluir"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
