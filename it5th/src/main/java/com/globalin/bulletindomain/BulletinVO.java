package com.globalin.bulletindomain;

import java.util.Date;

// 게시판 글 정보 저장
public class BulletinVO {

	private int bno, replyCnt, hit, totalRec;
	private String purpose, title, content, writer, fileName;
	
	// 비밀글 컬럼
	private String secret = "no";
	
	private Date regDate, modDate;
		
	
	public BulletinVO() {
		this.fileName = "null";
	}
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getTotalRec() {
		return totalRec;
	}
	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	
	@Override
	public String toString() {
		return "BulletinVO [bno=" + bno + ", replyCnt=" + replyCnt + ", hit=" + hit + ", totalRec=" + totalRec
				+ ", purpose=" + purpose + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", fileName=" + fileName + ", secret=" + secret + ", regDate=" + regDate + ", modDate=" + modDate
				+ "]";
	}		
	
}
