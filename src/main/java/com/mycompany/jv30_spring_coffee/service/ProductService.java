
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_spring_coffee.service;

import com.mycompany.jv30_spring_coffee.entities.ImageEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductEntity;
import com.mycompany.jv30_spring_coffee.entities.ProductPromotionEntity;
import com.mycompany.jv30_spring_coffee.entities.PromotionEntity;
import com.mycompany.jv30_spring_coffee.repositories.ImageRepository;
import com.mycompany.jv30_spring_coffee.repositories.ProductRepository;
import com.mycompany.jv30_spring_coffee.repositories.PromotionRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ImageRepository imageRepository;

	@Autowired
	private PromotionRepository promotionRepository;

	@Autowired
	private PromotionService promotionService;

	public ProductEntity findProductById(int productId) {
		ProductEntity product = productRepository.findOne(productId);
		product.setImages(imageRepository.findByProduct(product));
		return product;
	}

	public List<ProductEntity> getProducts() {
		Page<ProductEntity> pageProducts = productRepository.findAll(new PageRequest(0, 6));
		List<ProductEntity> products = pageProducts.getContent();
		if (products != null && products.size() > 0) {
			for (ProductEntity i : products) {
				i.setImages(imageRepository.findByProduct(i));
				i.setTotalProduct(pageProducts.getTotalPages());
			}
		}
		return products;
	}

	public List<ProductEntity> getProducts(int page) {
		Page<ProductEntity> pageProducts = productRepository.findAll(new PageRequest(page, 6));
		List<ProductEntity> products = pageProducts.getContent();
		if (products != null && products.size() > 0) {
			for (ProductEntity i : products) {
				i.setImages(imageRepository.findByProduct(i));
				i.setTotalProduct(pageProducts.getTotalPages());
			}
		}
		return products;
	}

	public List<ProductEntity> searchProduct(String searchTxt) {
		List<ProductEntity> list = productRepository.findProductByName("%" + searchTxt + "%");
		for (ProductEntity i : list) {

			i.setImages(imageRepository.findByProduct(i));
		}
		return list;
	}

	public List<ProductEntity> findProductByProducerId(int id) {
		List<ProductEntity> list = (List<ProductEntity>) productRepository.findProductByProducerId(id);
		for (ProductEntity i : list) {

			i.setImages(imageRepository.findByProduct(i));
		}

		return list;
	}

	public List<ProductEntity> sortProductByPrice() {
		List<ProductEntity> list = (List<ProductEntity>) productRepository.sortProductByPrice();
		for (ProductEntity i : list) {

			i.setImages(imageRepository.findByProduct(i));
		}
		return list;
	}

//    public List<ProductEntity> findProductById 

	public float setPriceProduct(ProductEntity pe) {
		float price = pe.getPrice();
		PromotionEntity pre = promotionService.findPromotionByProductIdAndCurrentDate(pe.getId());
		if (pre.getId() > 0) {
			price = price - ((price * pre.getDiscount()) / 100);
		}

		return price;
	}

}
