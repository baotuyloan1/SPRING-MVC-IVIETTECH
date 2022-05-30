package com.mycompany.jv30_spring_coffee.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.jv30_spring_coffee.entities.CustomerInfoEntity;
import com.mycompany.jv30_spring_coffee.entities.ImageEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderDetailEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductEntity;
import com.mycompany.jv30_spring_coffee.enums.Gender;
import com.mycompany.jv30_spring_coffee.service.CustomerInfoService;
import com.mycompany.jv30_spring_coffee.service.EmailService;
import com.mycompany.jv30_spring_coffee.service.ImageService;
import com.mycompany.jv30_spring_coffee.service.OrderDetailService;
import com.mycompany.jv30_spring_coffee.service.OrderService;
import com.mycompany.jv30_spring_coffee.service.ProductService;

/**
 *
 * @author Admin
 */
@Controller
public class OrderController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;
	
	@Autowired
	private OrderService orderService ;
	
	@Autowired
	private CustomerInfoService customerInfoService ;
	
	@Autowired
	private 	EmailService emailService ;
	
	@Autowired
	private OrderDetailService orderDetailService ;

	@RequestMapping(value = "/order_product", method = RequestMethod.GET)
	public String orderProduct(Model m, @RequestParam("productId") Integer productId, HttpSession session) {

		ProductEntity pe = productService.findProductById(productId);
		pe.setPrice(productService.setPriceProduct(pe));

		if (pe != null) {
			float totalPrice = 0;
			OrderEntity order = (OrderEntity) session.getAttribute("order");
			if (order != null) {
				List<OrderDetailEntity> orderDetails = order.getOrderDetails();

				int flagNotEqual = 1;
				for (int i = 0; i < orderDetails.size(); i++) {

					if (orderDetails.get(i).getProduct().getId() == productId) {
						int temp = orderDetails.get(i).getQuantity();
						orderDetails.get(i).setQuantity(temp + 1);

						flagNotEqual = 0;
					}

					totalPrice += (orderDetails.get(i).getQuantity()) * (orderDetails.get(i).getPrice());

				}
				if (flagNotEqual == 1) {
					OrderDetailEntity addOrderDetail = new OrderDetailEntity();
					addOrderDetail.setName(pe.getName());
					addOrderDetail.setPrice(Math.ceil((double) (pe.getPrice() * 1000) / 1000));
					addOrderDetail.setQuantity(1);
					addOrderDetail.setOrder(order);
					addOrderDetail.setProduct(pe);

					orderDetails.add(addOrderDetail);
					totalPrice += pe.getPrice();

					order.setTotalPrice(Math.ceil((double) (totalPrice * 1000) / 1000));
					order.setOrderDetails(orderDetails);

				}

				session.removeAttribute("order");
				session.setAttribute("order", order);
			} else {
				order = new OrderEntity();
				order.setDate(new Date());
				order.setStatus("Waiting");

				List<OrderDetailEntity> orderDetails = new ArrayList<>();
				OrderDetailEntity detail = new OrderDetailEntity();
				List<ImageEntity> list = imageService.findImageByProductId(pe);
				pe.setImages(list);

				detail.setName(pe.getName());
				detail.setOrder(order);
				detail.setPrice(Math.ceil((double) (pe.getPrice() * 1000) / 1000));
				detail.setProduct(pe);
				detail.setQuantity(1);
				detail.setOrder(order);

				orderDetails.add(detail);

				order.setOrderDetails(orderDetails);
				order.setTotalPrice(pe.getPrice());

				session.setAttribute("order", order);

			}
		}
		return "order";
	}
	
	
	@RequestMapping(value = "/submit_order", method = RequestMethod.POST)
	public String doneOrder(Model m, HttpSession session,
			@Valid @ModelAttribute("customerInfo") CustomerInfoEntity customerInfo, BindingResult result)
			throws MessagingException {
		

		OrderEntity order = (OrderEntity) session.getAttribute("order");
		if (result.hasErrors()) {
			m.addAttribute("customerInfo", customerInfo);
			m.addAttribute("genders", Gender.values());
			return "checkout";

		}

		customerInfoService.saveCustomerInfo(customerInfo);

		orderService.saveOrder(order, customerInfo);
		List<OrderDetailEntity> orderDetails = order.getOrderDetails();

	

		try {
			orderService.saveOrder(order, customerInfo);
			emailService.sendEmailByAccountId(orderDetails, customerInfo, order);
		} catch (Exception ex) {
			customerInfoService.deleteCustomer(customerInfo);
			orderDetailService.deleteOrderDetail(orderDetails);
		}

		if (order != null) {
			order.setStatus("Ordered");

			orderService.saveOrder(order, customerInfo);
			session.invalidate();
		}
	
		return "redirect:/home?message=Order Successfull, check your Email &status=success\"";

	}


}