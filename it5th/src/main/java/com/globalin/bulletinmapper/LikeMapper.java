package com.globalin.bulletinmapper;

public interface LikeMapper {

	public int clickGood(int bno);
	
	public int clickBad(int bno);
	
	public int deleteRec(int bno);
	
	public int countGood(int bno);
	
	public int countBad(int bno);
	
	public int nullChecker(int bno);
	
}
