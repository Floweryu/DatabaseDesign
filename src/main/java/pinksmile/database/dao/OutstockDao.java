package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.Outstock;

import java.util.Date;
import java.util.List;

@Repository
public interface OutstockDao {
    List<Outstock> getAllOutstocks();

    Outstock getOutstockById(Integer id);

    void updateOutstock(Outstock outstock);

    void addOutstock(Outstock outstock);

    List<Outstock> getOutstockByPid(Integer pid);

    List<Outstock> getOutstockByRid(Integer rid);

    List<Outstock> getOutstockByTime(Date time);

    void deleteManyOutstocks(List<Integer> ids);

    void deleteOneOutstock(Integer id);
}
