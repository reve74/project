package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.rvboardDTO;


public class rvboardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	//DB연결
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();				
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
				
		con = ds.getConnection();
		
		return con;
	}
	//자원해제
	public void freeResource() {
		try {
			if(rs!=null) {rs.close();}
			if(pstmt!=null) {pstmt.close();}
			if(con!=null) {con.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//리뷰글 입력하기
	public void insertBoard(rvboardDTO rvdto){
		try {
			con = getConnection();
								
			sql="select max(num) from rvboard";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int num=0;
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else {
				num = 1; 
			}
			
			sql = "insert into rvboard "
				+ "(num, id , subject,"
				+ "content, readcount, date, file)"
			    + "values(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, rvdto.getId());
			pstmt.setString(3, rvdto.getSubject());
			pstmt.setString(4, rvdto.getContent());
			pstmt.setInt(5,0);
			pstmt.setTimestamp(6, rvdto.getDate()); 
			pstmt.setString(7, rvdto.getFile());
			
			pstmt.executeUpdate(); 
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();				
		}
		
	}//insertboard  끝
	
	//글 넘버값
	public int boardCount() {
		int count = 0;
		try {
			con = getConnection();
			
			sql="select count(*) from rvboard";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){				
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getCount 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return count;
	}
	//리뷰글 리스트
	public Vector<rvboardDTO>  getBoardList(String keyField, String keyWord){

		Vector<rvboardDTO>  rvboardList = new Vector<rvboardDTO>();
		
		try {
			con = getConnection();
			
			if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "select * from rvboard order by num desc";
			}else{
				sql ="select * from rvboard where " +keyField+
				" like '%" + keyWord + "%' order by num desc";
			}
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				rvboardDTO rvdto = new rvboardDTO();
				rvdto.setId(rs.getString("id"));
				rvdto.setContent(rs.getString("content"));
				rvdto.setDate(rs.getTimestamp("date"));	
				rvdto.setNum(rs.getInt("num"));	
				rvdto.setReadcount(rs.getInt("readcount"));
				rvdto.setSubject(rs.getString("subject"));				
				
				rvboardList.add(rvdto);				
			}//while
					
		} catch (Exception e) {
			System.out.println("getBoardList 실패 : "+e);
		} finally {
			freeResource();
		}
		
		return rvboardList;
	}//getBoardList 끝
	
	/*
	public Vector<rvboardDTO>  getBoardList(int pagefirst, int numPerPage) {
		Vector<rvboardDTO>  rvboardList = new Vector<rvboardDTO>();
		
		try {
			con = getConnection();
			sql = "select * from rvboard order by num desc limit ?,? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pagefirst);
			pstmt.setInt(2, numPerPage);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				rvboardDTO rvdto = new rvboardDTO();
				rvdto.setNum(rs.getInt("num"));
				rvdto.setId(rs.getString("id"));
				rvdto.setSubject(rs.getString("subject"));				
				rvdto.setContent(rs.getString("content"));
				rvdto.setDate(rs.getTimestamp("date"));
				rvdto.setReadcount(rs.getInt("readcount"));
				
				rvboardList.add(rvdto);				
			}//while
					
		} catch (Exception e) {
			System.out.println("getBoardList 실패 : "+e);
		} finally {
			freeResource();
		}
		
		return rvboardList;
	}//getBoardList 끝
	*/
	//리뷰글 조회수
	public void readCount(int num){

		try {
			
			con = getConnection();

			sql = "update rvboard set readcount = readcount + 1 where num="+num;
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
							
		} catch (Exception e) {
			System.out.println("readCount 얻기 실패 : "+e);
		} finally {
			freeResource();
		}	
	}
	
	
	public rvboardDTO getBoard(int num){
		
		rvboardDTO rvdto = null;
		
		try {
			
			con = getConnection();
			
			sql = "select * from rvboard where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);			
			rs = pstmt.executeQuery();  			
			rs.next();
			
			rvdto = new rvboardDTO();			
			rvdto.setContent(rs.getString("content"));
			rvdto.setReadcount(rs.getInt("readcount"));
			rvdto.setId(rs.getString("id"));
			rvdto.setNum(rs.getInt("num"));
			rvdto.setDate(rs.getTimestamp("date"));
			rvdto.setSubject(rs.getString("subject"));
			rvdto.setFile(rs.getString("file"));
			
		
		} catch (Exception e) {
			System.out.println("getBoard 얻기 실패 : "+e);
		} finally {
			freeResource();
		}//finally					
		return rvdto; //getBoard 끝
	}
	
	//리뷰글 수정
	public int updateBoard(rvboardDTO rvdto){
		int check = 0;
		
		try {
			
			con = getConnection();
			
			
			sql ="update rvboard set subject=?, content=?,file=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rvdto.getSubject());
			pstmt.setString(2, rvdto.getContent());
			pstmt.setString(3, rvdto.getFile());
			pstmt.setInt(4, rvdto.getNum());
			//UPDATE
			pstmt.executeUpdate();
				
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();				
		}
		return check;		
	}
	
	//리뷰글 삭제
	public void deleteBoard(int num){		
			
		int check = 0;
		try {
			con = getConnection();

			sql = "delete from rvboard where num=?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			check = pstmt.executeUpdate(); //executeUpdate()메소드는 작업 성공 시 1, 작업 실패시 0 을 반환한다. 잘활용(응용)하도록 ㅋㅋㅋ
			
			if(check == 1 ) {
				sql = "delete from rvcomment where rvnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			freeResource();
		}		

	}
	

	
}
