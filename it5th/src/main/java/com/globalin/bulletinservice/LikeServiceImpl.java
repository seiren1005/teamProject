package com.globalin.bulletinservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.bulletinmapper.LikeMapper;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeMapper mapper; 
	
	
	@Override
	public boolean clickGood(int bno) {
		// TODO Auto-generated method stub
		if(mapper.clickGood(bno) == 1) {
			
			return true;
			
		}		
		
		return false;
	}

	
	@Override
	public boolean clickBad(int bno) {
		// TODO Auto-generated method stub
		if(mapper.clickBad(bno) == 1) {
			
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

}
