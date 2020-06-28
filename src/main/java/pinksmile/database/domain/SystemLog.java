package pinksmile.database.domain;

import lombok.Data;
import java.util.Date;

@Data
public class SystemLog {
    private Integer id;
    private String username;
    private String method;
    private String describes;
    private Date time;
}
