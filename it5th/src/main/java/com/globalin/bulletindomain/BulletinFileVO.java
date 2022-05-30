package com.globalin.bulletindomain;

import java.util.Date;

// 게시판 파일 업로드 정보 저장
public class BulletinFileVO {

	private int fno, bno;
	private String fileName, uuid, imageChecker;
	private Date regDate, modDate;
	
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
		return "BulletinFileVO [fno=" + fno + ", bno=" + bno + ", fileName=" + fileName + ", uuid=" + uuid
				+ ", imageChecker=" + imageChecker + ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}
	
	
}
