package com.will.ice.note.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.notice.model.NoticeService;
import com.will.ice.notice.model.NoticeVO;

@Controller
@RequestMapping("/note")
public class NoteController {

	private static final Logger logger 
		= LoggerFactory.getLogger(NoteController.class);
	
	
	@RequestMapping("/write.do")
	public void notice() {
		logger.info("쪽지보내기 실행1");
	}
	
}