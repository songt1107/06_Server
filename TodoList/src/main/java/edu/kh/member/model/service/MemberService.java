package edu.kh.member.model.service;

import java.sql.Connection;
import static edu.kh.todo.common.JDBCTemplate.*;
import edu.kh.member.model.dao.MemberDAO;
import edu.kh.member.model.dto.Member;

public class MemberService {
	
	private MemberDAO dao = new MemberDAO();
	
	Connection conn = getConnection();
	
	/** 로그인 서비스
	 * @param inputId
	 * @param inputPw
	 * @return
	 */
	public Member login(String inputId, String inputPw) throws Exception{
		
		Member loginMember = dao.login(conn, inputId, inputPw);
		
		close(conn);
		
		return loginMember;
	}
	
	public Member signup(String inputId, String inputPw, String inputNickname) throws Exception{
		
		Member member = new Member();
		
		close(conn);
		
		return member;
	}
	
}
