package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.Stock;

import java.util.HashMap;
import java.util.List;

@Repository
public interface StockDao {
    List<HashMap> getStockView();
    List<HashMap> getStockByRepositoryName(String rname);
    List<HashMap> getStockByProductName(String pname);
    Integer getAmountByPid(Integer pid);
    List<Stock> getAllStocks();
    void addStocks(Stock stock);
    Stock getOneStocksByPid(Integer pid);
    void updateStocks(Stock stock);
    void deleteOneStocks(Integer pid);
    void deleteManyStocks(List<Integer> ids);
    List<Stock> getStocksByPid(Integer pid);
    List<Stock> getStocksByRid(Integer rid);
}
