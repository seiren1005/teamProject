package com.globalin.bulletincontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.bulletindomain.BulletinVO;
import com.globalin.bulletindomain.LikeVO;
import com.globalin.bulletinservice.BulletinService;
import com.globalin.bulletinservice.LikeService;

@RestController
public class CommonRestController {
	
	private Logger log =
			LoggerFactory.getLogger(BulletinController.class);
	
	@Autowired
	private LikeService service;
	
	@Autowired
	private BulletinService bService;
	
	
	@GetMapping(value="/bulletin/bulletinRecommend", 
			produces="text/plain; charset=UTF-8")
	public String isLike(LikeVO lvo, Model model) {
	
		int good = 0;
		int bad = 0;
		int bno = lvo.getBno();
		String userid = lvo.getUserid();
		System.out.println("userid: " + userid);
		int totalRec = bService.get(bno).getTotalRec();
		System.out.println("board totalRec test");
		System.out.println(totalRec);
		
		String result = "";
				
		if (lvo.getIsLike().equals("true")) {
			// 좋아요 클릭
			
			log.info("I like it.");
			
			if (service.goodChecker(lvo)) {
				// 이미 좋아요를 누른 적이 있으면					
				
				result = "You clicked good already.";
				
			} else {
				// 좋아요를 누른 적이 없으면서
				
				if(service.badChecker(lvo)) {
					// 좋아요를 누른 적이 없지만 싫어요는 누른 적이 있으면
					
					if(service.deleteBad(lvo)) {
						// 싫어요를 삭제
						
						good = service.countGood(bno);
						result = "싫어요를 취소했습니다.";
						totalRec = totalRec + 1;						
						
					}					
					
				} else {
					
					
					// 싫어요도 누른 적이 없으면 good + 1
					if(service.clickGood(lvo) == true) {
						
						good = service.countGood(bno);			
						result = "좋아요!";
						totalRec = totalRec + 1;
					
					}
					
				}
				
			}
			
			 			
		} else {
			// 싫어요 클릭
			
			log.info("i don't like it.");
			
			if (service.badChecker(lvo)) {
				// 이미 싫어요를 누른 적이 있으면							
				result = "You clicked bad already.";
				
			} else {
				// 싫어요를 누른 적이 없으면서
				
				if(service.goodChecker(lvo)) {
					// 싫어요를 누른 적이 없지만 좋아요는 누른 적이 있으면
					
					if(service.deleteGood(lvo)) {
						// 좋아요를 삭제
						
						bad = service.countBad(bno);
						result = "좋아요를 취소했습니다.";
						totalRec = totalRec - 1;						
						
					}					
					
				} else {					
					// 좋아요도 누른 적이 없으면 bad + 1
					if(service.clickBad(lvo) == true) {
						
						bad = service.countBad(bno);			
						result = "싫어요";
						totalRec = totalRec - 1;
					
					}
					
				}
				
			}
			
		}
		
		BulletinVO bvo = new BulletinVO();
		bvo.setBno(bno);
		bvo.setTotalRec(totalRec);
		
		bService.updateTotalRec(bvo);
		
		lvo.setTotalRec(totalRec);
		
		model.addAttribute("recommendSec", lvo);
//		System.out.println("recommendSec test");
//		System.out.println(lvo);
		
		return result;
		// restcontroller 의 경우 페이지 이동을 하지 않으므로 데이터를
		// 전달하고 싶으면 return 으로 전달하면 됨
	}
	
	
	
	// login check
	@GetMapping(value="/loginCheck/{userid}", 
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public String loginCheck(@PathVariable("userid") String userid) {
		
		System.out.println("userid");
		System.out.println(userid);
		
		Boolean idcheck = bService.loginCheck(userid);
				
		if(idcheck == true) {
			
			return "true";
			
		}
		
		return "false";
		
	}
	

}
