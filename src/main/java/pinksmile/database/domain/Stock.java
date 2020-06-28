package pinksmile.database.domain;

import lombok.Data;

/**
 * 库存表
 * @author PinkSmile
 */
@Data
public class Stock {

    private Integer pid;
    private Integer rid;
    private Integer amount;
}
