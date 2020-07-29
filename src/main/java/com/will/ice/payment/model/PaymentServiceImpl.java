package com.will.ice.payment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.document.model.DocumentviewVO;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDAO paymentDao;

	@Override
	public List<PaymentviewVO> selectAll() {
		return paymentDao.selectAll();
	}

	@Override
	public int insertPaymentM(String[] memList, PaylinedocVO pldVo) {
		int cnt=0;
		pldVo.setProgress("결재진행중");
		paymentDao.insertPaydoc(pldVo);
		
		for(int i=0; i<memList.length; i++) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}

	@Override
	public PaymentviewVO selectDocument(int docNo) {
		return paymentDao.selectDocument(docNo);
	}

	@Override
	public List<DocumentviewVO> selectPayLine(int docNo) {
		return paymentDao.selectPayLine(docNo);
	}
	
}
