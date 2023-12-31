package DAOs;

import Entidades.ProductionCountry;
import Entidades.ProductionCountryPK;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.TypedQuery;

/**
 *
 * @author Mateus Batichotti Silva | 19/04/2023 - 15:54:37
 */
public class DAOProductionCountry extends DAOGenerico<ProductionCountry> {

    private List<ProductionCountry> lista = new ArrayList<>();

    public DAOProductionCountry() {
        super(ProductionCountry.class);
    }

    //busca com PK composta
    public ProductionCountry obter(ProductionCountryPK phcpk) {
        return em.find(ProductionCountry.class, phcpk);
    }

    public List<ProductionCountry> listInOrderNome() {
        TypedQuery<ProductionCountry> query = em.createQuery("SELECT e FROM ProductionCountry e ORDER BY e.escopo", ProductionCountry.class);
        List<ProductionCountry> resultList = query.getResultList();
        return resultList;
    }

    public List<String> listInOrderNomeStrings() {
        List<ProductionCountry> lf = listInOrderNome();
        List<String> ls = new ArrayList<>();
        for (int i = 0; i < lf.size(); i++) {
            ls.add(lf.get(i).getProductionCountryPK().toString());
        }
        return ls;
    }
    
    public List<ProductionCountry> encontrarPaisesPorFilmeId(String idFilme) {
        TypedQuery<ProductionCountry> query = em.createQuery("SELECT pc FROM ProductionCountry pc WHERE pc.movie.title = :idFilme", ProductionCountry.class);
        query.setParameter("idFilme", idFilme);
        List<ProductionCountry> resultList = query.getResultList();
        return resultList;
    }

    public static void main(String[] args) {
        DAOProductionCountry daoProduction = new DAOProductionCountry();
        //List<ProductionCountry> listaProduction = daoProduction.list();
        //for (ProductionCountry arma : listaProduction) {
        //    System.out.println(arma.getMovie().getTitle() + " - " + arma.getCountry().getCountryName());
        //}
        System.out.println(daoProduction.encontrarPaisesPorFilmeId("American Beauty").get(0).getCountry().getCountryName());
    }
}
