package com.globalin.bulletincontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
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
		int totalRec = bService.get(bno).getTotalRec();
		System.out.println("board totalRec test");
		System.out.println(totalRec);
		
		String result = "";
				
		if (lvo.getIsLike().equals("true")) {
			
			log.info("I like it.");
			
			if(service.clickGood(bno) == true) {
				
				good = service.countGood(bno);				
				result = "좋아요!";
				totalRec = totalRec + 1;
				
			}
			 			
		} else {
			
			log.info("i don't like it.");

			if(service.clickBad(bno) == true) {
				
				bad = service.countBad(bno);				
				result = "싫어요!";
				totalRec = totalRec - 1;
						
			}
			
		}
		
		BulletinVO bvo = new BulletinVO();
		bvo.setBno(bno);
		bvo.setTotalRec(totalRec);
		
		bService.updateTotalRec(bvo);
		
		lvo.setTotalRec(good-bad);
		
		model.addAttribute("recommendSec", lvo);
//		System.out.println("recommendSec test");
//		System.out.println(lvo);
		
		return result;
		// restcontroller 의 경우 페이지 이동을 하지 않으므로 데이터를
		// 전달하고 싶으면 return 으로 전달하면 됨
	}
	

}
