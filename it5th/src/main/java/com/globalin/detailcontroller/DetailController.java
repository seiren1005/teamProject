package com.globalin.detailcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalin.diaryservice.DiaryBoardService;
import com.globalin.teamproject.mainpageController;

@Controller
@RequestMapping("/detail/*")
public class DetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(mainpageController.class);
	
	@Autowired
	private DiaryBoardService dservice;
	
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/detail-TCP")
	public void TCP() {
	}
	
	@GetMapping("/detail-Tohoho")
	public void Tohoho() {
	}
	
	@GetMapping("/detail-LifeCoding")
	public void life() {
	}
	
	@RequestMapping(value="/diaryboard/list")
	public String list() {
	return "/diaryBoard/list";
	}
	
	@GetMapping("/check")
	public void calendar() {
	}
		
	
	
}
