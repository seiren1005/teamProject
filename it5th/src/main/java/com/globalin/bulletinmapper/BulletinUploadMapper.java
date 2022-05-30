package com.globalin.bulletinmapper;

import com.globalin.bulletindomain.BulletinFileVO;

public interface BulletinUploadMapper {

	public int insert(BulletinFileVO fvo);
	
	public int update(BulletinFileVO fvo);
	
	public int delete(int bno);
	
	public BulletinFileVO get(int bno);
	
}
