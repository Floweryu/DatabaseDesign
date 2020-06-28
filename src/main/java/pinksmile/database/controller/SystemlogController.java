package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.SystemLog;
import pinksmile.database.service.SystemlogService;

import java.util.List;

@Controller
@RequestMapping("adminmanage")
public class SystemlogController {
    final SystemlogService systemlogService;

    public SystemlogController(SystemlogService systemlogService){this.systemlogService = systemlogService;}

    @Log(value = "查看用户日志")
    @GetMapping("systemlogList")
    public String getAllLogs(Model model,
                             @RequestParam(value = "pn", defaultValue = "1") int pn,
                             @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<SystemLog> systemLogList = systemlogService.getAllSystemlogs();
        PageInfo<SystemLog> page = new PageInfo<>(systemLogList);
        model.addAttribute("page", page);
        return "systemlog/systemlog-list";
    }

    @Log(value = "查询用户日志")
    @GetMapping("/usernameSearchLog/{username}")
    public String searchLogByUsername(Model model,
                                      @PathVariable("username") String username,
                                      @RequestParam(value = "pn", defaultValue = "1") int pn,
                                      @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<SystemLog> systemLogList = systemlogService.getLogByUsername(username);
        PageInfo<SystemLog> page = new PageInfo<>(systemLogList);
        model.addAttribute("page", page);
        return "systemlog/systemlog-list";
    }

    @Log(value = "查询用户日志")
    @GetMapping("/timeSearchLog/{time}")
    public String getLogByTime(Model model,
                                    @PathVariable("time") String time,
                                    @RequestParam(value = "pn", defaultValue = "1") int pn,
                                    @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<SystemLog> systemLogList = systemlogService.getLogByDatetime(time);
        PageInfo<SystemLog> page = new PageInfo<>(systemLogList);
        model.addAttribute("page", page);
        return "systemlog/systemlog-list";
    }
}
