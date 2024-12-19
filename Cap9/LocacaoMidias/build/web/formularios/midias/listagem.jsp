<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaMidias?acao=preparar"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Mídias Cadastradas</title>
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

    <h1 style="text-align: center; font-family: sans-serif; margin: 10px 20px">Midias Cadastradas</h1>

    <table class="tabelaListagem">
      <thead>
        <tr>
          <th>Id</th>
          <th>Título</th>
          <th>Ano de Lançamento</th>
          <th>Código de Barras</th>
          <th>Duração em Minutos</th>
          <th>Ator/Atriz Principal</th>
          <th>Ator/Atriz Coadjuvante</th>
          <th>Gênero</th>
          <th>Classificação Etária</th>
          <th>Tipo</th>
          <th>Classificação Interna</th>
          <th>Preço</th>
          <th>Alterar</th>
          <th>Excluir</th>
        </tr>
      </thead>
      <tbody>

          
        <jsp:useBean 
            id="servicos"
            scope="page"
            class="locacaomidias.servicos.MidiaServices"/>

        <c:forEach items="${servicos.todos}" var="midia">
          <tr>
            <td style="color: #000">${midia.id}</td>
            <td style="color: #000">${midia.titulo}</td>
            <td style="color: #000">${midia.anoLancamento}</td>
            <td style="color: #000">${midia.codigoBarras}</td>
            <td style="color: #000">${midia.duracaoEmMinutos}</td>
            <td style="color: #000">${midia.atorPrincipal.nome} ${midia.atorPrincipal.sobrenome}</td>
            <td style="color: #000">${midia.atorCoadjuvante.nome} ${midia.atorCoadjuvante.sobrenome}</td>
            <td style="color: #000">${midia.genero.descricao}</td>
            <td style="color: #000">${midia.classificacaoEtaria.descricao}</td>
            <td style="color: #000">${midia.tipo.descricao}</td>
            <td style="color: #000">${midia.classificacaoInterna.descricao}</td>
            <td style="color: #000">${midia.classificacaoInterna.valorAluguel}</td>
            
            <td>
              <a href="${cp}/${prefixo}Alteracao&id=${midia.id}">
                Alterar
              </a>
            </td>
            <td>
              <a href="${cp}/${prefixo}Exclusao&id=${midia.id}">
                Excluir
              </a>
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
                <a href="${cp}/formularios/midias/novo.jsp">Nova Mídia</a>
            </p>
        </div>
  </body>

</html>
