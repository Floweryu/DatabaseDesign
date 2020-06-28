package pinksmile.database.domain;

import lombok.Data;

/**
 * 产品表
 * @author Pink-Smile
 */
@Data
public class Product {
    /**
     * 数据库用户标的字段
     * 保证字段和数据类型一致
     */
    private Integer id;
    private String name;
    private String specification;
    private float price;
    private Integer upper;
    private Integer lower;
}
