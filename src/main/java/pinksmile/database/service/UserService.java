package pinksmile.database.service;

import pinksmile.database.dao.UserDao;
import pinksmile.database.domain.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) { this.userDao = userDao; }

    // 通过用户ID得到用户角色
    public String getUserRoleByID(Integer userId) {return  userDao.getUserRoleByID(userId);}
    // 根据用户名查询用户（单个）
    public User queryByName(String username) {return userDao.queryByName(username);}
    // 通过用户ID得到用户所有信息
    public User getAllById(Integer userId) {return userDao.getAllById(userId);}
    // 添加用户
    public void addUser(User user) {userDao.addUser(user);}
    // 获取所有用户
    public List<User> getAllUsers() {return userDao.getAllUsers();}
    // 删除用户
    public void deleteById(Integer userId) { userDao.deleteById(userId);}
    // 删除多个用户
    public void deleteManyUsers(List<Integer> ids){userDao.deleteManyUsers(ids);}
    // 修改用户信息
    public void updateUser(User user){userDao.updateUser(user);}
    // 根据用户名查询用户
    public List<User> getUserByUsername(String username){return userDao.getUserByUsername(username);}

}
