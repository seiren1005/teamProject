package com.globalin.bulletinservice;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinReplyPage;
import com.globalin.bulletindomain.BulletinReplyVO;
import com.globalin.bulletinmapper.BulletinMapper;
import com.globalin.bulletinmapper.BulletinReplyMapper;

@Service
public class BulletinReplyServiceImpl implements BulletinReplyService {

	@Autowired
	private BulletinReplyMapper rMapper;
	
	@Autowired
	private BulletinMapper bMapper;
	
	private Logger log = 
			LoggerFactory.getLogger(BulletinReplyServiceImpl.class);
	
	
	@Override
	public int register(BulletinReplyVO rvo) {
		// TODO Auto-generated method stub
		
		log.info("Write: " + rvo);
		
		int result = rMapper.insert(rvo);
		
//		System.out.println("reply register retunr: " + result);
		
		if (result == 1) {
			
			// bno 의 댓글수 +1
			bMapper.updateReplyCnt(rvo.getBno(), 1);
			
		}
		
		return result;
		
	}
	

	@Override
	public BulletinReplyVO selectOne(int rno) {
		// TODO Auto-generated method stub
		
		log.info("View a reply: " + rno);
		
		return rMapper.selectOne(rno);
		
	}

	
	@Override
	public int update(BulletinReplyVO rvo) {
		// TODO Auto-generated method stub
		
		log.info("Update: " + rvo);
		
		return rMapper.update(rvo);
		
	}

	
	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		
		log.info("Delete: " + rno);
		
		BulletinReplyVO rvo = rMapper.selectOne(rno);
		
		int result = rMapper.delete(rno);
		
		if(result == 1) {
			
			// 삭제 시 해당 bno 의 댓글 수 -1
			bMapper.updateReplyCnt(rvo.getBno(), -1);
			
		}
		
		return result; 
		
	}
	

	@Override
	public List<BulletinReplyVO> getReplyList(BulletinCriteria cri, int bno) {
		// TODO Auto-generated method stub
		
		log.info("Get replies: " + bno);
		
		return rMapper.selectAllWithPaging(cri, bno);
		
	}

	@Override
	public BulletinReplyPage getReplyListWithPage(BulletinCriteria cri, int bno) {
		// TODO Auto-generated method stub
		
		BulletinReplyPage rPage = new BulletinReplyPage();
		
		log.info("cri: " + cri);
		
		rPage.setReplyCnt(rMapper.getCountReplyByBno(bno));
		rPage.setReplyList(rMapper.selectAllWithPaging(cri, bno));
		rPage.setCheckValue(rMapper.checkAdoption(bno));
			
		System.out.println(rPage.getCheckValue());
//		System.out.println(rPage);
		
		return rPage;
		
	}


	// increment of gorder
	@Override
	public int gorderIncrement(BulletinReplyVO rvo) {
		// TODO Auto-generated method stub
		
		if(rMapper.updateGOrder(rvo) == 1) {
			// updateGOrder query 실행 결과가 1 이면 (update 성공하면)
			
			return 1;
			// 1 return
			
		}
		
		return 0;
		// update 실패시 0 return
		
	}


	@Override
	public List<BulletinReplyVO> selectSubGroup(int rno) {
		// TODO Auto-generated method stub
			
		return rMapper.selectSubGroup(rno);
	}


	@Override
	public int insertToReply(BulletinReplyVO rvo) {
		// TODO Auto-generated method stub
		log.info("toReply: " + rvo);
		
		int result = rMapper.insertToReply(rvo);
		
		if (result == 1) {			
			// bno 의 댓글수 +1
			bMapper.updateReplyCnt(rvo.getBno(), 1);
			
		}
		
		return result;
	}


}
