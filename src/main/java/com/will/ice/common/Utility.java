package com.will.ice.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {
	//paging 처리 관련 상수
	public static final int RECORD_COUNT=7; //한 페이지에 보여줄 레코드 개수
	public static final int BLOCKSIZE=7;	//블럭 크기 1~10

	public static String getFileInfo(String originFileName,
			HttpServletRequest request) {
		//파일이미지 + 파일명 => 파일정보 리턴
		String result="";
		if(originFileName!=null && !originFileName.isEmpty()) {
			result="<img src='"+ request.getContextPath()
					+"/resources/img/file.gif' alt='파일 이미지'> ";
			result+= originFileName;
		}
		
		return result;
	}
	
}
