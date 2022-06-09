package com.globalin.diarydomain;

import java.util.Date;


public class diaryVO {
	
	private int diarybno;
	private String diarytitle;
	private String diarycontent;
	private String diarywriter;
	private Date diaryregdate;
	private Date diaryupdateDate;
	public int getDiarybno() {
		return diarybno;
	}
	public void setDiarybno(int diarybno) {
		this.diarybno = diarybno;
	}
	public String getDiarytitle() {
		return diarytitle;
	}
	public void setDiarytitle(String diarytitle) {
		this.diarytitle = diarytitle;
	}
	public String getDiarycontent() {
		return diarycontent;
	}
	public void setDiarycontent(String diarycontent) {
		this.diarycontent = diarycontent;
	}
	public String getDiarywriter() {
		return diarywriter;
	}
	public void setDiarywriter(String diarywriter) {
		this.diarywriter = diarywriter;
	}
	public Date getDiaryregdate() {
		return diaryregdate;
	}
	public void setDiaryregdate(Date diaryregdate) {
		this.diaryregdate = diaryregdate;
	}
	public Date getDiaryupdateDate() {
		return diaryupdateDate;
	}
	public void setDiaryupdateDate(Date diaryupdateDate) {
		this.diaryupdateDate = diaryupdateDate;
	}
	@Override
	public String toString() {
		return "diaryVO [diarybno=" + diarybno + ", diarytitle=" + diarytitle + ", diarycontent=" + diarycontent
				+ ", diarywriter=" + diarywriter + ", diaryregdate=" + diaryregdate + ", diaryupdateDate="
				+ diaryupdateDate + "]";
	}
	
	
}
