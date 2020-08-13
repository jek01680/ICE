package com.will.ice.insa.model;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.will.ice.common.Depart_posi_dateVO;

@Service
public class InsaServiceImpl implements InsaService{
	private static final Logger logger
	 = LoggerFactory.getLogger(InsaServiceImpl.class);
	
	@Autowired private InsaDAO memberDao;
	BCryptPasswordEncoder bcpwd = new BCryptPasswordEncoder();
	
	//관리자 용
	@Override
	public int logCheck_admin(String memNo, String pwd) {
		String dbPwd = memberDao.selectPwd(memNo);
		System.out.println("dbPwd" + dbPwd);
		
	
		int result=0;
		if(dbPwd!=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}else {
			result=ID_NONE;
		}
		
		return result;
	}
	
	@Override
	public int logCheck(String memNo, String pwd) {
		String dbPwd = memberDao.selectPwd(memNo);
		System.out.println("dbPwd" + dbPwd);
		
		int result=0;
		if(dbPwd!=null && !dbPwd.isEmpty()) {
			if(bcpwd.matches(pwd, dbPwd) ) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}else {
			result=ID_NONE;
		}
		
		return result;
	}
	
	public InsaVO selectMember(String memNo){
		return memberDao.selectMember(memNo);
	}
	
	@Override
	public int registerMulti(List<InsaVO> memList){
		
		int cnt = 0;
		
		for( int i = 0; i<memList.size(); i++) {
			InsaVO memvo = memList.get(i);
			if(memvo.getMemNo() == null) {
				cnt = 0;
			}else {
				
				String encode_pwd = bcpwd.encode(memvo.getPwd());
				
				memvo.setPwd(encode_pwd);
				logger.info("encode_pwd ={}", encode_pwd);
				cnt = memberDao.registerMulti(memvo);
			}
			logger.info("i={}, cnt ={}", i, cnt);
		}
		
		return cnt;
	}


	@Override
	public List<InsaVO> selectMemberList(Depart_posi_dateVO dpdvo) {
		return memberDao.selectMemberList(dpdvo);
	}

	@Override
	public int updateSelectMember(InsaVO memberVO) {
		return memberDao.updateSelectMember(memberVO);
	}

	@Override
	public int deleteSelectMember(InsaVO memberVO) {
		return memberDao.deleteSelectMember(memberVO);
	}

	@Override
	public int newPwd(InsaVO memVo) {
		
		String encode_pwd = bcpwd.encode(memVo.getPwd());
		memVo.setPwd(encode_pwd);
		logger.info("encode_pwd ={}", encode_pwd);
		return memberDao.newPwd(memVo);
	}


	

	

	
	
	
	
	
}
