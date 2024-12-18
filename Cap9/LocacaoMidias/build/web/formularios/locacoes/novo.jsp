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
        
        <h1>Nova Locação</h1>

        <form method="post" action="${cp}/processaLocacoes">

            <input name="acao" type="hidden" value="inserir"/>

            <table>
                <tr>
                    <td class="alinharDireita">Data do Início:</td>
                    <td>
                        <input name="dataInicio"
                               type="date"
                               size="8"
                               placeholder="dd/mm/yyyy"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td class="alinharDireita">Data do Fim:</td>
                    <td>
                        <input name="dataFim"
                               type="date"
                               size="8"
                               placeholder="dd/mm/yyyy"
                               required/>
                    </td>
                </tr>
                <tr>
                    <td class="alinharDireita">Cliente:</td>
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
                    <td class="alinharDireita">Mídia(Ano): </td>
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
                        <a href="${cp}/formularios/locacoes/listagem.jsp">
                            Voltar
                        </a>
                    </td>
                    <td class="alinharDireita">
                        <input type="submit" value="Salvar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>