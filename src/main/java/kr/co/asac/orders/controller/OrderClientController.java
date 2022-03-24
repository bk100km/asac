package kr.co.asac.orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderClientService;
import kr.co.asac.product.bean.ProductBean;

@Controller
public class OrderClientController { 
	
	@Autowired
	OrderClientService orderClientService;
	
	@RequestMapping("/or/cl/li")
	public String getOrderClientList(HttpServletRequest request, Model model, OrderBean order) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("mid");
		List<OrderBean> list = orderClientService.orderClientList(id, order);
		model.addAttribute("orderClientList",list);
		return "orders/orderClientList";
	}
	
	@RequestMapping("or/cl/in")
	public String getOrderClientInfo(Model model, @RequestParam int ocode, OrderBean order) {
		OrderBean info = orderClientService.orderClientinfo(order, ocode);
		model.addAttribute("orderClientInfo",info);
	return "orders/orderClientInfo";
		
	}
	
	@RequestMapping("or/cl/up")
	public  String orderClientUpdate(Model model, @RequestParam int ocode) {
		OrderBean update = orderClientService.orderClientUpdate(ocode);
		model.addAttribute("orderClientUpdateInfo", update);
		return "orders/orderClientInfo";
	}
	
	@RequestMapping("or/cl/de")
	public String orderClientDelete(@RequestParam int ocode) {
		int info = orderClientService.orderClientDelete(ocode);
		return "redirect:li";
	}
	
	@RequestMapping("/ca/cl/li")
	public String CartList(HttpServletRequest request, Model model, CartBean cart) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("mid");
		List<CartBean> cartlist = orderClientService.cartList(id, cart);
		model.addAttribute("cartList",cartlist);
		return "orders/cart";
	}
	
	@RequestMapping("/ca/cl/in")
	public String CartInsert(Model model, CartBean cart) {
		int insertsu = orderClientService.cartInsert(cart);
		model.addAttribute("cart", cart);
		return "product/productDetailtest";
	}
	
}
