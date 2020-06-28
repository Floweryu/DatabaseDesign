package pinksmile.database.domain;

import lombok.Data;

/**
 * 仓库表
 * @author Pink-Smile
 */
@Data
public class Repositorys {
    /**
     * 数据库用户标的字段
     * 保证字段和数据类型一致
     */
    private Integer id;
    private String name;
    private String details;
}
