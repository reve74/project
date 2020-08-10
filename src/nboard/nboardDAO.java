package nboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.rvboardDTO;


public class nboardDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
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
				if(con!=null) {con.close();}
				if(pstmt!=null) {pstmt.close();}
				if(rs!=null) {rs.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		//공지 글 입력하기
		public void insertBoard(nboardDTO ndto) {
			
			try {
				con = getConnection();
				sql = "select max(num) from nboard";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				int num = 0;
				
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				}else {
					num = 1;
				}
				
				sql = "insert into nboard "
					+ "(num, id, subject, content, file, readcount, date)"
					+ "values(?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2,ndto.getId() );
				pstmt.setString(3, ndto.getSubject());
				pstmt.setString(4, ndto.getContent());
				pstmt.setString(5, ndto.getFile());
				pstmt.setInt(6, ndto.getReadcount());
				pstmt.setTimestamp(7, ndto.getDate());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("insertBoard메소드 내부에서 오류 : " + e);
			}finally {
				freeResource();
			}
		}
		//글 리스트 얻기
		public Vector<nboardDTO> getBoardList(String keyField, String keyWord) {
			
			Vector<nboardDTO> nboardList = new Vector<nboardDTO>();
			
			try {
				con = getConnection();
				
				if(keyWord == null || keyWord.isEmpty() || keyWord.equals(null)) {
					sql = "select * from nboard order by num desc";
				}else {
					sql = "select * from nboard where " + keyField +
						  "like '%" + keyWord + "%' order by num desc";
				}
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					nboardDTO ndto = new nboardDTO();
					ndto.setId(rs.getString("id"));
					ndto.setNum(rs.getInt("num"));
					ndto.setSubject(rs.getString("subject"));
					ndto.setContent(rs.getString("content"));
					ndto.setReadcount(rs.getInt("readcount"));
					ndto.setDate(rs.getTimestamp("date"));
				
					nboardList.add(ndto);
				}//while
				
				
			}catch (Exception e) {
				System.out.println("getBoardList 메소드 내부에서 오류 : " + e);
			}finally {
				freeResource();
			}
			return nboardList;
		}
		//글 삭제
		public void deleteboard(int num) {
			
			try {
				con = getConnection();
				sql = "delete from nboard where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("deleteboard 메소드 내부에서 오류 : " + e);
			}finally {
				freeResource();
			}
			
		}
		
		public void readCount(int num){

			try {
				
				con = getConnection();

				sql = "update nboard set readcount = readcount + 1 where num="+num;
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.executeUpdate();
								
			} catch (Exception e) {
				System.out.println("readCount 얻기 실패 : "+e);
			} finally {
				freeResource();
			}	
		}
		
		public nboardDTO getBoard(int num){
			
			nboardDTO ndto = null;
			
			try {
				
				con = getConnection();
				
				sql = "select * from nboard where num=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);			
				rs = pstmt.executeQuery();  			
				rs.next();
				
				ndto = new nboardDTO();			
				ndto.setContent(rs.getString("content"));
				ndto.setReadcount(rs.getInt("readcount"));
				ndto.setId(rs.getString("id"));
				ndto.setNum(rs.getInt("num"));
				ndto.setDate(rs.getTimestamp("date"));
				ndto.setSubject(rs.getString("subject"));
				ndto.setFile(rs.getString("file"));
				
			
			} catch (Exception e) {
				System.out.println("getBoard 얻기 실패 : "+e);
			} finally {
				freeResource();
			}//finally					
			return ndto; //getBoard 끝
		}
		
		//글 넘버값
		public int boardCount() {
			int count = 0;
			try {
				con = getConnection();
				
				sql="select count(*) from nboard";
				
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
		
		public int updateBoard(nboardDTO ndto){
			int check = 0;
			
			try {
				
				con = getConnection();
				
				
				sql ="update rvboard set subject=?, content=?,file=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, ndto.getSubject());
				pstmt.setString(2, ndto.getContent());
				pstmt.setString(3, ndto.getFile());
				pstmt.setInt(4, ndto.getNum());
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
		
}
