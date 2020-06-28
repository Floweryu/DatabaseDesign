package pinksmile.database.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pinksmile.database.dao.ProductDao;
import pinksmile.database.domain.Product;

import java.util.List;

@Service
public class ProductService {
    private final ProductDao productDao;
    public ProductService(ProductDao productDao) { this.productDao = productDao; }

    // 获取所有产品信息
    public List<Product> getAllProducts(){return productDao.getAllProducts(); }
    // 添加产品
    public void addProduct(Product product){productDao.addProduct(product);}
    // 获取产品信息
    public Product getProductById(Integer id){return productDao.getProductById(id);}
    // 修改产品信息
    public void updateProduct(Product product){productDao.updateProduct(product);}
    // 删除一个产品
    public void deleteOneProduct(Integer id){productDao.deleteOneProduct(id);}
    // 删除多个产品
    public void deleteManyProducts(List<Integer> ids) {productDao.deleteManyProducts(ids);}
    // 通过产品名查找产品
    public List<Product> getProductByName(String name){return productDao.getProductByName(name);}

    public Integer getUpperById(Integer pid){return productDao.getUpperById(pid);}

    public Integer getLowerById(Integer pid){return productDao.getLowerById(pid);}
}
