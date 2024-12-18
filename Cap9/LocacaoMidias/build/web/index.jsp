<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Locadora Arthur Chiodi</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="icon" href="" type="image/x-icon">
  </head>

  <body>

    <div class="header">
    <h1>Locadora Arthur Chiodi </h1>
      <nav class="menu">
        <ul>
          <li><a href="${cp}/formularios/locacoes/listagem.jsp">Locações</a></li>
          <li><a href="${cp}/formularios/exemplares/listagem.jsp">Exemplares</a></li>
          <li><a href="${cp}/formularios/midias/listagem.jsp">Mídias</a></li>
          <li><a href="${cp}/formularios/atores/listagem.jsp">Atores/Atrizes</a></li>
          <li><a href="${cp}/formularios/generos/listagem.jsp">Gêneros</a></li>
          <li><a href="${cp}/formularios/classificacoesEtarias/listagem.jsp">Classificações Etárias</a></li>
          <li><a href="${cp}/formularios/tipos/listagem.jsp">Tipos</a></li>
          <li><a href="${cp}/formularios/classificacoesInternas/listagem.jsp">Classificações Internas</a></li>
          <li><a href="${cp}/formularios/clientes/listagem.jsp">Clientes</a></li>
          <li><a href="${cp}/formularios/cidades/listagem.jsp">Cidades</a></li>
          <li><a href="${cp}/formularios/estados/listagem.jsp">Estados</a></li>
        </ul>
      </nav>
    </div>
        
        <div class="home">
            <div class="apresentacao">
                <div class="titulo">
                    <h1>Alugue seus filmes favoritos em nosso catalogo!</h1>
                </div>
                <div class="frases">
                    <p>"Bem-vindo à Locadora Arthur Chiodi!</p>
                <p>"Aqui você encontra os melhores filmes para todos os gostos. 
                Explore nosso catálogo e aproveite momentos inesquecíveis!"</p>
                <p>Os filmes em nossa coleção são avaliados por usuários do mundo inteiro!</p>
                </div>
               <div class="image-container">
                    <img class="active" src="img/img.JPG" alt="Imagem 1">
                    <img src="img/img2.jpg" alt="Imagem 2">
                    <img src="img/img3.jpg" alt="Imagem 3">
                    <img src="img/img4.jpg" alt="Imagem 4">
                    <img src="img/img5.jpg" alt="Imagem 5">
                    <img src="img/img6.jpg" alt="Imagem 6">
                </div> 
                <div class="reviews-container">
                    <div class="card">
                      <h3>Operação Big Hero</h3>
                      <p>Aluguei esse filme para o meu filho e ele amou!</p>
                      <div class="stars">
                        ★★★★★
                      </div>
                    </div>
                    <div class="card">
                      <h3>DeadPoll 3</h3>
                      <p>Filme sensacional, alugem sem medo!</p>
                      <div class="stars">
                        ★★★★★
                      </div>
                    </div>
                    <div class="card">
                      <h3>A culpa é das estrelas</h3>
                      <p>Chorei com o final, assitam!</p>
                      <div class="stars">
                        ★★★★★
                      </div>
                    </div>
                </div>
            </div>
        </div>
                
    <script>
        document.addEventListener("DOMContentLoaded", function () {
          var images = document.querySelectorAll('.image-container img');
          var currentIndex = 0;

          function showImage(index) {
            images.forEach(function (img, i) {
              img.classList.toggle('active', i === index);
            });
          }

          function nextImage() {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
          }

          setInterval(nextImage, 4000);
          showImage(currentIndex);
        });
    </script>

  </body>

</html>