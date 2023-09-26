package edu.kh.member.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import static edu.kh.todo.common.JDBCTemplate.*;
import edu.kh.member.model.dto.Member;

public class MemberDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;
	
	public MemberDAO() {
		
		prop = new Properties();
		
		try {
			
			String filePath 
				= MemberDAO.class.getResource("/edu/kh/todo/sql/member-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/** 로그인 DAO
	 * @param conn
	 * @param inputEmail
	 * @param inputPw
	 * @return
	 */
	public Member login(Connection conn, String inputId, String inputPw) throws Exception{
		
		Member loginMember = null;
		
		try {
			
			String sql = prop.getProperty("login");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				loginMember = new Member();   
				
				loginMember.setMemberNo( rs.getInt("MEMBER_NO") );
				loginMember.setMemberId( rs.getString("MEMBER_ID") );
				loginMember.setMemberPw( rs.getString("MEMBER_PW") );
				loginMember.setMemberNickname( rs.getString("MEMBER_NICKNAME") );
				loginMember.setEnrollDate( rs.getString("ENROLL_DATE") );
				
			}
			
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return loginMember;
	}
	
	
	public Member signup(Connection conn, String inputId, String inputPw, String inputNickname) throws Exception{
		
		Member member = null;
		
		try {
			
			String sql = prop.getProperty("signup");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputPw);
			pstmt.setString(3, inputNickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setMemberNo( rs.getInt(1) );
				member.setMemberId( rs.getString(2) );
				member.setMemberPw( rs.getString(3) );
				member.setMemberNickname( rs.getString(4) );
				member.setEnrollDate( rs.getString(5) );
				member.setMemberDeleteFlag( rs.getString(6) );
				
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return member;
			
		}
		
		
	}
