package com.globalin.bulletincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detail/*")
public class DetailController {
	
	
	@GetMapping("/main")
	public void register() {
		// main.jsp 로 이동
	}
}
