<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Cliente</title>
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

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Alterar Cliente</h1>

    <form method="post" action="${cp}/processaClientes">

      <input name="acao" type="hidden" value="alterar"/>
      <input name="id" type="hidden" value="${requestScope.cliente.id}"/>

      <table>
        <tr>
          <td class="campos">Nome:</td>
          <td>
            <input name="nome"
                   type="text"
                   size="20"
                   maxlength="45"
                   required
                   value="${requestScope.cliente.nome}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Sobrenome:</td>
          <td>
            <input name="sobrenome"
                   type="text"
                   size="20"
                   maxlength="45"
                   required
                   value="${requestScope.cliente.sobrenome}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Data de Nascimento:</td>
          <td>
            <fmt:formatDate 
                pattern="yyyy-MM-dd"
                value="${requestScope.cliente.dataNascimento}"
                var="data" scope="page"/>
            <input name="dataNascimento"
                   type="date"
                   size="8"
                   placeholder="dd/mm/aaaa"
                   required
                   value="${data}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">CPF:</td>
          <td>
            <input name="cpf"
                   type="text"
                   size="13"
                   pattern="\d{3}.\d{3}.\d{3}-\d{2}"
                   placeholder="999.999.999-99"
                   required
                   value="${requestScope.cliente.cpf}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">E-mail:</td>
          <td>
            <input name="email"
                   type="email"
                   size="20"
                   maxlength="60"
                   required
                   value="${requestScope.cliente.email}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Logradouro:</td>
          <td>
            <input name="logradouro"
                   type="text"
                   size="25"
                   maxlength="50"
                   required
                   value="${requestScope.cliente.logradouro}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Número:</td>
          <td>
            <input name="numero"
                   type="text"
                   size="6"
                   maxlength="6"
                   required
                   value="${requestScope.cliente.numero}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Bairro:</td>
          <td>
            <input name="bairro"
                   type="text"
                   size="15"
                   maxlength="30"
                   value="${requestScope.cliente.bairro}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">CEP:</td>
          <td>
            <input name="cep"
                   type="text"
                   size="7"
                   pattern="\d{5}-\d{3}"
                   placeholder="99999-999"
                   required
                   value="${requestScope.cliente.cep}"/>
          </td>
        </tr>
        <tr>
          <td class="campos">Cidade:</td>
          <td>

            <jsp:useBean
                id="servicos"
                scope="page"
                class="locacaomidias.servicos.CidadeServices"/>

            <select name="idCidade" required>
              <c:forEach items="${servicos.todos}" var="cidade">
                <c:choose>
                  <c:when test="${requestScope.cliente.cidade.id eq cidade.id}">
                    <option value="${cidade.id}" selected>
                      ${cidade.nome}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${cidade.id}">
                      ${cidade.nome}
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
                <a href="${cp}/formularios/clientes/listagem.jsp">Voltar</a>
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
