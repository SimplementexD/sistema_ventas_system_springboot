package com.project.ordermanagementsystem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.ordermanagementsystem.exception.ResourceNotFoundException;
import com.project.ordermanagementsystem.model.Country;
import com.project.ordermanagementsystem.model.Category;
import com.project.ordermanagementsystem.model.Company;
import com.project.ordermanagementsystem.model.Product;
import com.project.ordermanagementsystem.model.State;
import com.project.ordermanagementsystem.repository.ProductRepository;

@CrossOrigin(origins = "*")
@RestController
//aaaeeeeeeeeeeeeeeeeeeeeeee
@RequestMapping("/api/v1")
public class ProductController {
	@Autowired
	private ProductRepository productRepository;
	
	@PersistenceContext
    private EntityManager entityManager;

	@GetMapping("/products")
	public List<Product> listarProductos() {
		return productRepository.findAll();
	}
	
	@GetMapping("/products/{id}")
	public ResponseEntity<Product> buscarPorId(@PathVariable(value = "id") Long productId)
			throws ResourceNotFoundException {
		Product product = productRepository.findById(productId)
				.orElseThrow(() -> new ResourceNotFoundException("Product not found for this id :: " + productId));
		return ResponseEntity.ok().body(product);
	}

	@GetMapping("/products/search/{code}")
	public List<Product> buscarPorCodigo(@PathVariable(value = "code") String productName) {
			return productRepository.serchProductByCode(productName);
	}
	
	@GetMapping("/products/search-state/{state}")
	public List<Product> buscarPorEstado(@PathVariable(value = "state") String productState) {
			return productRepository.serchProductByState(productState);
	}
	
	@RequestMapping(value = "/producto/guardar", method = RequestMethod.POST)
	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE,  consumes = MediaType.APPLICATION_JSON_VALUE)
	public Product guardar(@Valid @RequestBody Product product) {
		return productRepository.save(product);
	}
	
	@RequestMapping(value = "/product/actualizar", method = RequestMethod.PUT)
	@PutMapping(produces = MediaType.APPLICATION_JSON_VALUE,  consumes = MediaType.APPLICATION_JSON_VALUE)
	public Product actualizar(@Valid @RequestBody Product product) {
		return productRepository.save(product);
	}
	
//	public ResponseEntity<Product> actualizar(
//			@RequestParam(value = "id") Long productId,
//			@Valid @RequestBody Product productDetails) throws ResourceNotFoundException {
//		
//		final Product updatedProduct = productRepository.save(productDetails);
//		return ResponseEntity.ok(updatedProduct);
//	}
	
	@RequestMapping(value = "/product", method = RequestMethod.DELETE)
	@DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE,  consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Boolean> eliminar(@RequestParam(value = "id") Long productId) throws ResourceNotFoundException {
		Product product = productRepository.findById(productId)
				.orElseThrow(() -> new ResourceNotFoundException("Product not found for this id :: " + productId));

		productRepository.delete(product);
		Map<String, Boolean> response = new HashMap<>();
		response.put("deleted", Boolean.TRUE);
		return response;
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/products/all-products")
	public ArrayList getAllProductFields() {
		 Query q = entityManager.createQuery("SELECT prod, cat, com from product prod, category cat, company com  WHERE product_category_id = category_id AND product_company = company_id");
		 List<Object[]> product = q.getResultList();
		 ArrayList<HashMap<String, String>> resultArray = new ArrayList();
		 
		 for ( Object[] row : product ) {
			  Product product_details = (Product)row[ 0 ];
			  Category category_details = (Category)row[ 1 ];
			  Company company_details = (Company)row[ 2 ];
			  
			    HashMap<String, String> results = new HashMap();
			    results.put("company_name",company_details.getCompany_name());
			    results.put("category_name",category_details.getCategory_name());
			    results.put("product_id",String.valueOf(product_details.getProduct_id()));
				results.put("product_category_id",product_details.getProduct_category_id());
				results.put("product_code",product_details.getProduct_code());
				results.put("product_stock",product_details.getProduct_stock());
				results.put("product_title",product_details.getProduct_title());
				results.put("product_price_per_item",product_details.getProduct_price_per_item());
				results.put("product_description",product_details.getProduct_description());
				results.put("product_prod_date",product_details.getProduct_prod_date());
				results.put("product_exp_date",product_details.getProduct_exp_date());
				results.put("product_company",product_details.getProduct_company());
			    resultArray.add(results);
			 
		 }	 

        return resultArray;
	}
	
	

	
}
