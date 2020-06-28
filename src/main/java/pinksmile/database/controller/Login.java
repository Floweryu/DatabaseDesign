package pinksmile.database.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pinksmile.database.domain.User;
import pinksmile.database.service.UserService;

@Controller
public class Login {
    final UserService userService;

    public Login(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用于返回登录页面
     * @return 返回登录页面模板
     */
    @GetMapping("/login")  // 登录页面网址
    public String login() { return "login"; }

    /**
     * 用于验证账号和密码是否正确
     * @param model ..
     * @return 登录成功跳转管理界面，失败返回错误信息到登录页面
     */
    @PostMapping("/login")        // 失败错误信息页面网址
    public String verification(String username, String password, String captcha, Model model) {
        //校验验证码
        //session中的验证码
        String sessionCaptcha = (String) SecurityUtils.getSubject().getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if (null == captcha || !captcha.equalsIgnoreCase(sessionCaptcha)) {
            model.addAttribute("msg","验证码错误！");
            return "login";
        }

        // shiro框架将用户名和密码封装为对象
       UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            //login认证通过后，便可拿到shiro保存的用户对象
            User user1 = (User) subject.getPrincipal();
            subject.getSession().setAttribute("user", user1);   // 保存用户信息
            return "redirect:/manage";

        } catch(Exception e) {

            if (e instanceof UnknownAccountException) {
                model.addAttribute("msg", "用户名错误！");
            }

            if (e instanceof IncorrectCredentialsException) {
                model.addAttribute("msg", "密码错误！");
            }

            //返回登录页面
            return "login";
        }
    }
}
