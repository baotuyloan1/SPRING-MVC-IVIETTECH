/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.controller;

import com.mycompany.jv30_spring_coffee.entities.AccountEntity;
import com.mycompany.jv30_spring_coffee.entities.CustomerInfoEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderDetailEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductEntity;
import com.mycompany.jv30_spring_coffee.enums.Gender;
import com.mycompany.jv30_spring_coffee.service.CustomerInfoService;
import com.mycompany.jv30_spring_coffee.service.OrderService;
import com.mycompany.jv30_spring_coffee.service.ProducerService;
import com.mycompany.jv30_spring_coffee.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@Transactional
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProducerService producerService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private CustomerInfoService customerInfoService;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Model model, @RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "status", required = false) String status, HttpSession session) {
		List<ProductEntity> products1 = productService.getProducts();
		List<ProductEntity> products = productService.getProducts();

		if (products != null && products.size() > 0) {

			for (ProductEntity p : products) {

				p.setPrice(productService.setPriceProduct(p));

			}

		}

		if (products != null && products.size() > 0) {
			model.addAttribute("products", products);
			model.addAttribute("totalPage", productService.getProducts().get(0).getTotalProduct());
			model.addAttribute("products1", products1);
		} else {
			model.addAttribute("products", new ArrayList<>());
			model.addAttribute("totalPage", 0);
		}

		model.addAttribute("message", message);
		model.addAttribute("status", status);
		return "home";	
	}

	@RequestMapping("/view-detail/{productId}")
	public String viewFormUpdate(Model model, @PathVariable("productId") int productId) {

		ProductEntity p = productService.findProductById(productId);
		model.addAttribute("price_old", p.getPrice());
		p.setPrice(productService.setPriceProduct(p));

		List<ProductEntity> products1 = productService.getProducts();
		List<ProductEntity> products = productService.getProducts();

		if (products != null && products.size() > 0) {

			for (ProductEntity p1 : products) {

				p1.setPrice(productService.setPriceProduct(p1));

			}

		}
		model.addAttribute("products", products);

		model.addAttribute("products1", products1);

		model.addAttribute("product", p);

		return "viewdetail";
	}

	@RequestMapping("/category")
	public String searchProductPage(Model model, HttpSession session) {
		model.addAttribute("producers", producerService.getProducers());
		List<ProductEntity> products1 = productService.getProducts();
		List<ProductEntity> products = productService.getProducts();

		if (products != null && products.size() > 0) {

			for (ProductEntity p : products) {

				p.setPrice(productService.setPriceProduct(p));

			}

		}
		model.addAttribute("products", products);
		model.addAttribute("products1", products1);

		model.addAttribute("totalPage", productService.getProducts().get(0).getTotalProduct());

		List<ProductEntity> list = productService.getProducts();
		int dem = 0;
		for (ProductEntity i : list) {
			dem++;
		}
		model.addAttribute("product_found", dem);
		model.addAttribute("link", "category");

		return "category";

	}

	@RequestMapping("/category/{page}")
	public String searchProductPage(Model model, @PathVariable("page") int page, HttpSession session) {


		List<ProductEntity> products1 = productService.getProducts();

		model.addAttribute("producers", producerService.getProducers());

		List<ProductEntity> products = productService.getProducts(page);

		if (products != null && products.size() > 0) {

			for (ProductEntity p : products) {

				p.setPrice(productService.setPriceProduct(p));

			}

		}

		model.addAttribute("products1", products1);
		model.addAttribute("totalPage", productService.getProducts().get(0).getTotalProduct());
		model.addAttribute("products", products);
		List<ProductEntity> list = productService.getProducts();
		int dem = 0;
		for (ProductEntity i : list) {
			dem++;
		}
		model.addAttribute("product_found", dem);
		model.addAttribute("link", "category");

		return "category";

	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchProductByCategory(Model model, @ModelAttribute("searchTxt") String searchTxt) {

		List<ProductEntity> products1 = productService.getProducts();

		List<ProductEntity> products = productService.searchProduct(searchTxt);

		model.addAttribute("producers", producerService.getProducers());

		if (products != null && products.size() > 0) {

			for (ProductEntity p : products) {

				p.setPrice(productService.setPriceProduct(p));

			}

		}

		model.addAttribute("products1", products1);
		model.addAttribute("totalPage", productService.getProducts().get(0).getTotalProduct());
		model.addAttribute("products", products);

		model.addAttribute("producers", producerService.getProducers());

		List<ProductEntity> list = productService.searchProduct(searchTxt);
		int dem = 0;
		for (ProductEntity i : list) {
			dem++;
		}
		model.addAttribute("product_found", dem);

		return "category";
	}

	@RequestMapping(value = "/findProductByProducer/{producerId}")
	public String searchProductByProducer(Model model, @PathVariable("producerId") int id) {
		List<ProductEntity> products1 = productService.getProducts();

		List<ProductEntity> products = productService.findProductByProducerId(id);

		if (products != null && products.size() > 0) {

			for (ProductEntity p : products) {

				p.setPrice(productService.setPriceProduct(p));

			}

		}

		model.addAttribute("producers", producerService.getProducers());

		model.addAttribute("products", products);
		model.addAttribute("products1", products1);
		List<ProductEntity> list = productService.findProductByProducerId(id);
		model.addAttribute("link", "findProductByProducer");
		int dem = 0;

		for (ProductEntity i : list) {
			dem++;

		}
		model.addAttribute("product_found", dem);
		return "category";
	}

	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public String sortProductCategory(Model model, @Valid @ModelAttribute("sort") int sort) {
		if (sort == 1) {
			return "home";
		}
		return "category";
	}

	@RequestMapping("/continue")
	public String continueOrder(Model m, HttpSession session) {

//		m.addAttribute("producers", producerService.getProducers());
//		m.addAttribute("products", productService.getProducts());

		return "redirect:/category";
	}

	@RequestMapping(value = "/sortProductByPrice/{}")
	public String sortProduct(Model model) {

		model.addAttribute("producers", producerService.getProducers());

		model.addAttribute("products", productService.sortProductByPrice());

		int dem = 0;

		for (ProductEntity i : productService.sortProductByPrice()) {
			dem++;

		}
		model.addAttribute("product_found", dem);
		return "category";
	}


	@RequestMapping(value = "/update_order")
	public String updateOrder(Model m, HttpSession session, @RequestParam("quantity") Integer[] numq) {
		OrderEntity order = (OrderEntity) session.getAttribute("order");
		if (order != null) {
			List<OrderDetailEntity> orderDetails = order.getOrderDetails();
			float totalPrice = 0;

			if (orderDetails != null && orderDetails.size() > 0) {
				for (int i = 0; i < numq.length; i++) {
					orderDetails.get(i).setQuantity(numq[i]);
					totalPrice += numq[i] * (orderDetails.get(i).getPrice());

				}
				order.setOrderDetails(orderDetails);

				session.removeAttribute("order");
				order.setTotalPrice(totalPrice);

				session.setAttribute("order", order);
			}
		}
		return "order";
	}

	@RequestMapping(value = "/delete_dt/{productId}")
	public String deleteProduct(Model model, @PathVariable("productId") int productId, HttpSession session) {
		OrderEntity order = (OrderEntity) session.getAttribute("order");
		ProductEntity product = productService.findProductById(productId);
		if (order != null) {
			float totalPrice = order.getTotalPrice();
		
			for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
				if (orderDetail.getProduct().getId() == productId) {
					order.getOrderDetails().remove(orderDetail);
					order.setTotalPrice(totalPrice - (product.getPrice() * orderDetail.getQuantity()));
					break;
				}
			}
			session.setAttribute("order", order);
			model.addAttribute("order", order);
		}

		return "order";
	}

	@RequestMapping(value = "/check_out")
	public String checkOut(Model m, HttpSession session, Authentication authentication) {
		OrderEntity order = (OrderEntity) session.getAttribute("order");

		m.addAttribute("genders", Gender.values());
		m.addAttribute("customerInfo", new CustomerInfoEntity());

		return "checkout";
	}




	@RequestMapping(value = "/shopping_cart")
	public String shoppingCart(Model m) {
		return "order";
	}

	

	@RequestMapping("/viewinfo")
	public String viewInfo(Model model, Authentication authentication) {
		AccountEntity acc = (AccountEntity) authentication.getPrincipal();

		List<CustomerInfoEntity> customerInfos = customerInfoService.findCusByAcc(acc);

		List<OrderEntity> orders = new ArrayList<>();

		for (CustomerInfoEntity c : customerInfos) {

			orders.add(orderService.findOrderByCusInfo(c));

		}
		model.addAttribute("orders", orders);

		if (acc != null && acc instanceof AccountEntity) {
			model.addAttribute("acc", acc);
		}

		return "viewinfo";
	}

	@RequestMapping("/viewOrderDetail/{orderId}")
	public String viewOrderDetail(Model m, @PathVariable("orderId") int orderId) {

		OrderEntity order = orderService.findOrderById(orderId);

		m.addAttribute("orderDetails", order.getOrderDetails());
		return "viewOrderDetail";

	}

}
