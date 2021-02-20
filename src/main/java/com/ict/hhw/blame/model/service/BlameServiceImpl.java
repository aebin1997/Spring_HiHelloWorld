package com.ict.hhw.blame.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.blame.model.dao.BlameDao;
import com.ict.hhw.blame.model.vo.Blame;

@Service("blameService")
public class BlameServiceImpl implements BlameService {
   @Autowired //의존성 어노테이션 
   
   private BlameDao boardDao;
   
   @Override
   public int getListCount() {
      return blameDao.getListCount();
   }

   @Override
   public ArrayList<Blame> selectList(int currentPage, int limit) {
      return blameDao.selectList(currentPage, limit);
   }

   @Override
   public Blame selectBlame(int blame_no) {
      return blameDao.selectBlame(blame_no);
   }

   @Override
   public int insertBoard(Blame blame) {
      return blameDao.insertBlame(blame);
   }

}