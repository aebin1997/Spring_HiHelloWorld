package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.common.SearchDate;
import com.ict.hhw.progress.model.dao.PboardDao;
import com.ict.hhw.progress.model.vo.P_board;
import com.ict.hhw.progress.model.vo.Progress;
import com.ict.hhw.progress.model.vo.Psearch;
import com.ict.hhw.progress.model.vo.QaProgress;

@Service("pboardService")
public class PboardServiceImpl implements PboardService{

	@Autowired
	private PboardDao pboardDao;
	
	@Override
	public int getListCount() {
		return pboardDao.getListCount();
	}
	
	@Override
	public ArrayList<P_board> selectList(int pro_id) {
		return pboardDao.selectList(pro_id);
	}
	
	@Override
	public ArrayList<P_board> selectOldList(int pro_id) {
		return pboardDao.selectOldList(pro_id);
	}
	
	 @Override
	   public P_board selectPboard(int pid) {
	      return pboardDao.selectPboard(pid);
	   }
	 
	 @Override
		public QaProgress selectProgress(int pro_id) {
			return pboardDao.selectProgress(pro_id);
		}

	   @Override
	   public int addReadCount(int pid) {
	      return pboardDao.addReadCount(pid);
	   }

	   @Override
	   public int insertPboard(P_board P_board) {
	      return pboardDao.insertPboard(P_board);
	   }

	   @Override
	   public int updatePboard(P_board pboard) {
	      return pboardDao.updateBoard(pboard);
	   }

	   @Override
	   public int deletePboard(int pid) {
	      return pboardDao.deletePboard(pid);
	   }

		@Override
		public ArrayList<P_board> selectSearchTitle(Psearch psearch) {
			return pboardDao.selectSearchTitle(psearch);
		}
		
		@Override
		public ArrayList<P_board> selectSearchWriter(Psearch psearch) {
			return pboardDao.selectSearchWriter(psearch);
		}
		
		@Override
		public ArrayList<P_board> selectSearchDate(Psearch psearch) {
			return pboardDao.selectSearchDate(psearch);
		}

		@Override
		public int getSearchTitleListCount(String keyword) {
			return pboardDao.getSearchTitleListCount(keyword);
		}

		@Override
		public int getSearchWriterListCount(String keyword) {
			return pboardDao.getSearchWriterListCount(keyword);
		}

		@Override
		public int getSearchDateListCount(SearchDate dates) {
			return pboardDao.getSearchDateListListCount(dates);
		}

		@Override
		public int updateDeadline(Progress progress) {
			return pboardDao.updateDeadline(progress);
		}
		
		@Override
		public int processMinus(int pro_id) {
			return pboardDao.processMinus(pro_id);
		}

		@Override
		public int processPlus(int pro_id) {
			return pboardDao.processPlus(pro_id);
		}
		
		@Override
		public int updateStatus(int pro_id) {
			return pboardDao.updateStatus(pro_id);
		}

}