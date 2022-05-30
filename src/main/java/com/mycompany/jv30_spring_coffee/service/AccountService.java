/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.service;

import com.mycompany.jv30_spring_coffee.entities.AccountEntity;
import com.mycompany.jv30_spring_coffee.entities.CustomerInfoEntity;
import com.mycompany.jv30_spring_coffee.entities.OrderEntity;
import com.mycompany.jv30_spring_coffee.repositories.AccountRepository;
import com.mycompany.jv30_spring_coffee.repositories.CustomerRepository;
import com.mycompany.jv30_spring_coffee.repositories.OrderRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class AccountService {
    
    @Autowired 
    private AccountRepository accountRepository;
    
    @Autowired 
    private OrderRepository orderRepository;
    
    @Autowired 
    private CustomerRepository customerRepository ;
    
    public AccountEntity findAccountByEmailAndPassword (String email , String password) {
      return  accountRepository.findAccountByEmailAndPassword(email, password) ;
    }
    
    
}
