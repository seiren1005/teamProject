package com.globalin.detailcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detail/*")
public class DetailController {
	
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
}
