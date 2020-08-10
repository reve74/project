package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class rvcommentDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	//DB연결
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();				
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
				
		con = ds.getConnection();
		
		return con;
	}
	//자원해제
	public void freeResource(){
		if(con != null){try {con.close();} catch (SQLException e) {e.printStackTrace();}}
		if(rs != null){try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
		if(pstmt != null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
	}
	
	//댓글입력
	public void insertcomment(rvcommentDTO rvcdto){
		int num = 0;
		try {
			con = getConnection();
								
			sql="select max(num) from rvcomment";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else {
				num = 1; 
			}
			
			sql = "insert into rvcomment "
				+ "(num, rvnum, id, content, date)"
			    + "values(?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, rvcdto.getRvnum());
			pstmt.setString(3, rvcdto.getId());
			pstmt.setString(4, rvcdto.getContent());
			pstmt.setTimestamp(5,rvcdto.getDate()); 
			
			pstmt.executeUpdate(); 
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();				
		}
		
	}
	
	
	public int getCommentCount(int num) {
		int rp_count = 0;
		
		try {
			con = getConnection();
			
			sql="select count(*) from rvcomment where rvnum="+num;
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){				
				rp_count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getCommentCount 실패"+e);
		}finally {
			freeResource();
		}
		
		return rp_count;
	}
	
	//댓글 목록
	public ArrayList<rvcommentDTO> getCommentList(int num) {
		ArrayList<rvcommentDTO> rp_list = new ArrayList<rvcommentDTO>();
		
		try {
			con = getConnection();
			
			sql = "select * from rvcomment where rvnum=? order by num asc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				rvcommentDTO rvcdto = new rvcommentDTO();
				rvcdto.setContent(rs.getString("content"));
				rvcdto.setDate(rs.getTimestamp("date"));
				rvcdto.setId(rs.getString("id"));
				rvcdto.setNum(rs.getInt("num"));
				rvcdto.setRvnum(rs.getInt("rvnum"));
				
				rp_list.add(rvcdto);
			}
			
		} catch (Exception e) {
			System.out.println("getCommentList 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return rp_list;
	}
	
	//댓글 삭제
	public int deleteComment(int num){		
		
		int result = 0;
		try {
			con = getConnection();

			sql = "delete from rvcomment where num=?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			 result= pstmt.executeUpdate();								
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			freeResource();
		}		
		return result;
	}
	
}
