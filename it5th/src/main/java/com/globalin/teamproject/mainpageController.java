package com.globalin.teamproject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class mainpageController {
	
	private static final Logger logger = LoggerFactory.getLogger(mainpageController.class);
	
	//메인 페이지 이동
		@RequestMapping(value = "/mainpage", method = RequestMethod.GET)
		public void mainPageGET() {
			
			logger.info("메인 페이지 진입");
		
		}
		
		@RequestMapping(value = "/infopage", method = RequestMethod.GET)
		public void infopageGET() {
			logger.info("인포페이지 진입");
		}
	}
