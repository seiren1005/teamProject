package com.globalin.bulletinservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.bulletindomain.BulletinFileVO;
import com.globalin.bulletinmapper.BulletinUploadMapper;

@Service
public class BulletinUploadServiceImpl implements BulletinUploadService {

	@Autowired
	public BulletinUploadMapper mapper;
	
	private static Logger log = 
			LoggerFactory.getLogger(BulletinUploadServiceImpl.class);
	
	
	@Override
	public boolean insert(BulletinFileVO fvo) {
		// TODO Auto-generated method stub
		log.info("Upload file: " + fvo);
				
		return mapper.insert(fvo) == 1;
	}

	@Override
	public boolean update(BulletinFileVO fvo) {
		// TODO Auto-generated method stub
		log.info("Update file: " + fvo);
		
		return mapper.update(fvo) == 1;
	}

	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
		log.info("Delete file: " + bno);
	
		return mapper.delete(bno) == 1;
	}

	@Override
	public BulletinFileVO get(int bno) {
		// TODO Auto-generated method stub
		log.info("Get file: " + bno);
		
		return mapper.get(bno);
	}

}
