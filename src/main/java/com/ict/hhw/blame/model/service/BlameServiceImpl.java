package com.ict.hhw.blame.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.blame.model.dao.BlameDao;
import com.ict.hhw.blame.model.vo.Blame;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.notice.model.vo.Notice;

@Service("blameService")
public class BlameServiceImpl implements BlameService {
   @Autowired //의존성 어노테이션 
   private BlameDao blameDao;
         
   @Override
   public int getListCount() {
      return blameDao.getListCount();
   }

   @Override
   public ArrayList<Blame> selectList(int currentPage, int limit) {
      return blameDao.selectList(currentPage, limit);
   }

   @Override
   public int addReadCount(int blame_no) {
      return blameDao.addReadCount(blame_no);
   }

   @Override
   public int insertBlame(Blame blame) {
      return blameDao.insertBlame(blame);
   }

   @Override
   public int updateBlame(Blame blame) {
      return blameDao.updateBlame(blame);
   }

   @Override
   public int deleteBlame(int blame_no) {
      return blameDao.deleteBlame(blame_no);
   }

	@Override
	public ArrayList<Blame> selectSearchTitle(SearchAndPage searches) {
		return blameDao.selectSearchTitle(searches);
	}
	
	@Override
	public ArrayList<Blame> selectSearchWriter(SearchAndPage searches) {
		return blameDao.selectSearchWriter(searches);
	}
	
	@Override
	public ArrayList<Blame> selectSearchDate(SearchAndPage searches) {
		return blameDao.selectSearchDate(searches);
	}

	@Override
	public int getSearchTitleListCount(String keyword) {
		return blameDao.getSearchTitleListCount(keyword);
	}

	@Override
	public int getSearchWriterListCount(String keyword) {
		return blameDao.getSearchWriterListCount(keyword);
	}

	@Override
	public int getSearchDateListCount(SearchDate dates) {
		return blameDao.getSearchDateListListCount(dates);
	}

	@Override
	public ArrayList<Blame> selectTop3() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Blame> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Blame selectOne(int blame_no) {
		// TODO Auto-generated method stub
		return null;
	}


}