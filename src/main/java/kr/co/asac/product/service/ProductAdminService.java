package kr.co.asac.product.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.dao.MemberDAO;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;

@Service
public class ProductAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// �������Ͽ� ������ ��ϵǾ��� ������ �����ڳ� Setter ���� �ڵ����� ����
	
	public void productAdminList(Model model) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List <ProductBean> productAdminList = productDAO.productadminlist();
		model.addAttribute("productAdminList", productAdminList);
	}
	
	public ProductBean productAdminInfo(Model model, String pcode){
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductBean productAdminInfo = productDAO.productadmininfo(pcode);
		System.out.println("���񽺿��� ���� info" + productAdminInfo);
		model.addAttribute("productAdminInfo", productAdminInfo);
		return productAdminInfo;
	}
		
	public void productAdminInsert(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productadmininsert(product);
		System.out.println(product);
	}
	
	public void productAdminUpdate(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		try {System.out.println("���񽺿��� ���� update" + product);
			productDAO.productadminupdate(product);
		} catch (Exception e) {
			System.out.println("update : " + e);
		}
	}
	
	public int productAdminDelete(String pcode){
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int delete = productDAO.productadmindelete(pcode);
		return delete;
	}
	
}
