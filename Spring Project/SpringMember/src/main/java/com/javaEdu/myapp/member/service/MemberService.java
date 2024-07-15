package com.javaEdu.myapp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaEdu.myapp.member.dao.IMemberRepository;
import com.javaEdu.myapp.member.model.MemberVO;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public int insertMember(MemberVO member) {
		return memberRepository.insertMember(member);
	}
	
	@Override
	public int doubleCheck(String id) {
		return memberRepository.doubleCheck(id);
	}
	
	@Override
	public int userCheck(String id, String pw){
		return memberRepository.userCheck(id, pw);
	}
	
	@Override
	public String searchId(String name, String phoneNum){
		return memberRepository.searchId(name, phoneNum);
	}
	
	@Override
	public String searchPw(String id, String name, String phoneNum){
		return memberRepository.searchPw(id, name, phoneNum);
	}
	
	@Override
	public int updateMember(MemberVO member){
		return memberRepository.updateMember(member);
	}
	
	@Override
	public MemberVO getMember(String id){
		return memberRepository.getMember(id);
	}
	
	@Override
	public int deleteMember(MemberVO member){
		return memberRepository.deleteMember(member);
	}

}
