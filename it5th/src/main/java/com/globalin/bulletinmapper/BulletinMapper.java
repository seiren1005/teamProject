package com.globalin.bulletinmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.bulletindomain.BulletinVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;

// required sql for board
public interface BulletinMapper {

	// Create
	public void insert(BulletinVO bvo);
	
	public void insertSelectKey(BulletinVO bvo);
		
	// Read
	public BulletinVO selectOne(int bno);
	
	// list
	public List<BulletinVO> selectAll();
	
	// list with page
	public List<BulletinVO> selectAllWithPage(BulletinCriteria cri);
	
	// Update
	public int update(BulletinVO bvo);
		
	// Delete
	public int delete(int bno);
	
	// Get total count
	public int getTotalCount(BulletinCriteria cri);
	
	// Update reply count
	public void updateReplyCnt(@Param("bno") int bno,
			@Param("amount") int amount);
	
	// update hit
	public int updateHit(int bno);
	
	// update total recommend
	public int updateTotalRec(BulletinVO bvo);
	
	// id 가 회원정보에 있는지 확인
	public String loginCheck(String userid);
		
	
}
