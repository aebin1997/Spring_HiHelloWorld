package com.ict.hhw.qa.model.service;

import java.util.ArrayList;

import com.ict.hhw.qa.model.vo.Qar;

public interface QarService {
		int insertQar(Qar qar);
		int updateQar(Qar qar);
		int deleteQar(int qar_id);
		Qar selectQar(int qar_id);
		ArrayList<Qar> selectList(int ref_qa_id);
}
