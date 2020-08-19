package com.will.ice.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;

@Controller
@RequestMapping("/log")
public class LoginController {
	private static final Logger logger
		= LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberService memService;

	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public void login_get() {
		logger.info("로그인 페이지");
	}

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_post(@RequestParam(required = false) String identNum,
			@RequestParam(required = false) String pwd,
			@RequestParam(required = false) String rememCheck,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("로그인 처리 파라미터 identNum={}, pwd={}", identNum, pwd);
		logger.info("rememCheck={}", rememCheck);

		int result=memService.logCheck(identNum, pwd);
		logger.info("로그인 처리 결과, result={}", result);

		String msg="로그인 처리 실패",url="/log/login.do";
		if(result==MemberService.LOGIN_OK) {
			//상세정보 조회
			MemberVO memVo=memService.selectMember(identNum);
			logger.info("회원정보 조회 결과vo={}", memVo);

			//session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("identNum", identNum);
			session.setAttribute("posCode", memVo.getPosCode());
			session.setAttribute("userName", memVo.getName());
			session.setAttribute("memImg", memVo.getProfileURL());

			//쿠키에 저장
			if(rememCheck!=null) {  //아이디 저장에 체크한 경우
				Cookie ck = new Cookie("ck_identNum", identNum);
				ck.setMaxAge(100*24*60*60); //100일
				ck.setPath("/");
				response.addCookie(ck);
			}else {
				Cookie ck = new Cookie("ck_identNum", identNum);
				ck.setMaxAge(0); //기존 쿠키 삭제
				ck.setPath("/");
				response.addCookie(ck);
			}

			msg= memVo.getName()+" "+memVo.getPosName() + "님 로그인되었습니다.";
			System.out.print(memVo.getPosCode());
			if(memVo.getPosCode().equals("999")){ //관리자
				msg= memVo.getName()+" "+memVo.getPosName() + "님 로그인되었습니다.";
				url = "/main/main_admin.do";			
				
			}else {		
				if(pwd.equals(memVo.getSsn1())){
					msg= memVo.getName()+"님 처음 오셨군요! 비밀번호 설정페이지로 이동합니다";
					url = "/member/memPwd.do";
				}else {
					msg= memVo.getName()+" "+memVo.getPosName() + "님 로그인되었습니다.";
					url = "/main/main_user.do";
		
				}
				
			}
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.ID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";
		}


		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "log/login";

	}
	

	@RequestMapping(value="/login_admin.do", method = RequestMethod.GET)
	public void login_admin_get() {
		logger.info("관리자 로그인 페이지");
	}
	
	@RequestMapping(value="/login_admin.do", method = RequestMethod.POST)
	public String login_admin_post(@RequestParam(required = false) String identNum,
				@RequestParam(required = false) String pwd,
				@RequestParam(required = false) String rememCheck,
				HttpServletRequest request, HttpServletResponse response,
				Model model) {
			logger.info("로그인 처리 파라미터 identNum={}, pwd={}", identNum, pwd);
			logger.info("rememCheck={}", rememCheck);

			int result=memService.logCheck_admin(identNum, pwd);
			logger.info("로그인 처리 결과, result={}", result);

			String msg="로그인 처리 실패",url="/log/login.do";
			if(result==MemberService.LOGIN_OK) {
				//상세정보 조회
				MemberVO memVo=memService.selectMember(identNum);
				logger.info("회원정보 조회 결과vo={}", memVo);

				//session에 저장
				HttpSession session=request.getSession();
				session.setAttribute("identNum", identNum);
				session.setAttribute("posCode", memVo.getPosCode());
				session.setAttribute("userName", memVo.getName());
				session.setAttribute("memImg", memVo.getOriginalFileName());

				//쿠키에 저장
				if(rememCheck!=null) {  //아이디 저장에 체크한 경우
					Cookie ck = new Cookie("ck_identNum_ad", identNum);
					ck.setMaxAge(100*24*60*60); //100일
					ck.setPath("/");
					response.addCookie(ck);
				}else {
					Cookie ck = new Cookie("ck_identNum_ad", identNum);
					ck.setMaxAge(0); //기존 쿠키 삭제
					ck.setPath("/");
					response.addCookie(ck);
				}

				msg= memVo.getName()+" "+memVo.getPosName() + "님 로그인되었습니다.";
				if(memVo.getPosCode().equals("999")) {	//관리자
					url = "/main/main_admin.do";

				}
			}else if(result==MemberService.PWD_DISAGREE){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==MemberService.ID_NONE) {
				msg="해당 아이디가 존재하지 않습니다.";
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
}
