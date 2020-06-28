package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.SystemLog;

import java.util.List;

@Repository
public interface SystemlogDao {
    void addSystemlog(SystemLog systemLog);
    List<SystemLog> getAllSystemlogs();
    List<SystemLog> getLogByUsername(String username);
    List<SystemLog> getLogByDatetime(String time);
}
