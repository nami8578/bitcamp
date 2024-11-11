package com.javaEdu.myapp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javaEdu.myapp.member.model.MemberVO;
import com.javaEdu.myapp.member.service.IMemberService;

@Controller
public class MemberController {
	
	@Autowired
	IMemberService memberService;
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/member/memberLogin")
	public String  memberLoging() {
		return "member/memberLogin";
	}
	@GetMapping("/member/join")
	public String insertMember() {
		return "member/memberJoin";
	}
	
	@PostMapping("/member/join")
	public String insertMember(MemberVO member) {
		System.out.println("ggg");
		try{
			memberService.insertMember(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/member/memberLogin";
	}
	
	@PostMapping("/member/doubleCheck")
	public String doubleCheck(@RequestParam("id") String id, HttpServletRequest request) {
		int check = memberService.doubleCheck(id);
		request.setAttribute("check", check);
		request.setAttribute("inputName", request.getParameter("name"));
		request.setAttribute("inputId", request.getParameter("id"));
		request.setAttribute("inputPw", request.getParameter("pw"));
		request.setAttribute("inputCfmPw", request.getParameter("cfm-pw"));
		request.setAttribute("inputEmail", request.getParameter("email"));
		request.setAttribute("inputPhoneNum", request.getParameter("phoneNum"));
		request.setAttribute("inputAddress", request.getParameter("address"));
		
		return "member/memberJoin";
	}
	
	@GetMapping("/member/login")
	public String userCheck() {
		return "member/memberLogin";
	}
	
	@PostMapping("/member/login")
	public String userCheck(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int check = memberService.userCheck(id, pw);
		if(check == 1) {
			request.setAttribute("check", check);
			session.setAttribute("name", memberService.getMember(id).getName());
			session.setAttribute("id", memberService.getMember(id).getId());
			session.setAttribute("isLoggedIn", true);
			
			return "/member/memberLoginOk";
		}
		return "member/memberLogin";
	}
	
	@GetMapping("/member/memberSearch")
	public String memberSearch() {
		return "member/memberSearch";
	}
	
	@PostMapping("/member/memberSearch")
	public String memberSearch(HttpServletRequest request) {
		String result = null;
		String formID = request.getParameter("formName");
		
		if(formID.equals("id")) {
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phoneNum");
			result = memberService.searchId(name, phoneNum);
		
		}else if (formID.equals("pw")){
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phoneNum");
			result = memberService.searchPw(id, name, phoneNum);
		}
		
		request.setAttribute("result", result);
		return "/member/memberIDPWResult";
	}
	
	@RequestMapping("/member/memberMain")
	public String memberMain (HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id != null) {
			request.setAttribute("member", memberService.getMember(id));
			return "/member/memberMain";
		}
		return "/member/memberLogin";
	}
	
	@GetMapping("/member/PWCheck")
	public String PWCheck () {
		return "/member/memberPWCheck";
	}
	
	@PostMapping("/member/PWCheck")
	public String PWCheck(HttpServletRequest request, @RequestParam("pw") String pw,
			RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw2 = memberService.getMember(id).getPw();
		int pwCheck;

		if(pw2.equals("")) {
			pwCheck = -1;
			redirectAttributes.addFlashAttribute("pwCheck", pwCheck);
			return "member/memberPWCheck";
		}else if (pw2.equals(pw)) {
			request.setAttribute("member", memberService.getMember(id));
			return "/member/memberEdit";
		}else {
			pwCheck = 0;
			request.setAttribute("pwCheck", pwCheck);
			return "member/memberPWCheck";
		}
	}

	@PostMapping("/member/edit")
	public String updateMember(MemberVO member,
			@RequestParam("newPassword")String newPw,
			@RequestParam("currentPassword")String currentPw,
			@RequestParam("confirmPassword")String confirmPw, HttpServletRequest request) {
		int checkUpdate=0;
		try{

			if (!memberService.getMember(member.getId()).getPw().equals(currentPw)) {
				checkUpdate = -1;
				request.setAttribute("member", member);
				request.setAttribute("checkUpdate", checkUpdate);
				return "/member/memberEdit";

			} else if (!newPw.equals(confirmPw)) {
				checkUpdate = -2;
				request.setAttribute("member", member);
				request.setAttribute("checkUpdate", checkUpdate);
				return "/member/memberEdit";
			} else {
				member.setPw(newPw);
				memberService.updateMember(member);
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("id");
				request.setAttribute("member", memberService.getMember(id));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/member/memberMain";
	}

	@PostMapping("/member/memberDelete")
	public String deleteMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try{
			String id = (String) session.getAttribute("id");
			session.invalidate();
			memberService.deleteMember(memberService.getMember(id));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/member/memberLogin";
	}

	@GetMapping("/member/logout")
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/member/login";
	}
}
