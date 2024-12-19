<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Nova Locação</title>
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
        
        <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Nova Locação</h1>

        <form method="post" action="${cp}/processaLocacoes">

            <input name="acao" type="hidden" value="inserir"/>

            <table>
                <tr>
                    <td class="campos">Data do Início:</td>
                    <td>
                        <input name="dataInicio"
                               type="date"
                               size="8"
                               placeholder="dd/mm/yyyy"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td class="campos">Data do Fim:</td>
                    <td>
                        <input name="dataFim"
                               type="date"
                               size="8"
                               placeholder="dd/mm/yyyy"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td class="campos">Cliente:</td>
                    <td>
                        <jsp:useBean
                            id="servicos"
                            scope="page"
                            class="locacaomidias.servicos.ClienteServices"/>

                        <select name="idCliente" required>
                            <c:forEach items="${servicos.todos}" var="cliente">
                                <option value="${cliente.id}">
                                    ${cliente.nome} ${cliente.sobrenome}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>              
                <tr>
                    <td class="campos">Mídia(Ano): </td>
                    <td>
                        <jsp:useBean
                            id="servicosE"
                            scope="page"
                            class="locacaomidias.servicos.ExemplarServices"/>

                        <select name="idExemplar" required>
                            <c:forEach items="${servicosE.todos}" var="exemplar">
                                <option value="${exemplar.codigoInterno}">
                                    ${exemplar.midia.titulo} - ${exemplar.midia.anoLancamento}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>              
                <tr>
                    <td>
                        <div class="voltar">
                        <a href="${cp}/formularios/locacoes/listagem.jsp">
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