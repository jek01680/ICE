package com.will.ice.companyCard.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;


@Service
public class ComcardServiceImpl implements ComcardService{
	private static final Logger logger
	= LoggerFactory.getLogger(ComcardServiceImpl.class);

	@Autowired private ComcardDAO comcardDAO;

	@Override
	public List<ComcardVO> selectUnUseComcard(DateSearchVO search_dsvo) {
		return comcardDAO.selectUnUseComcard(search_dsvo);
	}

	@Override
	public ComcardVO selectNoComcard(int comcard_no) {
		return comcardDAO.selectNoComcard(comcard_no);
	}

	@Override
	public List<ComcardVO> selectListComcard(Depart_posi_dateVO dpdvo) {
		return comcardDAO.selectListComcard(dpdvo);
	}

	@Override
	public int insertCCMulti(List<ComcardVO> ccList, ComCardFileVO ccfvo) {
		int cnt = 0;
		logger.info("ccfvo ={}",ccfvo);


		for( int i = 0; i<ccList.size(); i++) {
			ComcardVO ccvo = ccList.get(i);
			if(ccvo.getCardNo() == null) {
				cnt = 0;
			}else {

				ccvo.setFileNo(ccfvo.getFileNo());

				cnt = comcardDAO.insertCCMulti(ccvo);
			}

			logger.info("i={}, cnt ={}", i, cnt);
		}

		return cnt;
	}

	@Override
	public int insertCCFile(ComCardFileVO CCfileVO) {

		return comcardDAO.insertCCFile(CCfileVO);
	}


	@Override
	public ComCardFileVO selectCCFile_recent() {
		return comcardDAO.selectCCFile_recent();
	}

	@Override
	public List<ComCardFileVO> selectListFileName() {
		return comcardDAO.selectListFileName();
	}

	@Override
	public List<ComcardVO> selectUnUseComcardByFile(String fileName) {
		return comcardDAO.selectUnUseComcardByFile(fileName);
	}

	@Override
	public List<CartVO> selectByDept() {
		return comcardDAO.selectByDept();
	}
	@Override
	public List<CartVO> selectByPos() {
		return comcardDAO.selectByPos();
	}




}