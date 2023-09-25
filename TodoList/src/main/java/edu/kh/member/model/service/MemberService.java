package edu.kh.member.model.service;

import java.sql.Connection;
import java.util.List;

import static edu.kh.todo.common.JDBCTemplate.*;
import edu.kh.member.model.dao.MemberDAO;
import edu.kh.member.model.dto.Member;

public class MemberService {
	
	private MemberDAO dao = new MemberDAO();
	
	/** 로그인 서비스
	 * @param inputId
	 * @param inputPw
	 * @return
	 */
	public Member login(String inputId, String inputPw) throws Exception{
		
		Connection conn = getConnection();
		
		Member loginMember = dao.login(conn, inputId, inputPw);
		
		close(conn);
		
		return loginMember;
	}
	

	public Member signUp(String query) throws Exception{

		Connection conn = getConnection();
		
		Member member = dao.signUp(conn, query);
		
		close(conn);
		 
		return member;
	}

}
