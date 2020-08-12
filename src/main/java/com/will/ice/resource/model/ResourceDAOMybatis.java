package com.will.ice.resource.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDAOMybatis implements ResourceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.resource.";

	@Override
	public List<ResManageVO> selectResManage(ResManageSearchVO rmsVo) {
		return sqlSession.selectList(namespace+"selectResManage", rmsVo);
	}

	@Override
	public int insertResManage(ResManageVO rmVo) {
		return sqlSession.insert(namespace+"insertResManage", rmVo);
	}

	@Override
	public ResManageVO selectResManageOne(int resNo) {
		return sqlSession.selectOne(namespace+"selectResManageOne", resNo);
	}

	@Override
	public int updateResource(ResManageVO rmVo) {
		return sqlSession.update(namespace+"updateResource", rmVo);
	}

	@Override
	public int deleteResManage(int resNo) {
		return sqlSession.delete(namespace+"deleteResManage", resNo);
	}

	@Override
	public int selectTotalRecord() {
		return sqlSession.selectOne(namespace+"selectTotalRecord");
	}
	
}