package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.Repositorys;
import pinksmile.database.domain.Stock;
import pinksmile.database.domain.Stocking;
import pinksmile.database.service.ProductService;
import pinksmile.database.service.StockService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("usermanage")
public class StockController {
    final StockService stockService;
    final ProductService productService;

    public StockController(StockService stockService, ProductService productService) {
        this.stockService = stockService;
        this.productService = productService;
    }

    /**
     * 获取所有库存视图
     * @param model 返回数据
     * @param pn    页数
     * @param size  每页最大数
     */
    @Log(value = "查看所有库存")
    @GetMapping("/stockList")
    public String getStockView(Model model,
                               @RequestParam(value = "pn", defaultValue = "1") int pn,
                               @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<HashMap> stockList = stockService.getStockView();
        PageInfo<HashMap> page = new PageInfo<>(stockList);
        model.addAttribute("page", page);
        return "stock/stockview-list";
    }

    /**
     * 根据仓库名查找库存
     * @param model 返回数据
     * @param pn    页数
     * @param size  每页最大数
     */
    @Log(value = "查找库存")
    @GetMapping("/resnameSearch/{repositoryname}")
    public String getStockByRepositoryName(Model model,
                                      @PathVariable("repositoryname") String repositoryname,
                                      @RequestParam(value = "pn", defaultValue = "1") int pn,
                                      @RequestParam(value = "size", defaultValue = "8") int size) {
        PageHelper.startPage(pn, size);
        List<HashMap> stockList = stockService.getStockByRepositoryName(repositoryname);
        PageInfo<HashMap> page = new PageInfo<>(stockList);
        model.addAttribute("page", page);
        return "stock/stockview-list";
    }
    /**
     * 根据产品名查找库存
     * @param model 返回数据
     * @param pn    页数
     * @param size  每页最大数
     */
    @Log(value = "查找库存")
    @GetMapping("/pronameSearch/{productname}")
    public String getStockByproductName(Model model,
                                      @PathVariable("productname") String productname,
                                      @RequestParam(value = "pn", defaultValue = "1") int pn,
                                      @RequestParam(value = "size", defaultValue = "8") int size) {
        PageHelper.startPage(pn, size);
        List<HashMap> stockList = stockService.getStockByProductName(productname);
        PageInfo<HashMap> page = new PageInfo<>(stockList);
        model.addAttribute("page", page);
        return "stock/stockview-list";
    }

    @Log(value = "查看库存信息")
    @GetMapping("/stocksList")
    public String getAllStockings(Model model,
                                  @RequestParam(value = "pn", defaultValue = "1") int pn,
                                  @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stock> stocksList = stockService.getAllStocks();
        PageInfo<Stock> page = new PageInfo<>(stocksList);
        model.addAttribute("page", page);
        return "stock/stock-list";
    }

    @GetMapping("/editStocks/{pid}")
    public String toEditStocks(@PathVariable("pid") Integer pid, Model model){
        Stock stocks = stockService.getOneStocksByPid(pid);
        model.addAttribute("editStocks", stocks);
        return "stock/stock-edit";
    }

    @Log(value = "修改库存信息")
    @PostMapping("/updateStocks")
    public String updateStocks(Stock stock){
        stockService.updateStocks(stock);
        return "redirect:/usermanage/stocksList";
    }

    @GetMapping("toStocks")
    public String toAddStocks() {return "stock/stock-add";}

    @Log(value = "添加库存信息")
    @PostMapping("/addStocks")
    @ResponseBody
    public void addStocks(Stock stock){stockService.addStocks(stock);}


    @Log(value = "查找库存信息")
    @GetMapping("/resIdSearchStocks/{rid}")
    public String getStocksByRid(Model model,
                                   @PathVariable("rid") Integer rid,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stock> stocksList = stockService.getStocksByRid(rid);
        PageInfo<Stock> page = new PageInfo<>(stocksList);
        model.addAttribute("page", page);
        return "stock/stock-list";
    }

    @Log(value = "查找库存信息")
    @GetMapping("/proIdSearchStocks/{pid}")
    public String getStocksByPid(Model model,
                                   @PathVariable("pid") Integer pid,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Stock> stocksList = stockService.getStocksByPid(pid);
        PageInfo<Stock> page = new PageInfo<>(stocksList);
        model.addAttribute("page", page);
        return "stock/stock-list";
    }

    @Log(value = "删除多个库存信息")
    @PostMapping("/deleteStocks")
    public String deleteManyStocks(String checkList){
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();
        for (String str : strs){
            ids.add(Integer.parseInt(str));
        }
        stockService.deleteManyStocks(ids);
        return "redirect:/usermanage/stocksList";
    }

    /**
     * 删除一个库存
     */
    @Log(value = "删除一个库存信息")
    @GetMapping("/deleteOneStocks")
    public String deleteOneStocking(Integer pid){
        stockService.deleteOneStocks(pid);
        return "redirect:/usermanage/stocksList";
    }

    @GetMapping("/checkIsMiddle/{pid}/{amount}")
    @ResponseBody
    public String checkIsMiddle(@PathVariable("pid") Integer pid, @PathVariable("amount") Integer amount){
        Integer lower = productService.getLowerById(pid);
        Integer upper = productService.getUpperById(pid);
        if (amount >= lower && amount <= upper){
            return "middle";
        }else if(amount < lower){
            return "lesslower";
        }else {
            return "overupper";
        }
    }
}
