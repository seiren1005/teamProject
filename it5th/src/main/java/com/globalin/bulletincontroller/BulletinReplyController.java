package com.globalin.bulletincontroller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinReplyPage;
import com.globalin.bulletindomain.BulletinReplyVO;
import com.globalin.bulletinservice.BulletinReplyService;

@RestController
// 주의점
// 외부에서 서버 호출시 데이터의 포맷, 서버에서 보여주는 데이터의
// 	포맷을 명확하게 알 수 있도록 함
// 정상적으로 처리되었는지 HTTP STATUS 코드 리턴해서 알려줌
@RequestMapping("/replies/")
public class BulletinReplyController {
	
	private Logger log = 
			LoggerFactory.getLogger(BulletinUploadController.class);
	
	@Autowired
	private BulletinReplyService service;
	
	
	// /replies/new post request
	@PostMapping(value="/new", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
		// consumes browser -> server
		// produces server -> browser
	public ResponseEntity<String> register(@RequestBody BulletinReplyVO rvo) {
		
		rvo.setAdoption("null");
		int result = service.register(rvo);
						
		return result == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	// 조회
	// /replies/selectOne/rno
	@GetMapping(value="/selectOne/{rno}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<BulletinReplyVO> selectOne(@PathVariable("rno") int rno) {
		
		System.out.println("================================================");
		System.out.println("selectOne test");
		System.out.println(rno);
		System.out.println(service.selectOne(rno));
		System.out.println("================================================");
		
		return new ResponseEntity<>(
				service.selectOne(rno), HttpStatus.OK);
	}
	
	
	// 삭제
	// /replies/rno
	@DeleteMapping(value="/{rno}", 
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody BulletinReplyVO rvo,
			@PathVariable("rno") int rno) {
		// @PathVariable 과 @RequestBody 가 같이 쓰이는 요청은 put, delete
		
		return service.delete(rno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 수정
	// /replies/rno
	@PutMapping(value="/{rno}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@PathVariable("rno") int rno, @RequestBody BulletinReplyVO rvo) {
		
		rvo.setRno(rno);
		
		System.out.println("rvo: " + rvo);
		
		return service.update(rvo) == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	// reply list with paging
	// /replies/rno/page get request
	@GetMapping(value="/pages/{bno}/{page}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<BulletinReplyPage> getList(
			@PathVariable("bno") int bno, 
			@PathVariable("page") int page) {
		// 주소에서 parameter 가져오려면 @PathVariable
		
//		System.out.println("is getList working?");
//		System.out.println("controller bno: " + bno);
		
		BulletinCriteria cri = new BulletinCriteria();
		cri.setPageNum(page);
		cri.setAmount(10);
						
//		System.out.println("controller return: " + service.getReplyListWithPage(cri, bno));
				
		return new ResponseEntity<>(
				service.getReplyListWithPage(cri, bno), HttpStatus.OK);
		
	}
	
	
	// 대댓글 등록
	@PostMapping(value="/toReplyRegister", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> toReply(@RequestBody BulletinReplyVO rvo) {
		// post 요청에서 parameter 가져오려면 @RequestBody
		
		System.out.println("==============================");
		System.out.println("rvo check");
		System.out.println(rvo);
				
		BulletinReplyVO rtemp = service.selectOne(rvo.getRno());
		System.out.println(rtemp);
		System.out.println(rvo.getRno());
		
		// 댓글에 하위 댓글이 달릴 때 하위로 차수가 늘어날수록 1 씩 deep 증가
		rvo.setDeep(rtemp.getDeep() + 1);
		
		// 댓글에 대댓글이 몇개 있는지 확인하기 위해서 대댓글이 달릴 경우 1 씩 상위 댓글의 gorder 증가
		int gorder = rtemp.getGorder() + 1;
		rtemp.setGorder(gorder);
		int gresult = service.gorderIncrement(rtemp);
		
		int result = service.insertToReply(rvo);
		
		// result, gresult 둘 다 1 이면 true, 아니면 false
		return result == 1 || gresult == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 대댓글 가져오기
	@GetMapping(value="/getToReply/{rno}", 
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BulletinReplyVO>> getList(
			@PathVariable("rno") int rno) {
		
		System.out.println("rno test");
		System.out.println(rno);
		
		return new ResponseEntity<>(
				service.selectSubGroup(rno), HttpStatus.OK);
		
	}

}
