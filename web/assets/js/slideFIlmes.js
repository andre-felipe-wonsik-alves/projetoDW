const controles = document.querySelectorAll(".control");
let filmeSelecionado = 0;
const filmes = document.querySelectorAll(".item");
const maximoFilmes = filmes.length;

controles.forEach((control) => {
  control.addEventListener("click", (e) => {
    console.log(e.target.classList.contains("botaoEsquerdo"));
    e.target.classList.contains("botaoEsquerdo") ? (filmeSelecionado -= 1) : (filmeSelecionado += 1);

    filmeSelecionado >= maximoFilmes ? (filmeSelecionado = 0) : filmeSelecionado;
    filmeSelecionado < 0 ? (filmeSelecionado = maximoFilmes - 1) : filmeSelecionado;

    filmes.forEach((item) => item.classList.remove("current-item"));

    filmes[filmeSelecionado].scrollIntoView({
      behavior: "smooth"
    });

    filmes[filmeSelecionado].classList.add("current-item");
  });
});
