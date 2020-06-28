package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.Repositorys;
import java.util.List;

@Repository
public interface RepositoryDao {
    // 获取所有仓库信息
    List<Repositorys> getAllRepositorys();
    // 添加仓库
    void addRepository(Repositorys repository);
    // 通过仓库id获取仓库信息
    Repositorys getRepositoryById(Integer id);
    // 修改仓库信息
    void updateRepository(Repositorys repository);
    // 删除一个仓库
    void deleteOneRepository(Integer id);
    // 删除多个仓库
    void deleteManyRepositorys(List<Integer> ids);
    // 通过仓库名查找仓库
    List<Repositorys> getRepositoryByName(String name);
    Repositorys getOneRepository(String name);
}
