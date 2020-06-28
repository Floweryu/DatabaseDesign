package pinksmile.database.config;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import pinksmile.database.domain.User;
import pinksmile.database.service.UserService;

import java.util.Arrays;
import java.util.HashSet;

public class MyShiroRealm extends AuthorizingRealm{
    private static final Logger logger = LoggerFactory.getLogger(MyShiroRealm.class);
    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        logger.info("------------------------------->执行了授权");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        User user = (User)principals.getPrimaryPrincipal();
        String[] perm =user.getPermission().split(",");
//        查看输出的权限
//        for (String s : perm){
//            System.out.println(s);
//        }
        HashSet<String> set = new HashSet<>(Arrays.asList(perm));

        authorizationInfo.setStringPermissions(set);
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        logger.info("------------------------------->执行了认证");
        //获取用户的输入的账号.
        String username = (String) token.getPrincipal();
        //验证用户名是否在数据库中存在
        User user = userService.queryByName(username);
        if (user == null){
            return null;
        }
        return new SimpleAuthenticationInfo(user, user.getPassword(), getName());
    }
}
