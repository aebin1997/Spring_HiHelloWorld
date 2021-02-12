package com.ict.hhw.qa.model.vo;

public class QaPage {
	private int startRow;
	private int endRow;
	
	public QaPage() {}

	public QaPage(int startRow, int endRow) {
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
		return "QaPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
}
