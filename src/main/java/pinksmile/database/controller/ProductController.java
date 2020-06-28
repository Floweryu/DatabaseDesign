package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.Product;
import pinksmile.database.service.ProductService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("usermanage")
public class ProductController {
    final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    /**
     * 获取所有产品信息并显示到页面
     * @param model 存储信息
     * @return  前端显示页面
     */
    @Log(value = "查看产品信息")
    @GetMapping("/productList")
    public String getAllProducts(Model model,
                                 @RequestParam(value = "pn", defaultValue = "1") int pn,
                                 @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Product> productList = productService.getAllProducts();
        PageInfo<Product> page =new PageInfo<>(productList);
        model.addAttribute("page", page);
        return "product/product-list";
    }

    // 返回添加产品页面
    @GetMapping("/toProduct")
    public String toAddProduct(){
        return "product/product-add";
    }

    /**
     * 添加产品
     * @param product   要添加的产品
     */
    @Log(value = "添加产品信息")
    @PostMapping("/addProduct")
    @ResponseBody
    public void addProduct(Product product){
        productService.addProduct(product);
    }

    /**
     * 修改产品信息
     * @param id    产品编号
     * @param model 产品信息
     * @return  编辑产品页面
     */
    @GetMapping("/editProduct/{id}")
    public String toEditProduct(@PathVariable("id") Integer id, Model model){
        Product product = productService.getProductById(id);
        model.addAttribute("editProduct", product);
        return "product/product-edit";
    }

    /**
     * 提交修改产品信息
     * @param product   要修改的信息
     * @return  产品列表
     */
    @Log(value = "修改产品信息")
    @PostMapping("/updateProduct")
    public String updateProduct(Product product){
        productService.updateProduct(product);
        return "redirect:/usermanage/productList";
    }

    /**
     * 删除一个产品
     * @param id    要删除产品id
     * @return  产品列表
     */
    @Log(value = "删除一个产品信息")
    @GetMapping("/deleteOneProduct")
    public String deleteOneProduct(Integer id){
        productService.deleteOneProduct(id);
        return "redirect:/usermanage/productList";
    }

    /**
     * 删除多个产品
     * @param checkList 要删除产品的id字符串
     * @return 产品列表
     */
    @Log(value = "删除多个产品信息")
    @PostMapping("/deleteProducts")
    public String deleteManyProducts(String checkList){
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();
        for (String str : strs){
            ids.add(Integer.parseInt(str));
        }
        productService.deleteManyProducts(ids);
        return "redirect:/usermanage/productList";
    }

    /**
     * 根据产品名查找产品
     * @param productname   产品名
     * @param model 查找到的信息
     * @return  产品列表
     */
    @Log(value = "查找产品信息")
    @GetMapping("/productSearch/{productname}")
    public String getProductByName(Model model,
                                   @PathVariable("productname") String productname,
                                   @RequestParam(value = "pn", defaultValue = "1") int pn,
                                   @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Product> productList = productService.getProductByName(productname);
        PageInfo<Product> page =new PageInfo<>(productList);
        model.addAttribute("page", page);
        return "product/product-list";
    }
}
