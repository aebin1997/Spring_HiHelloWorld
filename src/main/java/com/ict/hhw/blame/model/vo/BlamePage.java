package com.ict.hhw.blame.model.vo;

public class BlamePage {
	private int startRow;
	private int endRow;
	
	public BlamePage() {}

	public BlamePage(int startRow, int endRow) {
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
		return "BlamePage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
