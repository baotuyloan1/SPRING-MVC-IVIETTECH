/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.service;

import com.mycompany.jv30_spring_coffee.entities.CustomerInfoEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderDetailEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductEntity;
import com.mycompany.jv30_spring_coffee.repositories.OrderDetailRepository;
import com.mycompany.jv30_spring_coffee.repositories.OrderRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private OrderDetailRepository orderDetailRepository;

//    public OrderEntity saveOrder (OrderEntity orderEntity) {
//        return orderRepository.save(orderEntity) ;
//    }
	@Transactional(rollbackFor = Exception.class)
	public OrderEntity saveOrder(OrderEntity order, CustomerInfoEntity cus) {

		try {
			order.setCustomer(cus);

			if (cus.getId() > 0) {

				if (order.getId() > 0) {
					for (OrderDetailEntity orderItem : order.getOrderDetails()) {
						orderItem.setOrder(order);
						orderDetailRepository.save(orderItem);

					}
				}
			}
		} catch (Exception ex) {

		}
		return orderRepository.save(order);
	}

	public OrderEntity findOrderByCusInfo(CustomerInfoEntity cus) {

		OrderEntity orders = orderRepository.findOrderByCusInfo(cus.getId());
		return orders;

	}

	public OrderEntity findOrderById(int id) {
		OrderEntity order = orderRepository.findOne(id);
		if (order != null) {
			order.setOrderDetails(orderDetailRepository.findByOrder(order));

		}

		return order;
	}

//	public  List<OrderEntity> showOrder (List<CustomerInfoEntity> customers) {
//   
//    	for (int i = 0 ; i < customers.size() ; i++) {
//    		List<OrderEntity> orders = findOrderByCusInfo(customers.get(i)) ;
//    	}
//    	return orders ;
//    }
	
	
	public void deleteOrder (OrderEntity orderEntity) {
		orderRepository.delete(orderEntity.getId());
		
	}

}
