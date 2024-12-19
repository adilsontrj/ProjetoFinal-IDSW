<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Cidade</title>
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
              color: #000;
              justify-content:  flex-end;
          }

          .botao{
              display: flex;
              justify-content: flex-end;
              margin-right: 50px;   
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
            background-color: #000; 
        }

        input[type="submit"]:active {
            background-color: #000;
        }

        input[type="submit"]:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(0, 128, 0, 0.5);
        }
        
        .voltar{
            color: #000;
            margin-left: 10%
        } 
      </style>

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Alterar Cidade</h1>

    <form method="post"  action="${cp}/processaCidades">

      <input name="acao" type="hidden" value="alterar"/>
      <input name="id" type="hidden" value="${requestScope.cidade.id}"/>

      <table>
        <tr>
          <td class="campos">Nome:</td>
          <td>
            <input name="nome"
                   type="text"
                   size="20"
                   maxlength="30"
                   required
                   value="${requestScope.cidade.nome}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Estado:</td>
          <td>

            <jsp:useBean 
                id="servicos"
                scope="page"
                class="locacaomidias.servicos.EstadoServices"/>

            <select name="idEstado" required>
              <c:forEach items="${servicos.todos}" var="estado">
                <c:choose>
                  <c:when test="${requestScope.cidade.estado.id eq estado.id}">
                    <option value="${estado.id}" selected>
                      ${estado.nome} - ${estado.sigla}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${estado.id}">
                      ${estado.nome} - ${estado.sigla}
                    </option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>

          </td>
        </tr>
        <tr>
          <td>
              <div class="voltar">
                <a href="${cp}/formularios/cidades/listagem.jsp">Voltar</a>
              </div>
          </td>
          <td class="botao">
            <input type="submit" value="Alterar"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
