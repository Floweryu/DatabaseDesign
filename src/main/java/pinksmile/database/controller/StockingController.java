package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.Stocking;
import pinksmile.database.service.ProductService;
import pinksmile.database.service.StockService;
import pinksmile.database.service.StockingService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("usermanage")
public class StockingController {
    final StockingService stockingService;
    final ProductService productService;
    final StockService stockService;

    public StockingController(StockingService stockingService, ProductService productService, StockService stockService) {
        this.stockingService = stockingService;
        this.productService = productService;
        this.stockService = stockService;
    }

    /**
     * 返回所有记录
     * @param model 返回信息到前端
     * @param pn    页码
     * @param size  每页显示个数
     */
    @Log(value = "查看所有入库记录")
    @GetMapping("/instockList")
    public String getAllStockings(Model model,
                                  @RequestParam(value = "pn", defaultValue = "1") int pn,
                                  @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stocking> stockingsList = stockingService.getAllStockings();
        PageInfo<Stocking> page = new PageInfo<>(stockingsList);
        model.addAttribute("page", page);
        return "instock/instock-list";
    }

    /**
     * 返回编辑页面
     * @param model 用于回显的信息
     */
    @GetMapping("/editInstock/{id}")
    public String toEditInstock(@PathVariable("id") Integer id, Model model){
        Stocking stocking = stockingService.getStockingById(id);
        model.addAttribute("editInstock", stocking);
        return "instock/instock-edit";
    }

    /**
     * 修改入库记录
     * @param stocking 修改信息
     */
    @Log(value = "修改入库记录")
    @PostMapping("/updateInstock")
    public String updateInstock(Stocking stocking){
        stockingService.updateStocking(stocking);
        return "redirect:/usermanage/instockList";
    }

    /**
     * 返回添加入库记录页面
     */
    @GetMapping("/toStocking")
    public String toAddStocking() {return "instock/instock-add";}

    /**
     * 添加入库记录
     */
    @Log(value = "添加入库记录")
    @PostMapping("/addStocking")
    @ResponseBody
    public void addStocking(Stocking stocking){stockingService.addStocking(stocking);}

    /**
     * 根据仓库编号查找入库记录
     */
    @Log(value = "查找入库记录")
    @GetMapping("/resIdSearchStocking/{rid}")
    public String getStockingByRid(Model model,
                                   @PathVariable("rid") Integer rid,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stocking> stockingList = stockingService.getStockingByRid(rid);
        PageInfo<Stocking> page = new PageInfo<>(stockingList);
        model.addAttribute("page", page);
        return "instock/instock-list";
    }
    /**
     * 根据产品编号查找入库记录
     */
    @Log(value = "查找入库记录")
    @GetMapping("/proIdSearchStocking/{pid}")
    public String getStockingByPid(Model model,
                                   @PathVariable("pid") Integer pid,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stocking> stockingList = stockingService.getStockingByPid(pid);
        PageInfo<Stocking> page = new PageInfo<>(stockingList);
        model.addAttribute("page", page);
        return "instock/instock-list";
    }

    /**
     * 根据入库时间查找记录
     */
    @Log(value = "查找入库记录")
    @GetMapping("/timeSearchStocking/{time}")
    public String getStockingByTime(Model model,
                                    @PathVariable("time") Date time,
                                    @RequestParam(value = "pn", defaultValue = "1") int pn,
                                    @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stocking> stockingList = stockingService.getStockingByTime(time);
        PageInfo<Stocking> page = new PageInfo<>(stockingList);
        model.addAttribute("page", page);
        return "instock/instock-list";
    }

    /**
     * 删除多个记录
     */
    @Log(value = "删除多个入库记录")
    @PostMapping("/deleteStockings")
    public String deleteManyStockings(String checkList){
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();
        for (String str : strs){
            ids.add(Integer.parseInt(str));
        }
        stockingService.deleteManyStockings(ids);
        return "redirect:/usermanage/instockList";
    }

    /**
     * 删除一个记录
     */
    @Log(value = "删除一个入库记录")
    @GetMapping("/deleteOneStocking")
    public String deleteOneStocking(Integer id){
        stockingService.deleteOneStocking(id);
        return "redirect:/usermanage/instockList";
    }

    /**
     * 检查入库数量是否符合要求
     */
    @Log(value = "检查入库数量是否符合要求")
    @GetMapping("/checkIsOver/{pid}/{amount}")
    @ResponseBody
    public String checkIsOver(@PathVariable("pid") Integer pid, @PathVariable("amount")  Integer amount){
        Integer upperAmount = productService.getUpperById(pid);
        Integer nowAmount = stockService.getAmountByPid(pid);
        if (nowAmount + amount > upperAmount){
            return "over";
        }else {
            return "notover";
        }
    }
}