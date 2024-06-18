package com.example.tikla_kesfet.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.tikla_kesfet.Dao.ProductDao;
import com.example.tikla_kesfet.Dao.CategoryDao;
import com.example.tikla_kesfet.Model.Product;
import com.example.tikla_kesfet.Model.Category;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private CategoryDao categoryDao;

    @GetMapping
    public ModelAndView home(HttpServletResponse response) throws IOException {
        List<Product> productList = productDao.getAllProducts();
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("products", productList);
        return modelAndView;
    }

    @GetMapping("products")
    public ModelAndView products() {
        List<Product> productList = productDao.getAllProducts();
        ModelAndView modelAndView = new ModelAndView("products");
        modelAndView.addObject("products", productList);
        return modelAndView;
    }

    @GetMapping("categories")
    public ModelAndView categories() {
        List<Category> categoryList = categoryDao.getAllCategories();
        ModelAndView modelAndView = new ModelAndView("categories");
        modelAndView.addObject("categories", categoryList);
        return modelAndView;
    }

    @GetMapping("about")
    public ModelAndView about() {
        return new ModelAndView("about");
    }
}
