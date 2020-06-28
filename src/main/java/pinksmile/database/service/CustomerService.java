package pinksmile.database.service;

import org.springframework.stereotype.Service;
import pinksmile.database.dao.CustomerDao;
import pinksmile.database.domain.Customer;

import java.util.List;

@Service
public class CustomerService {
    private final CustomerDao customerDao;

    public CustomerService(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    // 获取所有客户信息
    public List<Customer> getAllCustomers(){return customerDao.getAllCustomers();}
    // 添加客户
    public void addCustomer(Customer customer) {customerDao.addCustomer(customer);}
    // 获取客户信息回显
    public Customer getCustomerById(Integer id){return customerDao.getCustomerById(id);}
    // 修改客户信息
    public void updateCustomer(Customer customer){customerDao.updateCustomer(customer);}
    // 删除一个客户
    public void deleteOneCustomer(Integer id){customerDao.deleteOneCustomer(id);}
    // 删除多个客户
    public void deleteCustomers(List<Integer> ids){customerDao.deleteCustomers(ids);}
    // 查询客户
    public List<Customer> getCustomerByName(String name){return customerDao.getCustomerByName(name);}

}
