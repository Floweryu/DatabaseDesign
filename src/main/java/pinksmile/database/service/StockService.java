package pinksmile.database.service;

import org.springframework.stereotype.Service;
import pinksmile.database.dao.StockDao;
import pinksmile.database.domain.Stock;

import java.util.HashMap;
import java.util.List;

@Service
public class StockService {
    private final StockDao stockDao;

    public StockService(StockDao stockDao) {
        this.stockDao = stockDao;
    }

    // 获取库存视图
    public List<HashMap> getStockView() {return stockDao.getStockView();}
    // 通过仓库名查找库存
    public List<HashMap> getStockByRepositoryName(String rname) {return stockDao.getStockByRepositoryName(rname);}
    // 通过产品名查找库存
    public List<HashMap> getStockByProductName(String pname) {return stockDao.getStockByProductName(pname);}

    public Integer getAmountByPid(Integer pid) {return stockDao.getAmountByPid(pid);}

    public List<Stock> getAllStocks(){return stockDao.getAllStocks();}

    public void addStocks(Stock stock) {stockDao.addStocks(stock);}

    public Stock getOneStocksByPid(Integer pid){return stockDao.getOneStocksByPid(pid);}

    public void updateStocks(Stock stock) {stockDao.updateStocks(stock);}

    public void deleteOneStocks(Integer pid) {stockDao.deleteOneStocks(pid);}

    public void deleteManyStocks(List<Integer> ids) {stockDao.deleteManyStocks(ids);}

    public List<Stock> getStocksByPid(Integer pid) {return stockDao.getStocksByPid(pid);}

    public List<Stock> getStocksByRid(Integer rid) {return stockDao.getStocksByRid(rid);}
}
