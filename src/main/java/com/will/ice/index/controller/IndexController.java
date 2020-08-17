package com.will.ice.index.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;	

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/index.do")
	public void index() {
		logger.info("index");
	}
	
	@RequestMapping("/main.do")
	public void main() {
		logger.info("main");
	}
}
