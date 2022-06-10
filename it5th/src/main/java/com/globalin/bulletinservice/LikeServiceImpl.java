package com.globalin.bulletinservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.bulletindomain.LikeVO;
import com.globalin.bulletinmapper.LikeMapper;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeMapper mapper; 
	
	
	@Override
	public boolean clickGood(LikeVO lvo) {
		// TODO Auto-generated method stub
		if(mapper.clickGood(lvo) == 1) {
			
			return true;
			
		}		
		
		return false;
	}

	
	@Override
	public boolean clickBad(LikeVO lvo) {
		// TODO Auto-generated method stub
		if(mapper.clickBad(lvo) == 1) {
			
			return true;
			
		}
		
		return false;
	}

	
	@Override
	public int countGood(int bno) {
		// TODO Auto-generated method stub
		
		return mapper.countGood(bno);
		
	}

	
	@Override
	public int countBad(int bno) {
		// TODO Auto-generated method stub
		
		return mapper.countBad(bno);
				
	}


	@Override
	public boolean nullCheck(int bno) {
		// TODO Auto-generated method stub
		
		if(mapper.nullChecker(bno) > 0) {
			
			return true;
			
		}
		
		return false;
	}


	@Override
	public boolean goodChecker(LikeVO lvo) {
		// TODO Auto-generated method stub
		
		if(mapper.goodCheck(lvo) != null) {
			
			if (mapper.goodCheck(lvo).getGood() == 1) {
				
				return true;
			
			} 
			
		}
		
		return false;		
		
	}


	@Override
	public boolean badChecker(LikeVO lvo) {
		// TODO Auto-generated method stub

		if(mapper.badCheck(lvo) != null) {
			
			if (mapper.badCheck(lvo).getBad() == 1) {
				
				return true;
			
			} 
			
		}
		
		return false;	
		
	}
	

	@Override
	public boolean deleteGood(LikeVO lvo) {
		// TODO Auto-generated method stub
		
		if(mapper.deleteGood(lvo) == 1) {
			
			return true;
			
		}
		
		return false;
		
	}


	@Override
	public boolean deleteBad(LikeVO lvo) {
		// TODO Auto-generated method stub
		if(mapper.deleteBad(lvo) == 1) {
			
			return true;
			
		}
		
		return false;
		
	}
	

}
