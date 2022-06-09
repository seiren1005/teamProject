package com.globalin.diaryservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.globalin.diarydomain.diaryCriteria;
import com.globalin.diarydomain.diaryVO;
import com.globalin.diarymapper.diaryBoardMapper;

@Service
@Primary
public class DiaryboardServiceImpl implements DiaryBoardService{

	@Autowired
	private diaryBoardMapper dmapper;
	
	
	
	@Override
	public void enroll(diaryVO diaryboard) {
		// TODO Auto-generated method stub
		dmapper.enroll(diaryboard);
	}
	/* 게시판 목록(페이징 적용) */
	@Override
	public List<diaryVO> getListPaging(diaryCriteria cri) {
		
		return dmapper.getListPaging(cri);
	}    
	
	@Override
	public List<diaryVO> getList() {
		// TODO Auto-generated method stub
		return dmapper.getList();
	}
	
	 /* 게시판 조회 */
    @Override
    public diaryVO getPage(int diarybno) {
         
        return dmapper.getPage(diarybno);
    }    
    /* 게시판 수정 */
    @Override
    public int modify(diaryVO diaryboard) {
        
        return dmapper.modify(diaryboard);
    }
    /* 게시판 삭제 */
    @Override
    public int delete(int diarybno) {
        
        return dmapper.delete(diarybno);
    }    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(diaryCriteria cri) {
        
        return dmapper.getTotal(cri);
    }    
 
}