package com.globalin.bulletincontroller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.bulletindomain.BulletinPage;
import com.globalin.bulletindomain.BulletinVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;
import com.globalin.bulletinservice.BulletinService;

@Controller
@RequestMapping("/bulletin/*")
// response for '/board/...' requests  
public class BulletinController {
	
	private Logger log =
		LoggerFactory.getLogger(BulletinController.class);
	// logger for printing errors or execution messages
	
	@Autowired
	private BulletinService service;
	
	
	// /board/list get 요청
	@GetMapping("/bulletinList")
	public void list(BulletinCriteria cri, Model model) {
		
//		log.info("list ");
		
		model.addAttribute("list", service.getList(cri));
		
		// page processing
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		model.addAttribute("pageMaker", new BulletinPage(cri, total));
	
	}
		
	
	// /board/register get request
	@GetMapping("/bulletinRegister")
	public void register() {
		
		// register.jsp 로 이동
		
	}
	
	
	// /board/register post request
	@PostMapping("/bulletinRegister")
	public String register(BulletinVO bvo, BulletinFileVO fvo, 
			RedirectAttributes rttr, HttpServletRequest req) {
		System.out.println("register file: " + fvo);
		
		log.info("register: " + bvo);
		service.register(bvo);
		
		// 첨부파일		
		service.registerFile(fvo);
		
		// diposable storage object
		rttr.addFlashAttribute("result", bvo.getBno());
		
		return "redirect:/bulletin/bulletinList";
		// response 객체가 없어서 직접 사용할 수 없고 return
		// 할 String 에 표시해서 사용
		
	}
	
	
	// /board/get, /board/update get request
	@GetMapping({"/bulletinGet", "/bulletinModify"})
	public void get(@RequestParam("bno") int bno,
			BulletinCriteria cri, Model model) {
		// bno 가 전달받는 파라미터임을 강조
		
		log.info("Get or update: " + bno);
		log.info("cri: " + cri);
		
		// 게시글 정보 전달
		BulletinVO bvo = service.get(bno);
		model.addAttribute("board", bvo);
		
		// 페이지 정보 전달
		model.addAttribute("cri", cri);
		
	}
	
	
	// /board/update post request
	@PostMapping("/bulletinUpdate")
	public String modify(BulletinVO bvo, BulletinCriteria cri, RedirectAttributes rttr) {
		
		log.info("update: " + bvo);
		
		if(service.modify(bvo) == true) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		
		// 페이지 정보 전달
		rttr.addAttribute("cri", cri);
		
		return "redirect:/bulletin/bulletinList";
		
	}
	
	
	// /board/delete post request
	@PostMapping("/bulletinDelete")
	public String remove(@RequestParam("bno") int bno, BulletinCriteria cri,
			RedirectAttributes rttr) {
		
		log.info("Delete: " + bno);
		
		if(service.remove(bno)) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		
		// 페이지, 검색 정보 전달
		rttr.addAttribute("cri", cri);
		
		return "redirect:/bulletin/bulletinList";
		
	}
	
	
}
