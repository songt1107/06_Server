package edu.kh.member.model.service;

import static edu.kh.todo.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.member.model.dao.MemberDAO;
import edu.kh.member.model.dto.Member;

public class MemberService {

	MemberDAO dao = new MemberDAO();
	
	
	/** 회원가입 서비스
	 * @param inputId
	 * @param inputPw
	 * @param inputNickname
	 * @return result
	 */
	public int signup(String inputId, String inputPw, String inputNickname) throws Exception {
		
		int result = 0;
		
		Connection conn = getConnection();
		
		result = dao.signup(conn, inputId, inputPw, inputNickname);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 로그인 서비스
	 * @param inputId
	 * @param inputPw
	 * @return member
	 */
	public Member login(String inputId, String inputPw) throws Exception{
		
		Member member = null;
		
		Connection conn = getConnection();
		
		member = dao.login(conn, inputId, inputPw);
		
		close(conn);
		
		return member;
	}
	
	/** 회원조회 서비스
	 * @param inputId
	 * @return member
	 */
	public Member select(String inputId) throws Exception{
		
		Member member = new Member();
		
		Connection conn = getConnection();
		
		member = dao.select(conn, inputId);
		
		close(conn);
		
		return member;
	}

	/** 회원탈퇴 서비스
	 * @param memberNo
	 * @param pwForDelete
	 * @return result
	 */
	public int deleteMem(int memberNo, String pwForDelete) throws Exception{

		int result = 0;
		
		Connection conn = getConnection();
		
		result = dao.deleteMem(conn, memberNo, pwForDelete);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
