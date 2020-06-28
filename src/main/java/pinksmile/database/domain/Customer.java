package pinksmile.database.domain;

import lombok.Data;

/**
 * 客户表
 * @author Pink-Smile
 */
@Data
public class Customer {
    /**
     * 数据库用户标的字段
     * 保证字段和数据类型一致
     */
    private Integer id;
    private String name;
    private String type;
    private String linkpeople;
    private String phone;
    private String email;
    private String remark;
}
