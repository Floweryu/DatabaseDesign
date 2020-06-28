package pinksmile.database.dao;

import org.springframework.stereotype.Repository;
import pinksmile.database.domain.Customer;

import java.util.List;

@Repository
public interface CustomerDao {
    // 获取所有用户信息
    List<Customer> getAllCustomers();
    // 添加用户
    void addCustomer(Customer customer);
    // 获取客户信息用于回显
    Customer getCustomerById(Integer id);
    // 修改客户信息
    void updateCustomer(Customer customer);
    // 删除一个客户
    void deleteOneCustomer(Integer id);
    // 删除多个客户
    void deleteCustomers(List<Integer> ids);
    // 查询客户
    List<Customer> getCustomerByName(String name);
}
