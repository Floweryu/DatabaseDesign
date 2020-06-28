package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.User;

import java.util.List;

@Repository      // 这是mybatis操作的数据库
public interface UserDao {
    // 根据用户 id 获取用户角色
    String getUserRoleByID(Integer userId);
    // 根据用户名查询用户(单个)
    User queryByName(String username);
    // 根据用户 id 获取用户信息
    User getAllById(Integer id);
    // 修改用户信息
    void updateUser(User user);
    // 添加用户
    void addUser(User user);
    // 获取所有的用户
    List<User> getAllUsers();
    // 删除用户
    void deleteById(Integer id);
    // 删除多个用户
    void deleteManyUsers(List<Integer> ids);
    // 根据用户名查找用户
    List<User> getUserByUsername(String username);

}
