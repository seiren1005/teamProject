package com.globalin.bulletinservice;

import com.globalin.bulletindomain.LikeVO;

public interface LikeService {

	public boolean clickGood(LikeVO lvo);
	
	public boolean clickBad(LikeVO lvo);
	
	public boolean deleteGood(LikeVO lvo);
	
	public boolean deleteBad(LikeVO lvo);
	
	public int countGood(int bno);
	
	public int countBad(int bno);
	
	public boolean nullCheck(int bno);
	
	public boolean goodChecker(LikeVO lvo);
	
	public boolean badChecker(LikeVO lvo);
	
}
