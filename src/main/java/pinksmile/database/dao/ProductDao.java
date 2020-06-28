package pinksmile.database.dao;


import org.springframework.stereotype.Repository;
import pinksmile.database.domain.Product;

import java.util.List;

@Repository
public interface ProductDao {
    // 获取所有产品信息
    List<Product> getAllProducts();
    // 添加产品
    void addProduct(Product repository);
    // 通过产品编号获取产品信息
    Product getProductById(Integer id);
    // 修改产品信息
    void updateProduct(Product product);
    // 删除一个产品
    void deleteOneProduct(Integer id);
    // 删除多个产品
    void deleteManyProducts(List<Integer> ids);
    // 通过产品名查找产品
    List<Product> getProductByName(String name);

    Integer getUpperById(Integer pid);

    Integer getLowerById(Integer pid);
}
