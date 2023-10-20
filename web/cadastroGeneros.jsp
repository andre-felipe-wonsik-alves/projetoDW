<!DOCTYPE html>
<%@page import="Entidades.Movie"%> <%@page import="DAOs.DAOMovies"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cadastro</title>
    <link rel="stylesheet" href="./assets/css/styleEfeitos.css" />
    <link rel="stylesheet" href="./assets/css/styleLandingPage.css" />
    <link rel="stylesheet" href="./assets/css/styleFilmeIndividual.css" />
    <link rel="stylesheet" href="./assets/css/styleAdm.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
  </head>
  <body class="bodyAdm">
    <% DAOMovies daoMovies = null; if
    (String.valueOf(session.getAttribute("role")).equals("0") ||
    String.valueOf(session.getAttribute("role")).equals("null")) {
    response.sendRedirect("index.jsp"); } else { daoMovies = new DAOMovies(); }
    %>
    <header
      id="headerTop"
      class="d-flex justify-content-between align-items-center pt-4 w-100"
    >
      <div class="d-flex gap column-gap-2 ps-5">
        <!-- <img src="" alt="Logo" class=".img-fluid"> -->
        <a href="index.jsp"
          ><h1>
            Cadastro - <%out.println(String.valueOf(session.getAttribute("nick")));%>
          </h1></a
        >
      </div>
      <nav class="d-flex justify-content-around align-items-center pe-5 w-50">
        <div class="d-flex gap column-gap-4">
          <!-- <input
                        class="escolha"
                        id="escolhaFilme"
                        name="escolha"
                        type="radio"
                        value="0"
                        onclick="aparecerTela()"
                        />
                    <label for="escolhaFilme">Filme</label>
                    <input
                        class="escolha"
                        id="escolhaPalavras-chave"
                        name="escolha"
                        type="radio"
                        value="2"
                        onclick="aparecerTela()"
                        />
                    <label for="escolhaPalavras-chave">Palavras Chave</label>
                    <input
                        class="escolha"
                        id="escolhaGeneros"
                        name="escolha"
                        type="radio"
                        value="3"
                        onclick="aparecerTela()"
                        />
                    <label for="escolhaGeneros">G�neros</label>
                    <input
                        class="escolha"
                        id="escolhaProdutora"
                        name="escolha"
                        type="radio"
                        value="4"
                        onclick="aparecerTela()"
                        />
                    <label for="escolhaProdutora">Produtora</label>
                </div>
            </nav> -->
          <a href="./cadastroFilmes.jsp">Cadastro Filmes</a>
          <a href="./cadastroGeneros.jsp">Cadastro Generos</a>
          <a href="./cadastroPalavrasChaves.jsp">Cadastro Palavras-chaves</a>
          <a href="./cadastroProdutoras.jsp">Cadastro Produtoras</a>
        </div>
      </nav>
    </header>

    <main class="mainAdm pt-5 pb-5">
      <form
        action="telaAdm.jsp"
        id="generos"
        method="get"
        class="telaCadastro p-5"
        
      >
        <div class="principal row-gap-2">
          <h1 class="fs-1">Generos</h1>
          <div class="d-flex column-gap-2 cadastros">
            <label class="fs-4" for="idGenre">ID do G�nero: </label>
            <input id="idGenre" name="idGenre" type="number" />
          </div>
          <div class="d-flex column-gap-2 cadastros">
            <label class="fs-4" for="idPalavraChave">ID genero: </label>
            <input id="idPalavraChave" name="idGenero" type="number" />
          </div>
          <div class="d-flex column-gap-2 align-items-center">
            <input
              id="periferico"
              type="checkbox"
              class="botaoPeriferico"
              onclick="perifericos(genero)"
            />
            <label for="periferico">Adicionar generos</label>
          </div>
        </div>

        <div class="botoesCRUD d-flex flex-column row-gap-2">
          <button
            action=""
            name="botaoBuscarG"
            class="botaoAdm buscar"
            value="buscarFilmes"
          >
            Buscar
          </button>
          <button
            action=""
            name="botaoAlterarG"
            class="botaoAdm alterar"
            hidden
          >
            Alterar
          </button>
          <button action="" name="botaoExluirG" class="botaoAdm excluir" hidden>
            Excluir
          </button>
          <button
            action=""
            name="botaoCancelarG"
            class="botaoAdm excluir"
            hidden
          >
            Cancelar
          </button>
          <button action="" name="botaoSalvarG" class="botaoAdm excluir" hidden>
            Salvar
          </button>
        </div>
        <!-- CHAMA O GENERO -->
      </form>

      <form id="genero" class="telaCadastro p-5" hidden>
        <div class="principal">
          <h1 class="fs-1">Genero</h1>
          <div class="d-flex column-gap-2 cadastros">
            <label class="fs-4" for="idFilme">ID do genero: </label>
            <input id="idFilme" name="idFilme" type="number" />
          </div>
          <div class="d-flex column-gap-2 cadastros">
            <label class="fs-4" for="idPalavraChave">Nome: </label>
            <input id="idPalavraChave" name="idPalavraChave" type="text" />
          </div>
        </div>
        <button action="submit" class="botaoAdm botaoAdd">Adicionar</button>
      </form>
    </main>
    <script src="./assets/js/cadastroAdm.js"></script>
  </body>
</html>
