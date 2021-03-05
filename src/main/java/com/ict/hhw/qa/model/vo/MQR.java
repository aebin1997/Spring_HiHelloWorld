package com.ict.hhw.qa.model.vo;

public class MQR {
	private int ref_qa_id;
	private int qaCount;
	
	public MQR() {}

	public MQR(int ref_qa_id, int qaCount) {
		super();
		this.ref_qa_id = ref_qa_id;
		this.qaCount = qaCount;
	}

	public int getRef_qa_id() {
		return ref_qa_id;
	}

	public void setRef_qa_id(int ref_qa_id) {
		this.ref_qa_id = ref_qa_id;
	}

	public int getQaCount() {
		return qaCount;
	}

	public void setQaCount(int qaCount) {
		this.qaCount = qaCount;
	}

	@Override
	public String toString() {
		return "MQR [ref_qa_id=" + ref_qa_id + ", qaCount=" + qaCount + "]";
	}

	
	
}
