<!DOCTYPE html>
<%@page import="Entidades.ProductionCompany"%> <%@page import="DAOs.DAOProductionCompany"%>
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
        <% DAOProductionCompany daoPC = null;
            if (String.valueOf(session.getAttribute("role")).equals("0")
                    || String.valueOf(session.getAttribute("role")).equals("null")) {
                response.sendRedirect("index.jsp");
            } else {
                daoPC = new DAOProductionCompany();
            }
        %>
        <%
            String acao = "";
            try {
                acao = String.valueOf(session.getAttribute("acao"));
                if (acao.equals("null")) {
                    acao = "buscar";
                }
                if (!String.valueOf(session.getAttribute("where")).equals("produtora")) {
                    acao = "buscar";
                }
            } catch (Exception e) {
                acao = "buscar";
            }
            session.setAttribute("acao", acao);
            session.setAttribute("where", "produtora");
            if (String.valueOf(session.getAttribute("role")).equals("0") || String.valueOf(session.getAttribute("role")).equals("null")) {
                response.sendRedirect("index.jsp");
            } else {
                daoPC = new DAOProductionCompany();
            }
        %>
        <header
            id="headerTop"
            class="d-flex justify-content-between align-items-center pt-4 w-100"
            >
            <div class="d-flex gap column-gap-2 ps-5">
                <!-- <img src="" alt="Logo" class=".img-fluid"> -->
                <a href="index.jsp"
                   ><h1>
                        Cadastro - <%
                            out.println(String.valueOf(session.getAttribute("nick")));%>
                    </h1></a
                >
            </div>
            <nav class="d-flex justify-content-around align-items-center pe-5 w-50">
                <div class="d-flex gap column-gap-4">
                    <a href="./cadastroFilmes.jsp">Cadastro Filmes</a>
                    <a href="./cadastroGeneros.jsp">Cadastro Generos</a>
                    <a href="./cadastroPalavrasChaves.jsp">Cadastro Palavras-chaves</a>
                    <a href="./cadastroProdutoras.jsp">Cadastro Produtoras</a>
                </div>
            </nav>
        </header>

        <main class="mainAdm pt-5 pb-5">
            <form id="produtora" class="telaCadastro p-5" method="post" action="acaoProdutora">
                <div class="principal">
                    <h1 class="fs-1">Produtora</h1>
                    <div class="d-flex column-gap-2 cadastros">
                        <label class="fs-4" for="idProdutora">ID da Produtora: </label>
                        <input id="idProdutora" name="idProdutora" type="number" min="1" required
                               <%String id = "null";
                                   try {
                                       id = String.valueOf(session.getAttribute("id"));
                                   } catch (Exception e) {
                                       id = "null";
                                   }
                                   if (!(id.equals("null")) && !(String.valueOf(session.getAttribute("acao")).equals("buscar"))) {
                                       out.println("value='" + id + "'");
                                       out.println("readonly");
                                   }%>/>
                    </div>
                    <div class="d-flex column-gap-2 cadastros">
                        <label class="fs-4" for="idProdutora">Nome da produtora: </label>
                        <input id="produtora" name="produtora" type="text"
                               <%
                                   try {
                                       if (!(id.equals("null")) && (String.valueOf(session.getAttribute("acao")).equals("alterar"))) {
                                           out.println("value='" + String.valueOf(daoPC.obter(Integer.valueOf(id)).getCompanyName()) + "'");
                                       }
                                   } catch (Exception e) {
                                   out.println("value=\'\'");
                                   }
                               %>/>
                    </div>
                    <div class="d-flex column-gap-2 align-items-center">
                        <input
                            id="periferico"
                            type="checkbox"
                            class="botaoPeriferico"
                            onclick="perifericos(produtoraAdd)"
                            />
                        <label for="periferico">Adicionar produtora</label>
                    </div>
                </div>

                <div class="botoesCRUD d-flex flex-column row-gap-2">
                    <button
                        name="acao"
                        value="buscar"
                        class="botaoAdm buscar"
                        <%if (!(acao.equals("buscar"))) {
                                out.println("hidden");
                            }%>
                        >
                        Buscar
                    </button>
                    <button
                        name="acao"
                        value="listar"
                        class="botaoAdm buscar"
                        <%if (!(acao.equals("buscar"))) {
                                out.println("hidden");
                            }%>
                        >
                        Listar
                    </button>
                    <button
                        name="acao"
                        value="alterar"
                        class="botaoAdm alterar"
                        <%if (!(acao.equals("alterar"))) {
                                out.println("hidden");
                            }%>
                        >
                        Alterar
                    </button>
                    <button
                        name="acao"
                        value="excluir"
                        class="botaoAdm excluir"
                        <%if (!(acao.equals("alterar"))) {
                                out.println("hidden");
                            }%>
                        >
                        Excluir
                    </button>
                    <button
                        name="acao"
                        value="cancelar"
                        class="botaoAdm excluir"
                        <%if ((acao.equals("buscar"))) {
                                out.println("hidden");
                            }%>
                        >
                        Cancelar
                    </button>
                    <button
                        name="acao"
                        value="salvar"
                        class="botaoAdm excluir"
                        <%if (!(acao.equals("salvar"))) {
                                out.println("hidden");
                            }%>
                        >
                        Salvar
                    </button>
                </div>

                <!-- CHAMA O PRODUTORA -->
            </form>

            <form id="produtoraAdd" class="telaCadastro p-5" hidden>
                <div class="principal">
                    <h1 class="fs-1">Produtora</h1>
                    <div class="d-flex column-gap-2 cadastros">
                        <label class="fs-4" for="idFilme">ID da produtora: </label>
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