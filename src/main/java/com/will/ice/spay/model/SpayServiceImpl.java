package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.DateSearchVO;

@Service
public class SpayServiceImpl implements SpayService{

	@Autowired SpayDAO spayDao;
	
	@Override
	public int insertTic(SpayVO vo) {
		return spayDao.insertTic(vo);
	}

	@Override
	public List<Map<String, Object>> selectSpayView(int MEMNO) {
		return spayDao.selectSpayView(MEMNO);
	}

	@Override
	public int selectDay(DateSearchVO dateSearchVo) {
		return spayDao.selectDay(dateSearchVo);
	}

	@Override
	public SpayVO searchAll(int ticno) {
		return spayDao.searchAll(ticno);
	}

	@Override
	public int searchNum(int MEMNO) {
		return spayDao.searchNum(MEMNO);
	}

	

}
