package com.ict.hhw.progress.model.vo;

public class PboardPage {
	private int startRow;
	private int endRow;
	private int pro_id;
	
	public PboardPage() {}

	public PboardPage(int startRow, int endRow) {
		super();
		
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public PboardPage(int startRow, int endRow, int pro_id) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.pro_id = pro_id;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	@Override
	public String toString() {
		return "PboardPage [startRow=" + startRow + ", endRow=" + endRow + ", pro_id=" + pro_id + "]";
	}
}
