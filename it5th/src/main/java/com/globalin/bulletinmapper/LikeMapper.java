package com.globalin.bulletinmapper;

import java.util.List;

import com.globalin.bulletindomain.LikeVO;

public interface LikeMapper {

	public int clickGood(LikeVO lvo);
	
	public int clickBad(LikeVO lvo);
	
	public int deleteGood(LikeVO lvo);
	
	public int deleteBad(LikeVO lvo);
	
	public int countGood(int bno);
	
	public int countBad(int bno);
	
	public int nullChecker(int bno);
	
	public LikeVO goodCheck(LikeVO lvo);
	
	public LikeVO badCheck(LikeVO lvo);
	
}
