package com.ict.hhw.board.model.vo;

public class BoardListPage {
	private int bid;
	private int startRow;
	private int endRow;
	
	public BoardListPage() {}

	public BoardListPage(int bid, int startRow, int endRow) {
		super();
		this.bid = bid;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
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
		return "BoardListPage [bid=" + bid + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
}
