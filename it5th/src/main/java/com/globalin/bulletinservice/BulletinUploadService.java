package com.globalin.bulletinservice;

import com.globalin.bulletindomain.BulletinFileVO;

public interface BulletinUploadService {

	public boolean insert(BulletinFileVO fvo);
	
	public boolean update(BulletinFileVO fvo);
	
	public boolean delete(int bno);
	
	public BulletinFileVO get(int bno);
	
}
