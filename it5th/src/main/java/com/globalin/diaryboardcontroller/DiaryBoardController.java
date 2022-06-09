package com.globalin.diaryboardcontroller;

import com.globalin.diarydomain.diaryCriteria;
import com.globalin.diarydomain.diaryPage;
import com.globalin.diarydomain.diaryVO;
import com.globalin.diaryservice.DiaryBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/diaryBoard/*")
public class DiaryBoardController {
	
	private static final Logger log = LoggerFactory.getLogger(DiaryBoardController.class);

	@Autowired
	private DiaryBoardService dservice;
	
/*	@GetMapping("/list")
    // => @RequestMapping(value="list", method=RequestMethod.GET)
    public void diaryboardListGET(Model model) {
        
        log.info("게시판 목록 페이지 진입");
        
        model.addAttribute("list", dservice.getList());
    }
    */
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public void boardListGET(Model model, diaryCriteria cri) {
        
    	log.info("boardListGET");
        
        model.addAttribute("list", dservice.getListPaging(cri));
        
        int total = dservice.getTotal(cri);
        
        diaryPage pageMake = new diaryPage(cri, total);
        System.out.println(pageMake.toString());
        model.addAttribute("pageMaker", pageMake);
    }
 

	
	
	
	
    @GetMapping("/enroll")
    // => @RequestMapping(value="enroll", method=RequestMethod.GET)
    public void boardEnrollGET() {
        
        log.info("게시판 등록 페이지 진입");
        
    }
    
    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String boardEnrollPOST(diaryVO diaryboard, RedirectAttributes rttr) {
        
        log.info("diaryVO : " + diaryboard);
        
        dservice.enroll(diaryboard);
        
        rttr.addFlashAttribute("result", "enroll success");
        
        return "redirect:/diaryBoard/list";
    }

    /* 게시판 조회 */
    @GetMapping("/get")
    public void boardGetPageGET(int diarybno, diaryCriteria cri, Model model) {
        model.addAttribute("pageInfo", dservice.getPage(diarybno));
        model.addAttribute("cri" , cri);
    }
    /* @GetMapping("/get")
    public void boardGetPageGET(int diarybno, Model model) {
 
        model.addAttribute("pageInfo", dservice.getPage(diarybno));
        
    } */
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void boardModifyGET(int diarybno, diaryCriteria cri, Model model) {
        
        model.addAttribute("pageInfo", dservice.getPage(diarybno));
        
        model.addAttribute("cri" , cri);
        
    }
    /* 페이지 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(diaryVO diaryboard, RedirectAttributes rttr) {
        
        dservice.modify(diaryboard);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/diaryBoard/list";
        
    }
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String boardDeletePOST(int diarybno, RedirectAttributes rttr) {
        
        dservice.delete(diarybno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/diaryBoard/list";
    }

}
