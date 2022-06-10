package com.globalin.bulletincontroller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.bulletindomain.BulletinPage;
import com.globalin.bulletindomain.BulletinVO;
import com.globalin.bulletindomain.LikeVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;
import com.globalin.bulletinservice.BulletinService;
import com.globalin.bulletinservice.BulletinUploadService;
import com.globalin.bulletinservice.LikeService;
import com.globalin.model.dto.MemberVO;

@Controller
@RequestMapping("/bulletin/*")
// response for '/board/...' requests  
public class BulletinController {
	
	private Logger log =
		LoggerFactory.getLogger(BulletinController.class);
	// logger for printing errors or execution messages
	
	@Autowired
	private BulletinService service;
	
	@Autowired
	private BulletinUploadService uService;
	
	@Autowired
	private LikeService lService;
	
	
	// /board/list get 요청
	@GetMapping("/bulletinList")
	public void list(BulletinCriteria cri, Model model, HttpServletRequest req) {
		
//		log.info("list ");
		System.out.println(cri);
		
		model.addAttribute("list", service.getList(cri));
		
		// page processing
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new BulletinPage(cri, total));
					
	}
		
	
	// /board/register get request
	@GetMapping("/bulletinRegister")
	public void register() {
		
		
	}
	
	
	// /board/register post request
	@PostMapping("/bulletinRegister")
	public String register(BulletinVO bvo, 
			RedirectAttributes rttr, HttpServletRequest req) {
		
		log.info("register: " + bvo);
		
		if(req.getParameterValues("fileName") != null) {
			
			String[] nameArr = req.getParameterValues("fileName");
			String[] uuidArr = req.getParameterValues("uuid");
			String[] checkArr = req.getParameterValues("imageChecker");
						
			BulletinFileVO fvo = new BulletinFileVO();
			
			fvo.setFileName(String.join("/", nameArr));
			fvo.setUuid(String.join("/", uuidArr));
			fvo.setImageChecker(String.join("/", checkArr));
			log.info("register: " + fvo);
			
			service.register(bvo);
			
			// diposable storage object
			rttr.addFlashAttribute("result", bvo.getBno());
			
			fvo.setBno(bvo.getBno());
			
			uService.insert(fvo);
			
		} else {
			
			service.register(bvo);
			
			// diposable storage object
			rttr.addFlashAttribute("result", bvo.getBno());

		}	
		
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
		
		// update hit
		service.updateHit(bno);
		
		// 게시글 정보 전달
		BulletinVO bvo = service.get(bno);
		model.addAttribute("board", bvo);
		
		// 페이지 정보 전달
		model.addAttribute("cri", cri);
		
		// 첨부파일 정보 전달			
		BulletinFileVO fvo = uService.get(bno);
		model.addAttribute("fvo", fvo);
		
		System.out.println("fvo checker1");
		System.out.println(fvo);
		
		LikeVO lvo = new LikeVO();	
		
		if(lService.nullCheck(bno) == true) {
			
			int good = lService.countGood(bno);
			int bad = lService.countBad(bno);
			
			lvo.setTotalRec(good-bad);
			
		} else {
			
			lvo.setTotalRec(0);
			
		}
				
		model.addAttribute("recommend", lvo);
		
	}
	
	
	// /board/update post request
	@PostMapping("/bulletinModify")
	public String modify(BulletinVO bvo, BulletinCriteria cri, BulletinFileVO fvo,
			RedirectAttributes rttr, HttpServletRequest req) {
		
		log.info("update: " + bvo);

		log.info("==================================");
		log.info("fvo: " + fvo);
		
		if(service.modify(bvo) == true) {
			
			rttr.addFlashAttribute("result", "success");
			
			if(uService.get(bvo.getBno()) == null) {
				
				if(fvo.getFileName() != null) {
					
					String[] nameArr = req.getParameterValues("fileName");
					String[] uuidArr = req.getParameterValues("uuid");
					String[] checkArr = req.getParameterValues("imageChecker");
										
					fvo.setFileName(String.join("/", nameArr));
					fvo.setUuid(String.join("/", uuidArr));
					fvo.setImageChecker(String.join("/", checkArr));
					log.info("modify: " + fvo);
				
					System.out.println("modify , check");
					System.out.println(fvo);
					
					// diposable storage object
					rttr.addFlashAttribute("result", bvo.getBno());
					
					fvo.setBno(bvo.getBno());
					
					uService.insert(fvo);					
					
				}
											
			} else {
				
				String[] nameArr = req.getParameterValues("fileName");
				String[] uuidArr = req.getParameterValues("uuid");
				String[] checkArr = req.getParameterValues("imageChecker");
									
				fvo.setFileName(String.join("/", nameArr));
				fvo.setUuid(String.join("/", uuidArr));
				fvo.setImageChecker(String.join("/", checkArr));
				log.info("modify: " + fvo);
			
				System.out.println("modify , check");
				System.out.println(fvo);
				
				// diposable storage object
				rttr.addFlashAttribute("result", bvo.getBno());				
				fvo.setBno(bvo.getBno());
				
				uService.update(fvo);	
				
			}			
			
		}
		
		// 페이지 정보 전달
		rttr.addFlashAttribute("cri", cri);
				
		return "redirect:/bulletin/bulletinGet?bno=" + bvo.getBno();
		
	}
	
	
	// /board/delete post request
	@PostMapping("/bulletinDelete")
	public String remove(@RequestParam("bno") int bno, BulletinCriteria cri,
			RedirectAttributes rttr) {
		
		log.info("Delete: " + bno);
						
		if(service.remove(bno)) {
			
			rttr.addFlashAttribute("result", "success");
			
			uService.delete(bno);
			
		}		
		
		// 페이지, 검색 정보 전달
		rttr.addFlashAttribute("cri", cri);
		
		return "redirect:/bulletin/bulletinList";
		
	}

	
	// move to login page
	@GetMapping("/bulletin/login")
	public String login() {
		
		return "redirect:/member/login.do";
		
	}
	
}
