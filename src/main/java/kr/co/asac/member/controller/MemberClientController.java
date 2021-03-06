package kr.co.asac.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.service.MemberClientService;
import kr.co.asac.member.service.NaverLoginBO;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderAdminService;
import kr.co.asac.orders.service.OrderClientService;
import kr.co.asac.product.service.ProductClientService;

@Controller
public class MemberClientController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//orderClient
	@Autowired
	private OrderClientService orderClientService;
	
	@Autowired
	private MemberClientService memberClientService;

	@Autowired
	private OrderAdminService orderAdminService;
	
	@Autowired
	private ProductClientService productClientService;

	private static final Logger logger = LoggerFactory.getLogger(MemberClientController.class);

	@Autowired
	private JavaMailSender mailSender;

	// common mapping
	@RequestMapping("/")
	public String memberClientIndex(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		orderAdminService.orderProductList(request, response, model);
		productClientService.productClientIndexTag(model, "???");
		return "index";
	}

	// member mapping
	@RequestMapping(value = "/me/cl/lo", method = RequestMethod.GET)
	public String memberClientLoginForm(@ModelAttribute("member") MemberBean member, HttpSession session, Model model) {
		/* ????????????????????? ?????? URL??? ???????????? ????????? naverLoginBO???????????? getAuthorizationUrl????????? ?????? */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("?????????:" + naverAuthUrl);
		// ?????????
		model.addAttribute("url", naverAuthUrl);
		return "/member/memberClientLoginForm";
	}

	@RequestMapping(value = "/me/cl/lA", method = RequestMethod.POST)
	public String memberClientLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model,
			MemberBean member) throws Exception {
		memberClientService.memberClientLoginCheck(request, response, model, member);
		orderAdminService.orderProductList(request, response, model);
		System.out.println(member);
		System.out.println(member.getReferer());
		return "redirect:" + member.getReferer();
	}

	@RequestMapping(value = "/me/cl/lO", method = RequestMethod.GET)
	public String memberClientLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/me/cl/jo", method = RequestMethod.GET)
	public String memberClientJoin() {
		return "/member/memberClientJoinForm";
	}

	@RequestMapping(value = "/me/cl/jo", method = RequestMethod.POST)
	@ResponseBody
	public void memberClientJoin(MemberBean member) {
		System.out.println(member);
		memberClientService.memberClientJoin(member);
	}

	@RequestMapping(value = "/me/cl/jA", method = RequestMethod.POST)
	public String memberClientJoinAction(MemberBean member) {
		System.out.println(member);
		memberClientService.memberClientJoin(member);
		return "redirect:/me/cl/lo";
	}

	@RequestMapping(value = "/me/cl/iC", method = RequestMethod.POST)
	@ResponseBody
	public int memberIdChk(MemberBean member) {
		System.out.println("????????????");
		int result = memberClientService.memberIdChk(member);
		System.out.println(result + "????");
		return result;
	}
	
	@RequestMapping(value = "/me/cl/eC", method = RequestMethod.POST)
	@ResponseBody
	public int memberEmailChk(MemberBean member) {
		System.out.println("????????????");
		int result = memberClientService.memberEmailChk(member);
		System.out.println(result + "????");
		return result;
	}

	@RequestMapping(value = "/me/cl/my", method = RequestMethod.GET)
	public String memberClientMypage(HttpServletRequest request, HttpSession session, Model model, OrderBean order, HttpServletResponse response) throws IOException {
		
		if ((String)session.getAttribute("mid") == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('????????? ??? ??????????????????.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();	
		} 
		
		System.out.println("mid??? ????????? my1");
		String mid=(String) session.getAttribute("mid");
		System.out.println("mid??? ????????? my2" + mid);
		
		//orderClient
		List<OrderBean> list = orderClientService.orderClientList(mid, order);
		model.addAttribute("orderClientList",list);
		List<OrderBean> ocodelist = orderClientService.orderClientOcodeList(mid, order);
		model.addAttribute("orderClientOrderList",ocodelist);
		
		memberClientService.memberClientInfo(request, session, model, mid);
		return "/member/memberClientMypage";
	}

	@RequestMapping(value = "/me/cl/up", method = RequestMethod.POST)
	public String memberClientInfo(HttpServletRequest request, HttpSession session, Model model, MemberBean member, HttpServletResponse response) throws Exception {
		memberClientService.memberClientUpdate(request, model, member, response);
		String mid = (String) session.getAttribute("mid");
		memberClientService.memberClientInfo(request, session, model, mid);
		return "redirect:/me/cl/my";
	}

	@RequestMapping(value = "/me/cl/de", method = RequestMethod.GET)
	public String memberDeleteView() {
		return "/member/memberClientDelete";
	}
	
	@RequestMapping(value = "/me/cl/dk", method = RequestMethod.GET)
	public void memberClientDeleteKN(MemberBean vo, OrderBean order, Model model, HttpSession session, RedirectAttributes rttr, @RequestParam(value="oconfirmed", required=false) String oconfirmed, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String mid = (String) session.getAttribute("mid");
		System.out.println("delete?????? mid??????? ===> " + mid);
		List<OrderBean> ocodelist = orderClientService.orderClientOcodeList(mid, order);
		model.addAttribute("orderClientOrderList",ocodelist);
		if(ocodelist != null) {
			for(int j=0; j < ocodelist.size(); j++) {
				OrderBean str = ocodelist.get(j);
				if(!str.getOconfirmed().equals("????????????")) {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('?????? ?????? ??? ???????????????.')");
					out.println("location.href='/me/cl/my'");
					out.println("</script>");
					out.flush();
					return;
				} else {
				}
			}
			memberClientService.orderBackupInsert(session, order);
			memberClientService.memberClientDelete(session, vo, response);
		} else {
			memberClientService.orderBackupInsert(session, order);
			memberClientService.memberClientDelete(session, vo, response);
		}
	}	

	@RequestMapping(value = "/me/cl/dC", method = RequestMethod.POST)
	public void memberClientDelete(MemberBean vo, OrderBean order, Model model, HttpSession session, RedirectAttributes rttr, @RequestParam("oconfirmed") String oconfirmed, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String mid = (String) session.getAttribute("mid");
		List<OrderBean> ocodelist = orderClientService.orderClientOcodeList(mid, order);
		model.addAttribute("orderClientOrderList",ocodelist);
		if(ocodelist != null) {
			for(int j=0; j < ocodelist.size(); j++) {
				OrderBean str = ocodelist.get(j);
				if(!str.getOconfirmed().equals("????????????")) {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('?????? ?????? ??? ???????????????.')");
					out.println("location.href='/me/cl/my'");
					out.println("</script>");
					out.flush();
					return;
				} else {
				}
			}
			memberClientService.orderBackupInsert(session, order);
			memberClientService.memberClientDelete(session, vo, response);
		} else {
			memberClientService.orderBackupInsert(session, order);
			memberClientService.memberClientDelete(session, vo, response);
		}
	}

	@RequestMapping(value = "/me/cl/dP", method = RequestMethod.POST)
	@ResponseBody
	public int memberClientDelPwC(MemberBean vo) {
		int result = memberClientService.memberClientDelPwC(vo);
		System.out.println(result);
		return result;
	}

	/* ????????? ?????? */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		System.out.println("?????????????");
		/* ???(View)????????? ????????? ????????? ?????? */
		logger.info("????????? ????????? ?????? ??????");
		logger.info("???????????? : " + email);

		/* ????????????(??????) ?????? */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("???????????? " + checkNum);

		String setFrom = "bk100km_@naver.com";
		String toMail = email;
		String title = "???????????? ?????? ????????? ?????????.";
		String content = "??????????????? ?????????????????? ???????????????." + "<br><br>" + "?????? ????????? [" + checkNum + "]?????????." + "<br>"
				+ "?????? ??????????????? ???????????? ???????????? ???????????? ?????????.";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);

			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}

	@RequestMapping(value = "/me/cl/lo/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=346850b56c865f9b968ddbb705b5d969"
				+ "&redirect_uri=http://www.asac.gq/me/cl/lo/kakao" + "&response_type=code";

		return reqUrl;
	}

	// ????????? ???????????? ??????
	@RequestMapping(value = "/me/cl/lo/kakao")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model, MemberBean member, HttpSession session)
			throws Exception {

		System.out.println("#########" + code);
		String access_Token = getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);

		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###client_id#### : " + userInfo.get("id"));
		System.out.println("###userInfo#### : " + userInfo.get("email"));
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###userInfo??? ?????????????###"+userInfo);

		member.initMember();
		JSONObject kakaoInfo = new JSONObject(userInfo);
		member.setMid("k@"+(String)userInfo.get("id"));
		member.setMmail((String)userInfo.get("email"));
		member.setMname((String)userInfo.get("nickname"));
		System.out.println("????????? ?????? "+member);
		
		if (memberClientService.memberIdChk(member) != 1) {
			System.out.println("?????????????????? idCheck 0 true");
			memberClientService.memberClientKakao(member);
		}
		
		session.setAttribute("mid", member.getMid());
		model.addAttribute("kakaoInfo", kakaoInfo);
		System.out.println((String)userInfo.get("id"));
		
		System.out.println(kakaoInfo);

		return "redirect:/me/cl/my"; // ?????? ????????? ?????? ??????
	}

	// ????????????
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// URL????????? ???????????? ?????? ??? ??? ??????, POST ?????? PUT ????????? ????????? setDoOutput??? true??? ???????????????.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=346850b56c865f9b968ddbb705b5d969"); // ????????? ???????????? key
			sb.append("&redirect_uri=http://www.asac.gq/me/cl/lo/kakao"); // ????????? ????????? ?????? ??????
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// ?????? ????????? 200????????? ??????
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// ????????? ?????? ?????? JSON????????? Response ????????? ????????????
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// ??????????????????
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// ????????? ????????? Header??? ????????? ??????
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String id = element.getAsJsonObject().get("id").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("accessToken", access_Token);
			userInfo.put("id", id);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userInfo;
	}

	// ????????? ???????????? ?????????
	// ????????? ??? ?????? ?????? ?????????
	@RequestMapping(value = "/me/cl/lo/naver", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* ????????????????????? ?????? URL??? ???????????? ????????? naverLoginBO???????????? getAuthorizationUrl????????? ?????? */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("?????????:" + naverAuthUrl);
		// ?????????
		model.addAttribute("url", naverAuthUrl);
		return "index";
	}

	// ????????? ????????? ????????? callback?????? ?????????
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, MemberBean member)
			throws IOException, ParseException {
		System.out.println("????????? callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. ????????? ????????? ????????? ????????????.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String????????? json?????????
		/**
		 * apiResult json ?????? {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String????????? apiResult??? json????????? ??????
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. ????????? ??????
		// Top?????? ?????? _response ??????
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response??? nickname??? ??????
		
		member.initMember();
		member.setMid("n@" + (String) response_obj.get("id"));
		System.out.println("????????? ????????? ????????? "+member);
		
		if ((String) response_obj.get("email") != null) {
			member.setMmail((String) response_obj.get("email"));
		}
		if ((String) response_obj.get("name") != null) {
			member.setMname((String) response_obj.get("name"));
		}
		if ((String) response_obj.get("mobile") != null) {
			member.setMphone((String) response_obj.get("mobile"));
			System.out.println(member.getMphone());
		}
	
		System.out.println("member?????? = " + member);
		if (memberClientService.memberIdChk(member) != 1) {
		memberClientService.memberClientNaver(member);
		}
		
		// 4.?????? ????????? ???????????? ??????
		session.setAttribute("mid", member.getMid()); // ?????? ??????
		// test
		return "redirect:/me/cl/my";
	}
	
	@RequestMapping(value = "/me/cl/fP", method = RequestMethod.GET)
	public String findPwGET() throws Exception{
		return "member/findpw";
	}

	@ResponseBody
	@RequestMapping(value = "/me/cl/fP", method = RequestMethod.POST)
	public void findPwPOST(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "id") String mid,
			@RequestParam(value = "email") String mmail) throws Exception{
		System.out.println("????????????findpw");
		MemberBean member = new MemberBean();
		member.setMid(mid);
		member.setMmail(mmail);
		memberClientService.findPw(request, response, member, model, mid);
		System.out.println(member);
	}
	
	@RequestMapping(value = "/me/cl/fI", method = RequestMethod.GET)
	public String findIdGET() throws Exception{
		return "member/findid";
	}

	@ResponseBody
	@RequestMapping(value = "/me/cl/fI", method = RequestMethod.POST)
	public void findIdPOST(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "name") String mname,
			@RequestParam(value = "phone") String mphone,
			@RequestParam(value = "email") String mmail) throws Exception{
		System.out.println("????????????findid");
		MemberBean member = new MemberBean();
		member.setMname(mname);
		member.setMphone(mphone);
		member.setMmail(mmail);
		System.out.println(member);
		memberClientService.findId(request, response, member, model, mname, mphone, mmail);
	}

}
