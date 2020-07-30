package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;

public interface PaymentDAO {
	int insertPaydoc(PaylinedocVO pldVo);
	List<PaymentviewVO> selectSent(String identNum);
	int insertPayline(PaylinedocVO pldVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
	int deletePayLine(int docNo);
	List<MemberVO> selectAllMem(int poscode);
}
