package kr.co.asac.orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.service.MemberClientService;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderClientService;

@Controller
public class OrderClientController { 
	
	@Autowired
	OrderClientService orderClientService;
	@Autowired
	MemberClientService memberClientService;
	
	@ResponseBody
	@RequestMapping(value="/or/cl/is", method = RequestMethod.POST)
	public String orderClientInsert(HttpServletRequest request, Model model, 
			@RequestParam(value="sidarr", required = false) String sidarr, 
			@RequestParam(value="pcodearr", required = false) String pcodearr, @RequestParam(value="ocountarr", required = false) String ocountarr, 
			@RequestParam(value="oname", required = false) String oname, @RequestParam(value="oaddrz", required = false) String oaddrz, 
			@RequestParam(value="oaddr", required = false) String oaddr, @RequestParam(value="oaddrd", required = false) String oaddrd, 
			@RequestParam(value="ophone", required = false) String ophone,  @RequestParam(value="ototalarr", required = false) String ototalarr,
			@RequestParam(value="omessage", required = false) String omessage ) throws Exception {

		String[] sid = sidarr.split(",");
		String[] pcode = pcodearr.split(",");
		String[] ocount = ocountarr.split(",");
		String[] ototal = ototalarr.split(",");
		
		System.out.println(sid[0].toString());
		System.out.println(pcode[0].toString());
		System.out.println(ocount[0].toString());
		System.out.println(oname);
		System.out.println(oaddrz);
		System.out.println(oaddr);
		System.out.println(oaddrd);
		System.out.println(ophone);
		System.out.println(ototal[0].toString());
		System.out.println(omessage);
		
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		String ocode = orderClientService.orderClientInsert(sidarr, mid, pcodearr, ocountarr,oname, oaddrz,oaddr, 
				oaddrd,ophone,ototalarr, omessage);
		return ocode;
	}
	
	@RequestMapping("or/cl/su/{ocode}/{ccode}") 
	public String getOrderClientSuccess(Model model, @PathVariable String ocode, @PathVariable String[] ccode,OrderBean order, HttpServletResponse response, HttpSession session) throws IOException {
		
		if ((String)session.getAttribute("mid") == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('로그인 후 이용해주세요.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();	
		} 
		
		int size = ccode.length;
	        for(int i=0; i<size; i++) {
	        	orderClientService.delete(ccode[i]);
	        }
		List<OrderBean> info = orderClientService.orderClientinfo(order, ocode);
		model.addAttribute("orderClientInfo",info);
		
	return "orders/orderClientSuccess";
		
	}
	
	@RequestMapping("/or/cl/li")
	public String getOrderClientList(HttpServletRequest request, Model model, OrderBean order) {
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		List<OrderBean> list = orderClientService.orderClientList(mid, order);
		model.addAttribute("orderClientList",list);
		return "orders/orderClientList";
	}
	
	@RequestMapping("me/cl/in/{ocode}")
	public String getOrderClientInfo(Model model, @PathVariable String ocode, OrderBean order, HttpSession session, HttpServletResponse response)  throws IOException {
		
		if ((String)session.getAttribute("mid") == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('로그인 후 이용해주세요.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();	
		}
		
		List<OrderBean> info = orderClientService.orderClientinfo(order, ocode);
		model.addAttribute("orderClientInfo",info);
	return "orders/orderClientInfo";
		
	}
	
	@RequestMapping("or/cl/up/{ocode}")
	public  String orderClientUpdate(HttpServletResponse response, Model model, @PathVariable String ocode, OrderBean order) throws IOException {
		orderClientService.orderClientUpdate(model, order);
		System.out.println(order);
		List<OrderBean> update = orderClientService.orderClientinfo(order, ocode);
		System.out.println("2" + update);
		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script language='javascript'>");
			out.println("alert('배송지 수정이 완료되었습니다.')");
			out.println("</script>");

			out.flush();
		model.addAttribute("orderClientInfo", update);
		
		return "orders/orderClientInfo";
	}
	
	@RequestMapping("or/cl/de/{ocode}")
	public String orderClientDelete(@PathVariable String ocode) {
		
		int info = orderClientService.orderClientDelete(ocode);
		System.out.println("delete" + ocode);
		return "redirect:/me/cl/my";
	}
	
	@RequestMapping(value="or/cl/or/{pcodearr}/{ocountarr}", method= {RequestMethod.GET, RequestMethod.POST})
	public String OrderClientOrder(HttpServletRequest request, Model model, CartBean cart,  MemberBean member, @PathVariable("pcodearr") String pcodearr, @PathVariable("ocountarr") String ocountarr, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(); 
		
		if ((String)session.getAttribute("mid") == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('로그인 후 이용해주세요.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();	
		} 
		
		String mid = (String)session.getAttribute("mid");
		
		List<CartBean> cartlist = orderClientService.cartList(mid, cart);
		model.addAttribute("cartlist",cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		
		String[] pcodearrr = pcodearr.split(",");
		for (int i = 0; i < pcodearrr.length; i++) {
			System.out.println("어휴"+pcodearrr[i]);
		}

		String[] ocountarrr = ocountarr.split(",");
		
		model.addAttribute("pcodearrr", pcodearrr);
		model.addAttribute("ocountarrr", ocountarrr);
		System.out.println("pp"+ pcodearrr);
		System.out.println("oo"+ ocountarrr);
		model.addAttribute("memberInfo",memberinfo);
		System.out.println("m " + memberinfo);
		return "orders/orderClientOrder";
	}

	@RequestMapping("or/cl/gu/{ocode}")
	public  String orderClientGumaeUpdate(HttpServletRequest request, HttpSession session,Model model, @PathVariable String ocode, OrderBean order) {
		String mid=(String) session.getAttribute("mid");
		System.out.println("서비스들어옴");
		orderClientService.orderClientGumaeUpdate(model, order);
		System.out.println(order);
		//orderClient
		List<OrderBean> list = orderClientService.orderClientOcodeList(mid, order);
		model.addAttribute("orderClientOrderList",list);
		System.out.println("list" + list);
		memberClientService.memberClientInfo(request, session, model, mid);

		return "/member/memberClientMypage";
	}
	
	@RequestMapping(value="ca/cl/li", method= {RequestMethod.GET, RequestMethod.POST})
	public String CartList(HttpServletRequest request, Model model, CartBean cart,  MemberBean member, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(); 
		
		if ((String)session.getAttribute("mid") == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('로그인 후 이용해주세요.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();	
		} 
		
		String mid = (String)session.getAttribute("mid");
		List<CartBean> cartlist = orderClientService.cartList(mid, cart);
		model.addAttribute("cartList",cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		model.addAttribute("memberInfo",memberinfo);
		System.out.println("m " + memberinfo);
		return "orders/cart";
	}
	
	@RequestMapping(value="ca/cl/lf", method= {RequestMethod.GET, RequestMethod.POST})
	public String FastList(HttpServletRequest request, Model model, CartBean cart,  MemberBean member) {
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		List<CartBean> cartlist = orderClientService.FastList(mid, cart, model);
		model.addAttribute("cartList",cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		model.addAttribute("memberInfo",memberinfo);
		System.out.println("m " + memberinfo);
		return "orders/orderFast";
	}	
	
	@RequestMapping("/ca/cl/in")
	public String CartInsert(HttpServletRequest request, HttpServletResponse response, Model model, CartBean cart) throws Exception {
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		System.out.println("안녕 ㅠㅠ"+cart);
		orderClientService.cartInsert(cart, response,mid);
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
	
	@RequestMapping(value = "/ca/cl/ds")
    public String ajaxTest(HttpServletRequest request) {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        System.out.println(ajaxMsg.toString());
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	orderClientService.delete(ajaxMsg[i]);
        }
        return "redirect:li";
    }
	
}
