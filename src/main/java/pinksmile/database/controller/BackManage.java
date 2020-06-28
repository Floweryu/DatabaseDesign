package pinksmile.database.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.User;
import pinksmile.database.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BackManage {
    final UserService userService;

    public BackManage(UserService userService) {
        this.userService = userService;
    }

    /**
     * 后台管理页面数据准备接口
     * @param request 用于获取Session来判断是否登录
     * @return 返回模板页面
     */
    @GetMapping("manage")      // 管理页面网址
    public String manage(HttpServletRequest request){

        HttpSession session=request.getSession();       // 获取登录信息
        Object obj = session.getAttribute("user");
        // 没有登录，返回登录页面
        if(obj == null){     // 登录信息为 null，表示没有登录
            return "login";
        }

        User loginUser = (User) obj;                    // 强制转换成 User
        Integer userId = loginUser.getId();             // 获得登录用户的 id

        String role = userService.getUserRoleByID(userId);      // 通过登录用户的 id 得到用户的角色
        // 如果是用户登录，返回用户界面
        if (role.equals("user")){
            return "usermanage";
        }
        // 如果是管理员登录就返回管理页面
        return "adminmanage";
    }

    @GetMapping("welcome")
    public String toWelcome() {return "welcome";}

    @Log(value = "返回错误页面")
    @GetMapping("error")
    public String toError(){return "error";}
}
