package pinksmile.database.service;

import org.springframework.stereotype.Service;
import pinksmile.database.dao.RepositoryDao;
import pinksmile.database.domain.Repositorys;

import java.util.List;

@Service
public class RepositoryService {
    private final RepositoryDao repositoryDao;

    public RepositoryService(RepositoryDao repositoryDao) { this.repositoryDao = repositoryDao; }

    // 获取所有仓库信息
    public List<Repositorys> getAllRepositorys(){return repositoryDao.getAllRepositorys();}
    // 添加仓库
    public void addRepository(Repositorys repository){repositoryDao.addRepository(repository);}
    // 通过仓库 id 获取仓库信息
    public Repositorys getRepositoryById(Integer id){return repositoryDao.getRepositoryById(id);}
    // 修改仓库信息
    public void updateRepository(Repositorys repository){repositoryDao.updateRepository(repository);}
    // 删除一个仓库
    public void deleteOneRepository(Integer id){repositoryDao.deleteOneRepository(id);}
    // 删除多个仓库
    public void deleteManyRepositorys(List<Integer> ids){repositoryDao.deleteManyRepositorys(ids);}
    // 通过仓库名查找仓库
    public List<Repositorys> getRepositoryByName(String name) {return repositoryDao.getRepositoryByName(name);}
    public Repositorys getOneRepository(String name)  {return repositoryDao.getOneRepository(name);}
}
