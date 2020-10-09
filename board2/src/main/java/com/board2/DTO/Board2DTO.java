package com.board2.DTO;

import java.util.Date;

public class Board2DTO {
	private String title, content;
	private int hit,boardno;
	private Date boarddate;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	@Override
	public String toString() {
		return "Board2DTO [title=" + title + ", content=" + content + ", hit=" + hit + ", boardno=" + boardno
				+ ", boarddate=" + boarddate + "]";
	}
}
