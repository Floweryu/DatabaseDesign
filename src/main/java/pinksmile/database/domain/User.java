package pinksmile.database.domain;

import lombok.Data;

/**
 * 登录的用户表
 * @author PinkSmile
 */
@Data
public class User {
    /**
     * 数据库用户标的字段
     * 保证字段和数据类型一致
     */
    private Integer id;
    private String nickname;
    private String username;
    private String password;
    private String permission;
    private String role;
}
