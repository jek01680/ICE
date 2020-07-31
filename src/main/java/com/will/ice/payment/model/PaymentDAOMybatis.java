package com.will.ice.payment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.payline.model.PaylineVO;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.payment.";

	@Override
	public int insertPaydoc(PaylinedocVO pldVo) {
		return sqlSession.insert(namespace+"insertPaydoc",pldVo);
	}

	@Override
	public List<PaylistViewVO> selectSent(String identNum) {
		return sqlSession.selectList(namespace+"selectSent",identNum);
	}

	@Override
	public List<PaymentviewVO> selectImsy(String identNum) {
		return sqlSession.selectList(namespace+"selectImsy",identNum);
	}

	@Override
	public int insertPayline(PaylinedocVO pldVo) {
		return sqlSession.update(namespace+"insertPayline",pldVo);
	}

	@Override
	public PaymentviewVO selectDocument(int docNo) {
		return sqlSession.selectOne(namespace+"selectDocument",docNo);
	}

	@Override
	public List<DocumentviewVO> selectPayLine(int docNo) {
		return sqlSession.selectList(namespace+"selectPayLine",docNo);
	}

	@Override
	public int deletePayLine(int docNo) {
		return sqlSession.update(namespace+"deletePayLine",docNo);
	}
	
	@Override
	public List<MemberVO> selectAllMem(int poscode) {
		return sqlSession.selectList(namespace+"selectAllMem",poscode);
	}

	@Override
	public List<PaylineVO> isRead(int docNo) {
		return sqlSession.selectList(namespace+"isRead",docNo);
	}

	@Override
	public int insertOnePay(PaylinedocVO pldVo) {
		return sqlSession.insert(namespace+"insertOnePay",pldVo);
	}

	@Override
	public int updateImsy(int docNo) {
		return sqlSession.update(namespace+"updateImsy",docNo);
	}

}
