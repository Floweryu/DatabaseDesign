package pinksmile.database.service;

import org.springframework.stereotype.Service;
import pinksmile.database.dao.StockingDao;
import pinksmile.database.domain.Stock;
import pinksmile.database.domain.Stocking;

import java.util.Date;
import java.util.List;

@Service
public class StockingService {
    private final StockingDao stockingDao;

    public StockingService(StockingDao stockingDao) { this.stockingDao = stockingDao; }

    // 获取所有入库记录
    public List<Stocking> getAllStockings() {return stockingDao.getAllStockings();}

    public Stocking getStockingById(Integer id) {return stockingDao.getStockingById(id);}

    public void updateStocking(Stocking stocking){stockingDao.updateStocking(stocking);}

    public void addStocking(Stocking stocking){stockingDao.addStocking(stocking);}

    public List<Stocking> getStockingByPid(Integer pid) {return stockingDao.getStockingByPid(pid);}

    public List<Stocking> getStockingByRid(Integer rid) {return stockingDao.getStockingByRid(rid);}

    public List<Stocking> getStockingByTime(Date time) {return stockingDao.getStockingByTime(time);}

    public void deleteManyStockings(List<Integer> ids) {stockingDao.deleteManyStockings(ids);}

    public void deleteOneStocking(Integer id){stockingDao.deleteOneStocking(id);}
}
