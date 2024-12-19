<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Nova Mídia</title>
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

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Nova Mídia</h1>

    <form method="post" action="${cp}/processaMidias">

      <input name="acao" type="hidden" value="inserir"/>

      <table>
        <tr>
          <td class="campos">Título:</td>
          <td>
            <input name="titulo"
                   type="text"
                   size="10"
                   maxlength="100"
                   required/>
          </td>
        </tr>
        <tr>
          <td class="campos">Ano de Lançamento:</td>
          <td>
            <input name="anoLancamento"
                   type="text"
                   size="4"
                   maxlength="100"
                   required/>
          </td>
        </tr>
        <tr>
          <td class="campos">Código de Barras:</td>
          <td>
            <input name="codigoBarras"
                   type="text"
                   size="20"
                   pattern="\d{13}"
                   placeholder="9999999999999"
                   required/>
          </td>
        </tr>
        <tr>
          <td class="campos">Duração em Minutos:</td>
          <td>
            <input name="duracaoEmMinutos"
                   type="number"
                   maxlength="10"
                   required/>
          </td>
        </tr>
        <tr>
          <td class="campos">Ator/Atriz Principal:</td>
          <td>
            <jsp:useBean 
                id="servicosA" 
                scope="page" 
                class="locacaomidias.servicos.AtorServices"/>

            <select name="idAtor" required>
              <c:forEach items="${servicosA.todos}" var="ator">
                <option value="${ator.id}">
                  ${ator.nome} ${ator.sobrenome}
                </option>
              </c:forEach>
            </select>

          </td>
        </tr><tr>
          <td class="campos">Ator/Atriz Coadjuvante:</td>
          <td>

            <jsp:useBean 
                id="servicosA2" 
                scope="page" 
                class="locacaomidias.servicos.AtorServices"/>

            <select name="idAtor2" required>
              <c:forEach items="${servicosA2.todos}" var="ator2">
                <option value="${ator2.id}">
                  ${ator2.nome} ${ator2.sobrenome}
                </option>
              </c:forEach>
            </select>

          </td>
        </tr><tr>
          <td class="campos">Gênero:</td>
          <td>
            <jsp:useBean 
                id="servicosG" 
                scope="page" 
                class="locacaomidias.servicos.GeneroServices"/>

            <select name="idGenero" required>
              <c:forEach items="${servicosG.todos}" var="genero">
                <option value="${genero.id}">
                  ${genero.descricao}
                </option>
              </c:forEach>
            </select>

          </td>
        </tr><tr>
          <td class="campos">Classificação Etária:</td>
          <td>

            <jsp:useBean 
                id="servicosCe" 
                scope="page" 
                class="locacaomidias.servicos.ClassificacaoEtariaServices"/>

            <select name="idClassificacaoEtaria" required>
              <c:forEach items="${servicosCe.todos}" var="classificacaoEtaria">
                <option value="${classificacaoEtaria.id}">
                  ${classificacaoEtaria.descricao}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td class="campos">Tipo:</td>
          <td>
            <jsp:useBean 
                id="servicosT" 
                scope="page" 
                class="locacaomidias.servicos.TipoServices"/>

            <select name="idTipo" required>
              <c:forEach items="${servicosT.todos}" var="tipo">
                <option value="${tipo.id}">
                  ${tipo.descricao}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td class="campos">Classificação Interna:</td>
          <td>
            <jsp:useBean 
                id="servicosCi" 
                scope="page" 
                class="locacaomidias.servicos.ClassificacaoInternaServices"/>

            <select name="idClassificacaoInterna" required>
              <c:forEach items="${servicosCi.todos}" var="classificacaoInterna">
                <option value="${classificacaoInterna.id}">
                  ${classificacaoInterna.descricao} ${classificacaoInterna.valorAluguel}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td>
              <div class="voltar">
            <a href="${cp}/formularios/midias/listagem.jsp">
              Voltar
            </a>
              </div>
          </td>
          <td class="botao">
            <input type="submit" value="Salvar"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
