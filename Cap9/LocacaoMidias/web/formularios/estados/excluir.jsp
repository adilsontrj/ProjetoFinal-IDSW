<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Excluir Estado</title>
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
      

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Excluir Estado</h1>

    <form method="post" action="${cp}/processaEstados">

      <input name="acao" type="hidden" value="excluir"/>
      <input name="id" type="hidden" value="${requestScope.estado.id}"/>

      <table>
        <tr>
          <td class="campos" style="color: #000">Nome:</td>
          <td style="color: #000">${requestScope.estado.nome}</td>
        </tr>
        <tr>
          <td class="campos" style="color: #000">Sigla:</td>
          <td style="color: #000">${requestScope.estado.sigla}</td>
        </tr>
        <tr>
          <td>
              <div class="volta">
                   <a href="${cp}/formularios/estados/listagem.jsp"> Voltar ao Inicio</a>
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
