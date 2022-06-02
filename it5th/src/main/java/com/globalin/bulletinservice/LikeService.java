package com.globalin.bulletinservice;

public interface LikeService {

	public boolean clickGood(int bno);
	
	public boolean clickBad(int bno);
	
//	public boolean deleteRec(int bno);
	
	public int countGood(int bno);
	
	public int countBad(int bno);
	
	public boolean nullCheck(int bno);
	
}
