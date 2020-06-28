package pinksmile.database.service;

import org.springframework.stereotype.Service;
import pinksmile.database.dao.OutstockDao;
import pinksmile.database.domain.Outstock;
import pinksmile.database.domain.Stocking;

import java.util.Date;
import java.util.List;

@Service
public class OutstockService {
    private final OutstockDao outstockDao;

    public OutstockService(OutstockDao outstockDao) {this.outstockDao = outstockDao;}

    // 获取所有出库记录
    public List<Outstock> getAllOutstocks() {return outstockDao.getAllOutstocks();}

    public Outstock getOutstockById(Integer id) {return outstockDao.getOutstockById(id);}

    public void updateOutstock(Outstock outstock){outstockDao.updateOutstock(outstock);}

    public void addOutstock(Outstock outstock){outstockDao.addOutstock(outstock);}

    public List<Outstock> getOutstockByPid(Integer pid) {return outstockDao.getOutstockByPid(pid);}

    public List<Outstock> getOutstockByRid(Integer rid) {return outstockDao.getOutstockByRid(rid);}

    public List<Outstock> getOutstockByTime(Date time) {return outstockDao.getOutstockByTime(time);}

    public void deleteManyOutstocks(List<Integer> ids) {outstockDao.deleteManyOutstocks(ids);}

    public void deleteOneOutstock(Integer id){outstockDao.deleteOneOutstock(id);}
}
