package com.will.ice.workrecord.controller;

import java.text.ParseException; 
import java.text.SimpleDateFormat; 
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.mypage.model.MypageService;
import com.will.ice.mypage.model.MypageVO;
import com.will.ice.workrecord.model.WorkRecordService;
import com.will.ice.workrecord.model.WorkRecordVO;

@Controller
@RequestMapping("/workRecord")
public class WorkRecordController {
	private static final Logger logger
		= LoggerFactory.getLogger(WorkRecordController.class);
	private SimpleDateFormat hm = new SimpleDateFormat("HH:mm");
	private SimpleDateFormat h9 = new SimpleDateFormat("09:00");
	private SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat ym = new SimpleDateFormat("yyyy-MM");
	
	@Autowired WorkRecordService workService;
	@Autowired MypageService mypage;
	
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.GET)		
	public String workRecord_get(HttpServletRequest request,Model model) {
		//사원번호,이름 셋팅
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String memNo = (String) session.getAttribute("identNum");
		
		WorkRecordVO vo = workService.selectToday(memNo);
		logger.info("workRecord 보여주기 vo={},userName={}",vo,userName);
		Date d = new Date();
		String date = ymd.format(d);
		
		logger.info("date={}"+date);
		
		model.addAttribute("date",date);
		model.addAttribute("vo",vo);
		model.addAttribute("userName",userName);
		
		return "workRecord/workRecord";
	}
	
	
	//출근
	@RequestMapping("/start.do")
	public String start(@ModelAttribute WorkRecordVO Svo,HttpServletRequest request,
			Model model) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		Svo.setMemNo(memNo);
		logger.info("출근!! , 파라미터 memNo={},Svo={}"+Svo,memNo);
		
		//출근
		//현재 시간으로 출근시간 셋팅
		Date day = new Date();
		String day_format = hm.format(day);
		Svo.setCmpIn(day_format); 
		
		//9시 셋팅
		Date nine = new Date();
		String nine_format = h9.format(nine);
		
		//CmpRegdate 현재날짜로 셋팅
		String regdate = ymd.format(day);
		Svo.setCmpRegdate(regdate);
		logger.info("regdate={}"+Svo.getCmpRegdate());
		
		// cmp_month 셋팅
		String date = ym.format(day);
		Svo.setCmpMonth(date);
		
		//date 변환
		try {
			day = hm.parse(day_format); 
			nine = h9.parse(nine_format); //9시 셋팅
		} catch (ParseException e1) {
			e1.printStackTrace();
		} 
		
		
		if(nine.after(day) == true){ // nine이 (day)보다 이후 일때 true : 9시 전에 출근!
			Svo.setCmpStatus("9"); // nine > day 출근
		}else {
			Svo.setCmpStatus("0"); // nine < day 지각
		}
		logger.info("status={}"+Svo.getCmpStatus());
		
		
		int cnt = workService.insertWork_status(Svo);
		logger.info("출근 결과 cnt={}"+cnt);
		
		model.addAttribute("Svo",Svo);
		model.addAttribute("day",day);
		
		return "redirect:/workRecord/workRecord.do";
	}
	
	//퇴근
	@RequestMapping("/end.do")
	public String end(@ModelAttribute WorkRecordVO Evo,HttpServletRequest request,
			Model model) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		Evo.setMemNo(memNo);
		logger.info("퇴근!! , 파라미터 memNo={}, Evo={}", memNo, Evo);
		
		Evo = workService.selectToday(memNo);
		logger.info("오늘날짜 조회 , Evo={}"+Evo);
		
		//현재 시간으로 퇴근시간 셋팅
		Date out = new Date(); 
		String Edate = hm.format(out); Evo.setCmpOut(Edate);
		logger.info("Evo.getCmpOut={}",Evo.getCmpOut());
		//string 변수 담기
		String []outArr = Evo.getCmpOut().split(":");
		String out1 = outArr[0]; String out2 = outArr[1]; String out3 = out1+out2;
		//int 형 변환
		int outdate = Integer.parseInt(out3);
		logger.info("outdate={}",outdate);

		
		//출근시간
		String []inArr = Evo.getCmpIn().split(":");
		String in1 = inArr[0]; String in2 = inArr[1]; String in3 = in1+in2;
		//int 형 변환
		int indate = Integer.parseInt(in3);
		logger.info("indate={}",indate);
		

		if(Evo.getCmpStatus().equals("0") && ((outdate - indate)-100) == 800) {
			Evo.setCmpStatus("지각");
		}else if(Evo.getCmpStatus().equals("0") && ((outdate - indate)-100) < 800
				|| Evo.getCmpStatus().equals("9") && ((outdate - indate)-100) < 800){ //점심시간 -100
			Evo.setCmpStatus("반차");
		}else if(Evo.getCmpStatus().equals("9") && ((outdate - indate)-100) > 800){ //점심시간 -100
			Evo.setCmpStatus("초과근무");
		}else if(Evo.getCmpStatus().equals("9") && ((outdate - indate)-100) == 800){
			Evo.setCmpStatus("퇴근");
		}
		
		logger.info("퇴근 후 vo={},Evo.getCmpStatus={}",Evo,Evo.getCmpStatus());

		int cnt = workService.updateWork(Evo);
		logger.info("퇴근 결과 cnt={}",cnt);
		
		
		model.addAttribute("Sdate",Evo.getCmpIn());
		model.addAttribute("Edate",Edate);
		model.addAttribute("Evo",Evo);
		
		return "redirect:/workRecord/workRecord.do";
	}
	
	//조회
	@RequestMapping("/searchWork.do")
	@ResponseBody
	public List<WorkRecordVO> searchWork(@RequestParam String year,@RequestParam String month,
			HttpServletRequest request) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO searchVo = new WorkRecordVO();
		searchVo.setMemNo(memNo);
		
		searchVo = workService.selectToday(memNo);
		logger.info("searchVo={}",searchVo);
		logger.info("year={},month={}",year,month);
		
		String selectDate = year+"-"+month;
		
		//selectDate Date로 변경
		Date d = new Date();
		try {
			d = ym.parse(selectDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// cmp_month 셋팅
		String date = ym.format(d);
		searchVo.setCmpMonth(date);
		
		//조회
		List<WorkRecordVO>Slist = workService.selectWorkList(searchVo);
		for (int i = 0; i < Slist.size(); i++) {
			searchVo = Slist.get(i);
		}
		logger.info("Slist.size={}"+Slist);
		
		return Slist;
	}
	
	
	@RequestMapping(value = "/workChart.do",method = RequestMethod.GET)
	public void workChart(HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		String userName = (String)session.getAttribute("userName");
		logger.info("근태 통계 차트 보여주기 memNo={},userName={}",memNo,userName);
		
		model.addAttribute("memNo",memNo); model.addAttribute("userName",userName);
	}
	
	@RequestMapping(value = "/workChart.do",method = RequestMethod.POST)
	public void SelectMonthChart(@RequestParam String year,@RequestParam String month,HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO vo = new WorkRecordVO(); vo.setMemNo(memNo);
		//월별 조회
		if(year != null && !year.isEmpty() || month != null && !month.isEmpty()) {
			String ym = year+"-"+month; vo.setCmpMonth(ym);

			
			vo.setCmpStatus("지각"); int under = workService.selectMonthCount(vo);
			vo.setCmpStatus("반차"); int half = workService.selectMonthCount(vo);
			vo.setCmpStatus("초과근무"); int over = workService.selectMonthCount(vo);
			vo.setCmpStatus("퇴근"); int avg = workService.selectMonthCount(vo);
			
			model.addAttribute("under",under); model.addAttribute("half",half);
			model.addAttribute("over",over); model.addAttribute("avg",avg);
			model.addAttribute("year",year); model.addAttribute("month",month);
		}
		
	}
	
	@RequestMapping("/chartView.do")
	public String chartView(HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO vo = new WorkRecordVO(); vo.setMemNo(memNo);
		
		Date d = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String date = sdf.format(d);
		logger.info("date={}",date);
		MypageVO Mvo = mypage.selectEmployee(memNo);
		int pos = Mvo.getPosCode();
		
		vo.setCmpMonth(date);
		//월별 조회
		vo.setCmpStatus("지각"); int under = workService.selectMonthCount(vo);
		vo.setCmpStatus("반차"); int half = workService.selectMonthCount(vo);
		vo.setCmpStatus("초과근무"); int over = workService.selectMonthCount(vo);
		vo.setCmpStatus("퇴근"); int avg = workService.selectMonthCount(vo);
			
		logger.info("under={}",under);
		logger.info("half={}",half);
		logger.info("over={}",over);
		logger.info("avg={}",avg);
		
		model.addAttribute("under",under); model.addAttribute("half",half);
		model.addAttribute("over",over); model.addAttribute("avg",avg);
			
		if(pos == 999) {
			return "main/main_admin";
		}
		if(pos == 919) {
			return "main/main_account";
		}
		if(pos == 930) {
			return "main/main_restaurant";
		}
			
		return "main/main_user";

	}
	
}
