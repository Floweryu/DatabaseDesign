package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.Stocking;

import java.util.Date;
import java.util.List;

@Repository
public interface StockingDao {
    List<Stocking> getAllStockings();

    Stocking getStockingById(Integer id);

    void updateStocking(Stocking stocking);

    void addStocking(Stocking stocking);

    List<Stocking> getStockingByPid(Integer pid);

    List<Stocking> getStockingByRid(Integer rid);

    List<Stocking> getStockingByTime(Date time);

    void deleteManyStockings(List<Integer> ids);

    void deleteOneStocking(Integer id);
}
