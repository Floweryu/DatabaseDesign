package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.Repositorys;
import pinksmile.database.service.RepositoryService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("usermanage")
public class RepositoryController {
    final RepositoryService repositoryService;

    public RepositoryController(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    /**
     * 显示仓库所有信息
     *
     * @param model 存储回显的信息
     * @return 仓库页面
     */
    @Log(value = "查看所有仓库信息")
    @GetMapping("/repositoryList")
    public String getAllRepositorys(Model model,
                                    @RequestParam(value = "pn", defaultValue = "1") int pn,
                                    @RequestParam(value = "size", defaultValue = "8") int size) {
        PageHelper.startPage(pn, size);
        List<Repositorys> repositorysList = repositoryService.getAllRepositorys();
        PageInfo<Repositorys> page = new PageInfo<>(repositorysList);
        model.addAttribute("page", page);
        return "repository/repository-list";
    }

    // 点击返回添加仓库页面
    @GetMapping("/toRepository")
    public String toAddRepository() {
        return "repository/repository-add";
    }

    /**
     * 添加仓库
     *
     * @param repository 要添加仓库信息
     */
    @Log(value = "添加仓库信息")
    @PostMapping("/addRepository")
    @ResponseBody
    public void addRepository(Repositorys repository) {
        repositoryService.addRepository(repository);
    }

    // 点击返回修改仓库页面
    @GetMapping("/editRepository/{id}")
    public String toEditRepository(@PathVariable("id") Integer id, Model model) {
        Repositorys repositorys = repositoryService.getRepositoryById(id);
        model.addAttribute("editRepository", repositorys);
        return "repository/repository-edit";
    }

    /**
     * 修改仓库信息
     *
     * @param repository 要更新的仓库信息
     * @return 仓库列表页面
     */
    @Log(value = "修改仓库信息")
    @PostMapping("/updateRepository")
    public String updateRepository(Repositorys repository) {
        repositoryService.updateRepository(repository);
        return "redirect:/usermanage/repositoryList";
    }

    /**
     * 删除一个仓库
     *
     * @param id 要删除仓库的编号
     * @return 仓库列表
     */
    @Log(value = "删除一个仓库")
    @GetMapping("/deleteOneRepository")
    public String deleteById(Integer id) {
        repositoryService.deleteOneRepository(id);
        return "redirect:/usermanage/repositoryList";
    }

    /**
     * 删除多个仓库
     *
     * @param checkList 要删除的仓库编号字符串
     * @return 仓库列表
     */
    @Log(value = "删除多个仓库")
    @PostMapping("/deleteRepositorys")
    public String deleteManyRepositorys(String checkList) {
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();
        for (String str : strs) {
            ids.add(Integer.parseInt(str));
        }
        repositoryService.deleteManyRepositorys(ids);
        return "redirect:/usermanage/repositoryList";
    }

    /**
     * 根据仓库名获取仓库信息
     *
     * @param repositoryname 仓库名
     * @param model          传递值
     * @return 仓库列表
     */
    @Log(value = "查找仓库信息")
    @GetMapping("/repositorySearch/{repositoryname}")
    public String getRepositoryByName(Model model,
                                      @PathVariable("repositoryname") String repositoryname,
                                      @RequestParam(value = "pn", defaultValue = "1") int pn,
                                      @RequestParam(value = "size", defaultValue = "8") int size) {
        PageHelper.startPage(pn, size);
        List<Repositorys> repositorysList = repositoryService.getRepositoryByName(repositoryname);
        PageInfo<Repositorys> page = new PageInfo<>(repositorysList);
        model.addAttribute("page", page);
        return "repository/repository-list";
    }

    /**
     * 查看仓库是否存在
     *
     * @param repository 要查询的仓库
     * @return 是否存在
     */
    @ResponseBody
    @GetMapping("/checkExit/{repositoryName}")
    public String checkRepositoryExist(@PathVariable("repositoryName") String repository) {
        Repositorys repositorys = repositoryService.getOneRepository(repository);
        if (repositorys == null) {
            return "notexist";
        } else {
            return "exist";
        }
    }
}
