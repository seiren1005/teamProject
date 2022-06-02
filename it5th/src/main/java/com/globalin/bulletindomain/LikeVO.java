package com.globalin.bulletindomain;

public class LikeVO {
	
	private int bno, good, bad, totalRec;
	private String isLike;
	private String userid;
	
	
	public int getTotalRec() {
		return totalRec;
	}
	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
	}
	public String getIsLike() {
		return isLike;
	}
	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	@Override
	public String toString() {
		return "LikeVO [bno=" + bno + ", good=" + good + ", bad=" + bad + ", totalRec=" + totalRec + ", isLike="
				+ isLike + ", userid=" + userid + "]";
	}
	
}
