package com.will.ice.companyCard.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;

@Repository
public class ComcardDAOMybatis implements ComcardDAO{
	private String namespace = "com.mybatis.mapper.oracle.comcard.";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<ComcardVO> selectUnUseComcard(DateSearchVO search_dsvo) {
		return sqlsession.selectList(namespace+"selectUnUseComcard", search_dsvo);
	}

	
	@Override
	public ComcardVO selectNoComcard(int comcard_no) {
		return sqlsession.selectOne(namespace+"selectNoComcard", comcard_no);
	}


	@Override
	public List<ComcardVO> selectListComcard(Depart_posi_dateVO dpdvo) {
		return sqlsession.selectList(namespace+"selectListComcard",dpdvo);
	}


	@Override
	public int insertCCMulti(ComcardVO ccvo) {
		return sqlsession.insert(namespace+"insertCCMulti",ccvo);
	}


	@Override
	public int insertCCFile(ComCardFileVO CCfileVO) {
		return sqlsession.insert(namespace+"insertCCFile", CCfileVO);
	}


	@Override
	public ComCardFileVO selectCCFile_recent() {
		return sqlsession.selectOne(namespace+"selectCCFile_recent");
	}


	@Override
	public List<ComCardFileVO> selectListFileName() {
		return sqlsession.selectList(namespace+"selectListFileName");
	}


	@Override
	public List<ComcardVO> selectUnUseComcardByFile(String fileName) {
		return sqlsession.selectList(namespace+"selectUnUseComcardByFile", fileName);
	}


	@Override
	public List<CartVO> selectByDept() {
		return sqlsession.selectList(namespace+"selectByDept");
	}
	@Override
	public List<CartVO> selectByPos() {
		return sqlsession.selectList(namespace+"selectByPos");
	}

}
