<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaLocacoes?acao=preparar"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Locações Cadastradas</title>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="${cp}/css/estilos.css"/>
        <script src="${cp}/js/formularios/locacoes/listagem.js"></script>

        
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

        <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Locações Cadastradas</h1>

        <table class="tabelaListagem">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Data do Início</th>
                    <th>Data do Fim</th>
                    <th>Nome do Cliente</th> 
                    <th>Cancelada</th>  
                    <th>Cancelar</th>  
                </tr>
            </thead>
            <tbody>
                <jsp:useBean
                    id="servicos"
                    scope="page"
                    class="locacaomidias.servicos.LocacaoServices"/>

                <c:forEach items="${servicos.todos}" var="locacao">
                    <tr>
                        <td style="color: #000">${locacao.id}</td>
                        <td style="color: #000">${locacao.dataInicio}</td>
                        <td style="color: #000">${locacao.dataFim}</td>
                        <td style="color: #000">${locacao.cliente.nome} ${locacao.cliente.sobrenome}</td>
                        <td style="color: #000">${locacao.cancelada}</td>
                        <td>
                        <c:choose>
                            <c:when test="${locacao.cancelada}">
                                Cancelada
                            </c:when>
                            <c:otherwise>
                                <a href="#" data-id="${locacao.id}" onclick="cancelarLocacao(event,'${cp}')">
                                Cancelar
                                </a>
                            </c:otherwise>
                        </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
                <div class="botoes">
                    <p>
                        <a href="${cp}/index.jsp">Voltar</a>
                    </p>
                     <p>
                        <a href="${cp}/formularios/locacoes/novo.jsp">Nova Locação</a>
                     </p>
    </body>
</html>