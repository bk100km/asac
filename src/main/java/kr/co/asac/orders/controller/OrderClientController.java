package kr.co.asac.orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.member.bean.MemberBean;
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
		String mid = (String)session.getAttribute("mid");
		List<OrderBean> list = orderClientService.orderClientList(mid, order);
		model.addAttribute("orderClientList",list);
		return "orders/orderClientList";
	}
	
	@RequestMapping("me/cl/in")
	public String getOrderClientInfo(Model model, @RequestParam int ocode, OrderBean order) {
		OrderBean info = orderClientService.orderClientinfo(order, ocode);
		model.addAttribute("orderClientInfo",info);
	return "orders/orderClientInfo";
		
	}
	
	@RequestMapping("or/cl/up")
	public  String orderClientUpdate(Model model, @RequestParam int ocode, OrderBean order) {
		orderClientService.orderClientUpdate(model, order);
		System.out.println(order);
		OrderBean update = orderClientService.orderClientinfo(order, ocode);
		System.out.println("2" + update);
		model.addAttribute("orderClientInfo", update);
		return "orders/orderClientInfo";
	}
	
	@RequestMapping("or/cl/de")
	public String orderClientDelete(@RequestParam int ocode) {
		int info = orderClientService.orderClientDelete(ocode);
		return "redirect:/me/cl/my";
	}
	
	@RequestMapping(value="ca/cl/li", method= {RequestMethod.GET, RequestMethod.POST})
	public String CartList(HttpServletRequest request, Model model, CartBean cart,  MemberBean member) {
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		List<CartBean> cartlist = orderClientService.cartList(mid, cart);
		model.addAttribute("cartList",cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		model.addAttribute("memberInfo",memberinfo);
		return "orders/cart";
	}
	
	@RequestMapping("/ca/cl/in")
	public String CartInsert(Model model, CartBean cart) {
		int insertsu = orderClientService.cartInsert(cart);
		model.addAttribute("cart", cart);
		return "product/productClientDetail"
				+ "";
	}
	
	
	@RequestMapping(value="/ca/cl/up", method = RequestMethod.POST)
	public String CartUpdate(HttpServletRequest request, HttpSession session, Model model, CartBean cart, MemberBean member) {
		orderClientService.cartUpdate(request, model, cart);
		System.out.println(cart);
		String mid=(String) session.getAttribute("mid");
		List<CartBean> cartlist = orderClientService.cartList(mid, cart);
		model.addAttribute("cartList",cartlist);
		System.out.println(cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		model.addAttribute("memberInfo",memberinfo);
		return "orders/cart";
	}
	
	@RequestMapping(value="/ca/cl/de", method = RequestMethod.GET)
	public String cartDeleteAll(HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		int info = orderClientService.cartDeleteAll(mid);
		return "redirect:li";
	}
	
	@RequestMapping(value="/ca/cl/ds", method = RequestMethod.GET)
	public String cartDeleteSelect(@RequestParam int ccode) {
		int info = orderClientService.cartDeleteSelect(ccode);
		return "redirect:li";
	}
	
}
