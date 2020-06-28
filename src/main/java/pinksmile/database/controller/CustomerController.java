package pinksmile.database.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pinksmile.database.annotation.Log;
import pinksmile.database.domain.Customer;
import pinksmile.database.service.CustomerService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("usermanage")
public class CustomerController {
    final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    /**
     * 获取所有客户的信息，返回到前端页面
     *
     * @param model 用于存储返回的用户信息
     * @return 要显示的页面
     */
    @Log(value = "查看客户信息")
    @GetMapping("/customerList")
    public String getAllCustomers(Model model,
                                  @RequestParam(value = "pn", defaultValue = "1") int pn,
                                  @RequestParam(value = "size", defaultValue = "8") int size) {
        PageHelper.startPage(pn, size);
        List<Customer> customerList = customerService.getAllCustomers();
        PageInfo<Customer> page =new PageInfo<>(customerList);
        model.addAttribute("page", page);
        return "customer/customer-list";
    }

    // 点击返回添加客户页面
    @GetMapping("/toCustomer")
    public String toAddCustomer(){return "customer/customer-add";}

    /**
     * 添加客户
     * @param customer  要添加的客户
     */
    @Log(value = "添加客户信息")
    @PostMapping("/addCustomer")
    @ResponseBody
    public void addCustomer(Customer customer){customerService.addCustomer(customer);}

    // 点击返回修改客户页面
    @GetMapping("/editCustomer/{id}")
    public String toEditCustomer(@PathVariable("id") Integer id, Model model){
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("editCustomer", customer);
        return "customer/customer-edit";
    }

    /**
     * 修改客户信息
     * @param customer  修改后的信息
     * @return 客户列表
     */
    @Log(value = "修改客户信息")
    @PostMapping("/updateCustomer")
    public String updateCustomer(Customer customer){
        customerService.updateCustomer(customer);
        return "redirect:/usermanage/customerList";
    }

    /**
     * 删除一个客户
     * @param id    要删除客户的id
     * @return 客户列表
     */
    @Log(value = "删除一个客户信息")
    @GetMapping("/deleteOneCustomer")
    public String deleteById(Integer id){
        customerService.deleteOneCustomer(id);
        return "redirect:/usermanage/customerList";
    }

    /**
     * 删除多个客户
     * @param checkList 要删除客户的id
     * @return  客户列表
     */
    @Log(value = "删除多个客户信息")
    @PostMapping("/deleteCustomers")
    public String deleteManyCustomers(String checkList){
        String[] strs = checkList.split(",");
        List<Integer> ids = new ArrayList<>();
        for (String str: strs){
            ids.add(Integer.parseInt(str));
        }
        customerService.deleteCustomers(ids);
        return "redirect:/usermanage/customerList";
    }

    /**
     * 查询客户
     * @param name  客户名称
     * @param model 查询到的客户信息
     * @return 客户列表
     */
    @Log(value = "查找客户信息")
    @GetMapping("/customerSearch/{customername}")
    public String customerSearch(Model model,
                                 @PathVariable("customername") String name,
                                 @RequestParam(value = "pn", defaultValue = "1") int pn,
                                 @RequestParam(value = "size", defaultValue = "8") int size){
        PageHelper.startPage(pn, size);
        List<Customer> customerList = customerService.getCustomerByName(name);
        PageInfo<Customer> page =new PageInfo<>(customerList);
        model.addAttribute("page", page);
        return "customer/customer-list";
    }
}
