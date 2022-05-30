/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mycompany.jv30_spring_coffee.entities.AccountEntity;
import com.mycompany.jv30_spring_coffee.entities.CustomerInfoEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderDetailEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderEntity;
import com.mycompany.jv30_spring_coffee.enums.Gender;
import com.mycompany.jv30_spring_coffee.service.CustomerInfoService;
import com.mycompany.jv30_spring_coffee.service.EmailService;
import com.mycompany.jv30_spring_coffee.service.OrderDetailService;
import com.mycompany.jv30_spring_coffee.service.OrderService;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private CustomerInfoService customerInfoService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping(value = "/check_out")
	public String checkOut(Model m, HttpSession session, Authentication authentication) {
		AccountEntity acc = (AccountEntity) authentication.getPrincipal();

		m.addAttribute("acc", acc);
		m.addAttribute("genders", Gender.values());
		m.addAttribute("customerInfo", new CustomerInfoEntity());

		return "/user/checkout";
	}

	@RequestMapping(value = "/submit_order", method = RequestMethod.POST)
	public String doneOrder(Model m, HttpSession session,
			@ModelAttribute("customerInfo") CustomerInfoEntity customerInfo, Authentication authentication)
			throws MessagingException {
		OrderEntity order = (OrderEntity) session.getAttribute("order");

		AccountEntity acc = (AccountEntity) authentication.getPrincipal();

		customerInfo.setAccount(acc);
		order.setCustomer(customerInfo);
		customerInfoService.saveCustomerInfo(customerInfo);
		if (order.getOrderDetails().size() > 0 && customerInfoService.saveCustomerInfo(customerInfo) != null) {

			orderService.saveOrder(order, customerInfo);
			List<OrderDetailEntity> orderDetails = order.getOrderDetails();

			emailService.sendEmailByAccountId(orderDetails, customerInfo, order);

			try {
				orderService.saveOrder(order, customerInfo);
			} catch (Exception ex) {
				customerInfoService.deleteCustomer(customerInfo);
				orderDetailService.deleteOrderDetail(orderDetails);
			}

			if (order != null) {
				order.setStatus("Ordered");

				orderService.saveOrder(order, customerInfo);
				session.invalidate();
			}

		}

		return "redirect:/home?message=Order Successfull, check your Email &status=success\"";

	}

	@RequestMapping(value = "/deleteOrder/{orderId}")

	public String deleteOrder(Model m, @PathVariable("orderId") int id) {

		CustomerInfoEntity cus = customerInfoService.findCusById(id);
		OrderEntity order = orderService.findOrderByCusInfo(cus);
		orderService.findOrderById(order.getId());

		orderService.deleteOrder(order);
		customerInfoService.deleteCustomer(cus);

		return "redirect:/viewinfo";
	}

}
