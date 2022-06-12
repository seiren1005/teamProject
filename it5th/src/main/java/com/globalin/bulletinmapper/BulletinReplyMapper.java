package com.globalin.bulletinmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinReplyVO;

// required sql for reply
public interface BulletinReplyMapper {

	// reply register
	public int insert(BulletinReplyVO rvo);
	
	// insert reply to reply
	public int insertToReply(BulletinReplyVO rvo);
	
	// view a reply
	public BulletinReplyVO selectOne(int rno);
	
	// 대댓글용으로 rno 와 같은 gno 를 갖는 댓글들은 모두 가져옴
	public List<BulletinReplyVO> selectSubGroup(int rno);
	
	// Delete a reply
	public int delete(int rno);
	
	// Update a reply
	public int update(BulletinReplyVO rvo);
	
	// update gno at reply
	// service 를 통하지 않고 바로 mapper 를 호출시 변수 두개 가능?
	public int updateGOrder(@Param("rno") int rno,
			@Param("amount") int amount);
	
	// view all replies with paging
	public List<BulletinReplyVO> selectAllWithPaging(
			@Param("cri") BulletinCriteria cri,
			@Param("bno") int bno);
	
	// Count total replies
	public int getCountReplyByBno(int bno);

	// check is there adopted valed in adoption column
	public int checkAdoption(int bno);
	
	// 대댓글 수정
	public int tUpdate(BulletinReplyVO rvo);
	
	// 대댓글 삭제
	public int tDelete(int tno);
	
	// 대댓글 하나 불러오기
	public BulletinReplyVO tSelectOne(int tno);
	
}
