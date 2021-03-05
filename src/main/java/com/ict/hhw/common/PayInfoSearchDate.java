package com.ict.hhw.common;

import java.sql.Date;

public class PayInfoSearchDate {
		private Date begin;
		private Date end;
		private String member;
		
		public PayInfoSearchDate() {}

		public PayInfoSearchDate(Date begin, Date end, String member) {
			super();
			this.begin = begin;
			this.end = end;
			this.member = member;
		}

		public Date getBegin() {
			return begin;
		}

		public void setBegin(Date begin) {
			this.begin = begin;
		}

		public Date getEnd() {
			return end;
		}

		public void setEnd(Date end) {
			this.end = end;
		}

		public String getMember() {
			return member;
		}

		public void setMember(String member) {
			this.member = member;
		}

		@Override
		public String toString() {
			return "PayInfoSearchDate [begin=" + begin + ", end=" + end + ", member=" + member + "]";
		}

}
