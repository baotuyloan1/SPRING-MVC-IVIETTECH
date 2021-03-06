/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.service;

import com.mycompany.jv30_spring_coffee.entities.ProducerEntity;
import com.mycompany.jv30_spring_coffee.repositories.ProducerRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ProducerService {
    
    @Autowired
    private ProducerRepository producerRepository ;
    
    public List<ProducerEntity> getProducers () {
        return (List<ProducerEntity>) producerRepository.findAll() ;
    }
    
   
}
