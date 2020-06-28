package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.User;
import pinksmile.database.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("adminmanage")
public class UserController {
    final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // 点击返回添加用户页面
    @GetMapping("/toUser")
    public String toUserAdd(){ return "user/admin-add"; }

    /**
     * 添加用户
     * @param user 要添加的用户
     */
    @Log(value = "添加用户")
    @PostMapping("/addUser")
    @ResponseBody
    public void addUser(User user){
        userService.addUser(user);
    }

    // 点击返回编辑用户页面
    @GetMapping("/editUser/{id}")
    public String toEditUser(@PathVariable("id") Integer id, Model model){
        User editUser = userService.getAllById(id);
        model.addAttribute("edituser", editUser);
        return "user/admin-edit";
    }

    // 修改用户信息
    @Log(value = "修改用户信息")
    @PostMapping("/updateUser")
    public String updateUser(User user){
        userService.updateUser(user);
        return "redirect:/adminmanage/userList";
    }

    // 删除用户
    @Log(value = "删除一个用户")
    @GetMapping("/deleteById")
    public String deleteById(Integer id){
        userService.deleteById(id);
        return "redirect:/adminmanage/userList";
    }

    // 删除多个用户
    @Log(value = "删除多个用户")
    @PostMapping("/deleteUsers")
    public String deleteManyUsers(String checkList){
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();

        for (String str : strs){
            ids.add(Integer.parseInt(str));
        }

        userService.deleteManyUsers(ids);
        return "redirect:/adminmanage/userList";
    }
    /**
     * 获取所有用户，显示到页面
     * @param model 向前台返回数据
     * @return 本地页面
     */
    // value 中的值就是映射到manage.html中的用户管理按钮
    @Log(value = "查看用户信息")
    @GetMapping("/userList")
    public String getAllUsers(Model model,
                              @RequestParam(value = "pn", defaultValue = "1") int pn,
                              @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<User> userList = userService.getAllUsers();
        PageInfo<User> page =new PageInfo<>(userList);
        model.addAttribute("page", page);
        return "user/admin-list";
    }

    /**
     * 根据用户名查询用户
     * @param username  要查询的用户名
     * @param model 返回前端数据
     * @return  结果页面
     */
    @Log(value = "搜索用户信息")
    @GetMapping("/userSearch/{username}")
    public String getUsersByUsername(Model model,
                                     @PathVariable("username") String username,
                                     @RequestParam(value = "pn", defaultValue = "1") int pn,
                                     @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<User> userList =userService.getUserByUsername(username);
        PageInfo<User> page =new PageInfo<>(userList);
        model.addAttribute("page", page);
        return "user/admin-list";
    }

    /**
     * 检查用户是否已经存在
     * @param username 用户名
     * @return 存在或不存在
     */
    @ResponseBody
    @GetMapping("/checkExit/{username}")
    public String checkUserExist(@PathVariable("username") String username){
        User user = userService.queryByName(username);
        if (user != null){
            return "exist";
        }else {
            return "notexist";
        }
    }
}
