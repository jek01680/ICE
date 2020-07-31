package com.will.ice.address.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDAO dao;

	@Override
	public List<AddressVO> selectAddress(String memNo) {
		return dao.selectAddress(memNo);
	}

	@Override
	public List<MemberVO> selectMemDeptPosForOrgan() {
		return dao.selectMemDeptPosForOrgan();
	}

	@Override
	public List<DepartmentVO> selectDepartment() {
		return dao.selectDepartment();
	}

	@Override
	public List<AddressGroupVO> selectAddressGroup(String memNo) {
		int haveGroup=dao.selectCountAddressGroup(memNo);
		if(haveGroup>0) {
		}else {
			int createDefaultAdg=dao.insertDefaultAddressGroup(memNo);
			if(createDefaultAdg>0) {
			}
		}
		
		return dao.selectAddressGroup(memNo);
	}

	@Override
	public int insertAddress(AddressVO vo) {

		return dao.insertAddress(vo);
	}

	@Override
	public AddressVO selectOneAdderss(int adNo) {
		return dao.selectOneAdderss(adNo);
	}


	@Override
	public int updateAddress(AddressVO adVo) {
		return dao.updateAddress(adVo);
	}
	
	@Override
	@Transactional
	public int deleteMulti(List<AddressVO> list) {
		int cnt=0;
		try {
			for(AddressVO vo : list) {
				if(vo.getAdNo()!=0) { //체크한 상품만 삭제
					cnt=dao.deleteAddress(vo.getAdNo());
				}
			}
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}

	
}
