package com.globalin.bulletindomain;

import java.util.Date;

public class DualVO {

	private int bno, replyCnt, viewCnt;
	private String purpose, title, content, writer;
	
	// 비밀글 컬럼
	private String secret = "no";
	
	private Date regDate, modDate;
	
	// upload file
	private int fno;
	private String fileName, uuid, imageChecker;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
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
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
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
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getImageChecker() {
		return imageChecker;
	}
	public void setImageChecker(String imageChecker) {
		this.imageChecker = imageChecker;
	}
	
	
	@Override
	public String toString() {
		return "DualVO [bno=" + bno + ", replyCnt=" + replyCnt + ", viewCnt=" + viewCnt + ", purpose=" + purpose
				+ ", title=" + title + ", content=" + content + ", writer=" + writer + ", secret=" + secret
				+ ", regDate=" + regDate + ", modDate=" + modDate + ", fno=" + fno + ", fileName=" + fileName
				+ ", uuid=" + uuid + ", imageChecker=" + imageChecker + "]";
	}	
	
}
