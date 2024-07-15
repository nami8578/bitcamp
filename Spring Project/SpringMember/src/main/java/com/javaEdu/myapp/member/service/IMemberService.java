package com.javaEdu.myapp.member.service;

import com.javaEdu.myapp.member.model.MemberVO;

public interface IMemberService {

	int insertMember(MemberVO member);
	int doubleCheck(String id);
	int userCheck(String id, String pw);
	String searchId(String name, String phoneNum);
	String searchPw(String id, String name, String phoneNum);
	int updateMember(MemberVO member);
	MemberVO getMember(String id);
	int deleteMember(MemberVO member);

}
