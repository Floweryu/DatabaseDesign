package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.Outstock;
import pinksmile.database.service.OutstockService;
import pinksmile.database.service.ProductService;
import pinksmile.database.service.StockService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("usermanage")
public class OutstockController {
    final OutstockService outstockService;
    final ProductService productService;
    final StockService stockService;

    public OutstockController(OutstockService outstockService, ProductService productService, StockService stockService) {
        this.outstockService = outstockService;
        this.productService = productService;
        this.stockService = stockService;
    }

    /**
     * 获取出库所有记录
     */
    @Log(value = "查看出库记录")
    @GetMapping("/outstockList")
    public String getAllOutstocks(Model model,
                                  @RequestParam(value = "pn", defaultValue = "1") int pn,
                                  @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Outstock> outstockList = outstockService.getAllOutstocks();
        PageInfo<Outstock> page = new PageInfo<>(outstockList);
        model.addAttribute("page", page);
        return "outstock/outstock-list";
    }

    /**
     * 返回编辑页面数据回显
     */
    @GetMapping("/editOutstock/{id}")
    public String toEditOutstock(@PathVariable("id") Integer id, Model model){
        Outstock outstock = outstockService.getOutstockById(id);
        model.addAttribute("editOutstock", outstock);
        return "outstock/outstock-edit";
    }

    /**
     * 提交修改信息
     */
    @Log(value = "修改出库记录")
    @PostMapping("/updateOutstock")
    public String updateOutstock(Outstock outstock){
        outstockService.updateOutstock(outstock);
        return "redirect:/usermanage/outstockList";
    }

    /**
     * 返回添加出库记录页面
     */
    @GetMapping("/toOutstock")
    public String toAddOutstock() {return "outstock/outstock-add";}

    /**
     * 添加出库记录
     */
    @Log(value = "添加出库记录")
    @PostMapping("/addOutstock")
    @ResponseBody
    public void addOutstock(Outstock outstock){outstockService.addOutstock(outstock);}

    /**
     * 根据仓库编号查找出库记录
     */
    @Log(value = "查找出库记录")
    @GetMapping("/resIdSearchOutStock/{rid}")
    public String getOutstockByRid(Model model,
                                   @PathVariable("rid") Integer rid,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Outstock> outstockList = outstockService.getOutstockByRid(rid);
        PageInfo<Outstock> page = new PageInfo<>(outstockList);
        model.addAttribute("page", page);
        return "outstock/outstock-list";
    }
    /**
     * 根据产品编号查找出库记录
     */
    @Log(value = "查找出库记录")
    @GetMapping("/proIdSearchOutStock/{pid}")
    public String getOutstockByPid(Model model,
                                   @PathVariable("pid") Integer pid,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Outstock> outstockList = outstockService.getOutstockByPid(pid);
        PageInfo<Outstock> page = new PageInfo<>(outstockList);
        model.addAttribute("page", page);
        return "outstock/outstock-list";
    }

    /**
     * 根据出库时间查找记录
     */
    @Log(value = "查找出库记录")
    @GetMapping("/timeSearchOutstock/{time}")
    public String getOutstockByTime(Model model,
                                    @PathVariable("time") Date time,
                                    @RequestParam(value = "pn", defaultValue = "1") int pn,
                                    @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Outstock> outstockList = outstockService.getOutstockByTime(time);
        PageInfo<Outstock> page = new PageInfo<>(outstockList);
        model.addAttribute("page", page);
        return "outstock/outstock-list";
    }

    /**
     * 删除多个记录
     */
    @Log(value = "删除多个出库记录")
    @PostMapping("/deleteOutstocks")
    public String deleteManyOutstocks(String checkList){
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();
        for (String str : strs){
            ids.add(Integer.parseInt(str));
        }
        outstockService.deleteManyOutstocks(ids);
        return "redirect:/usermanage/outstockList";
    }

    /**
     * 删除一个记录
     */
    @Log(value = "删除一个出库记录")
    @GetMapping("/deleteOneOutstock")
    public String deleteOneOutstock(Integer id){
        outstockService.deleteOneOutstock(id);
        return "redirect:/usermanage/outstockList";
    }

    /**
     * 检查入库数量是否符合要求
     */
    @GetMapping("/checkIsLower/{pid}/{amount}")
    @ResponseBody
    public String checkIsLower(@PathVariable("pid") Integer pid, @PathVariable("amount")  Integer amount){
        Integer lowerAmount = productService.getLowerById(pid);
        Integer nowAmount = stockService.getAmountByPid(pid);
        if (nowAmount - amount < lowerAmount){
            return "lower";
        }else {
            return "notlower";
        }
    }
}
