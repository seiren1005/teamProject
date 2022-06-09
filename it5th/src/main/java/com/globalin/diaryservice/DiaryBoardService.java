package com.globalin.diaryservice;

import java.util.List;

import com.globalin.diarydomain.diaryCriteria;
import com.globalin.diarydomain.diaryVO;


public interface DiaryBoardService {
	/* 게시판 등록*/
	public void enroll(diaryVO diaryboard);
	/*게시판 목록*/
	public List<diaryVO> getList();
	 /* 게시판 조회 */
    public diaryVO getPage(int diarybno);
    /* 게시판 수정 */
    public int modify(diaryVO diaryboard);
    /* 게시판 삭제 */
    public int delete(int diarybno);
    /* 게시판 목록(페이징 적용) */
    public List<diaryVO> getListPaging(diaryCriteria cri);
    /* 게시판 총 갯수 */
    public int getTotal(diaryCriteria cri);
 

}
