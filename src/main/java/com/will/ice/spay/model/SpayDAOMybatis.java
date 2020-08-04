package com.will.ice.spay.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.DateSearchVO;

@Repository
public class SpayDAOMybatis implements SpayDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.spay.";
	
	@Override
	public int insertTic(SpayVO vo) {
		return sqlSession.insert(namespace+"insertTic", vo);
	}

	@Override
	public List<SpayViewVO> selectSpayView(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace+"selectSpayView", dateSearchVo);
	}

	@Override
	public int selectTotalRecord(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",dateSearchVo);
	}

	@Override
	public SpayVO searchAll(int ticno) {
		return sqlSession.selectOne(namespace+"searchAll", ticno);
	}

	@Override
	public int searchNum(int MEMNO) {
		return sqlSession.selectOne(namespace+"searchNum", MEMNO);
	}

	@Override
	public List<SpayViewVO> selectSpayViewAll(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace+"selectSpayViewAll", dateSearchVo);
	}

	@Override
	public int selectTotalRecordAll(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordAll",dateSearchVo);
	}


}
