package pinksmile.database.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 出库数据表
 * @author PinkSmile
 */
@Data
public class Outstock {
    private Integer id;
    private Integer pid;
    private Integer rid;
    private Integer amount;
    private String name;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
    private Date datetime;
}
