/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.repositories;

import com.mycompany.jv30_spring_coffee.entities.ImageEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity , Integer>{

  
    
    public List<ImageEntity> findByProduct (ProductEntity product) ;
    
    
    
    
 
    
}
