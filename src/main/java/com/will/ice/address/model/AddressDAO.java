package com.will.ice.address.model;

import java.util.List;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

public interface AddressDAO {
	//주소록 조회
	List<MemberVO> selectMemDeptPosForOrgan();
	List<DepartmentVO> selectDepartment();
	
	//주소록 등록
	int selectCountAddressGroup(String memNo);
	List<AddressGroupVO> selectAddressGroup();
	int insertAddress(AddressVO vo);
	AddressVO selectOneAdderss(int adNo);

	int updateAddress(AddressVO adVo);
	
	int deleteAddress(int adNo);
	int updateTrashAddress(int adNo);
	int updateBackAddress(int adNo);
	int updateIsFavorite(int adNo);
	int updateNotFavorite(int adNo);
	
	public List<AddressVO> selectAddress(AddressSearchVO searchVo);
	public List<AddressVO> selectAddress2(AddressSearchVO adSearchVo);
	int getTotalRecord(AddressSearchVO searchVo);
	
	//쪽지 쓰기용
	List<AddressVO> selectListMsgAddr_memNo_adgNo(AddressVO advo);
}
