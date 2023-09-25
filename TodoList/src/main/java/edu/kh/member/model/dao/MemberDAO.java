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
		
		try {
			prop = new Properties();
			
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
				
				loginMember.setMemberNo( rs.getInt(1) );
				loginMember.setMemberId( rs.getString(2) );
				loginMember.setMemberPw( rs.getString(3) );
				loginMember.setMemberNickname( rs.getString(4) );
				loginMember.setEnrollDate( rs.getString(5) );
				
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return loginMember;
	}

	public Member signUp(Connection conn, String query) {
		// TODO Auto-generated method stub
		return null;
	}

}
