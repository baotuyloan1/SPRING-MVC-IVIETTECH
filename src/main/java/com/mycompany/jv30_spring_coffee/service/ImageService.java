/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.service;

import com.mycompany.jv30_spring_coffee.entities.ImageEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductEntity;
import com.mycompany.jv30_spring_coffee.repositories.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ImageService {
    
    @Autowired
    private ImageRepository imageRepository;
    
    public List<ImageEntity> findImageByProductId (ProductEntity product) {
        List<ImageEntity> images = imageRepository.findByProduct(product) ;
        return images;
    }
    
    public List<ImageEntity> getImagesByProduct (ProductEntity product){
     
        
         return (List<ImageEntity>) imageRepository.findOne(product.getId());
    }
    
   
    
   
}
