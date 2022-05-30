package com.globalin.bulletinservice;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.bulletindomain.BulletinVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;
import com.globalin.bulletinmapper.BulletinMapper;

@Service
public class BulletinServiceImpl implements BulletinService {

	// logger for saving status
	private Logger log = 
			LoggerFactory.getLogger(BulletinServiceImpl.class);
	
	@Autowired
	private BulletinMapper mapper;

	
	@Override
	public void register(BulletinVO bvo) {
		// TODO Auto-generated method stub
		
		log.info("Register board: " + bvo);
		mapper.insertSelectKey(bvo);
		
	}

	@Override
	public BulletinVO get(int bno) {
		// TODO Auto-generated method stub
		
		log.info(""+bno);
		
		BulletinVO bvo = mapper.selectOne(bno);
		
		return bvo;
		
	}
	

	@Override
	public List<BulletinVO> getList() {
		// TODO Auto-generated method stub
		
		log.info("View All contents.");
		
		return mapper.selectAll();
		
	}

	
	@Override
	public List<BulletinVO> getList(BulletinCriteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Board Page Inquiry: " + cri);
		
		return mapper.selectAllWithPage(cri);
		
	}
		

	@Override
	public boolean modify(BulletinVO bvo) {
		// TODO Auto-generated method stub
		
		log.info("Update successfully!");
		
		return mapper.update(bvo) == 1;
		// mapper.update() 결과는 int 0 or 1
		// update 가 성공하면 1 == 1 -> true;
		// 실패하면 0 == 1 -> false
		
	}

	
	@Override
	public boolean remove(int bno) {
		// TODO Auto-generated method stub
		
		log.info("Delete completely.");
		
		return mapper.delete(bno) == 1;
		
	}
	

	@Override
	public int getTotal(BulletinCriteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Get total count of board");
		
		return mapper.getTotalCount(cri);
		
	}
	
	
}
