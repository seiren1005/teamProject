package com.globalin.bulletinservice;

import java.util.List;

import com.globalin.bulletindomain.BulletinVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;

public interface BulletinService {
	
	// register a content
	public void register(BulletinVO bvo);
	
	// select one content
	public BulletinVO get(int bno);
	
	// Select All contents
	public List<BulletinVO> getList();
	
	// select all contents with page processing
	public List<BulletinVO> getList(BulletinCriteria cri);
	
	// modify a content
	public boolean modify(BulletinVO bvo);
	
	// delete a content
	public boolean remove(int bno);
	
	// Get total count at board
	public int getTotal(BulletinCriteria cri);
	
	// insert file info
	public void registerFile(BulletinFileVO fvo);
	

}
