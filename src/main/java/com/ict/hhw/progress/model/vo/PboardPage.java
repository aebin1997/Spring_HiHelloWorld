package com.ict.hhw.progress.model.vo;

public class PboardPage {
	private int startRow;
	private int endRow;
	
	public PboardPage() {}

	public PboardPage(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
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

	@Override
	public String toString() {
		return "PboardPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
}
