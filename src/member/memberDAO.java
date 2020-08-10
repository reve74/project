package member;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class memberDAO {
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
	
	//회원가입
	public int insertMember(memberDTO dto) {
		
		int check = 0;
		
		try {
			con = getConnection();
			
			sql = "insert into cmember(id,pass,reg_date,name,phone,email,gender,birth,postcode,addr1,addr2)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setTimestamp(3, dto.getReg_date());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getGender());
			pstmt.setInt(8, dto.getBirth());
			pstmt.setString(9, dto.getPostcode());
			pstmt.setString(10, dto.getAddr1());
			pstmt.setString(11, dto.getAddr2());
			
			check =  pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return check;
	}
	
	//회원 체크
	public int userCheck(String id, String pass){
		
		int check = -1;   
	
		try {

			con = getConnection();
			
			sql = "select * from cmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if(rs.next()){ 
				if(pass.equals(rs.getString("pass"))){
					
					check=1;
				}else{ 
					
					check=0; 
				}
				
			}else{
				check = -1; 
			}
			
		} catch (Exception e) {
			System.out.println("userCheck 얻기 실패 : "+e);
		} finally {
			freeResource();
		}
					
		return check;
	}//userCheck 끝
	
	//회원목록
	public memberDTO getMember(String id){

			memberDTO bdto = null;
			
			try {
				con = getConnection();

				sql = "select * from cmember where id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);			
				rs = pstmt.executeQuery();  			
				rs.next();
				
				bdto = new memberDTO();			
				bdto.setAddr1(rs.getString("addr1"));
				bdto.setAddr2(rs.getString("addr2"));
				bdto.setPostcode(rs.getString("postcode"));
				bdto.setBirth(rs.getInt("birth"));
				bdto.setEmail(rs.getString("email"));
				bdto.setGender(rs.getString("gender"));
				bdto.setId(rs.getString("id"));
				bdto.setName(rs.getString("name"));
				bdto.setPass(rs.getString("pass"));
				bdto.setPhone(rs.getString("phone"));
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				freeResource();
			}//finally					
			return bdto; 
		}//getMember 메소드 끝

	//회원정보 수정
	public int updateMember(memberDTO mdto){
		int check = 0;
		
		try {
			con = getConnection();
			
				sql ="update cmember set pass=?, name=?, phone=?, email=?, gender=?, birth=?, postcode=?, addr1=?, addr2=? where id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, mdto.getPass());
				pstmt.setString(2, mdto.getName());
				pstmt.setString(3, mdto.getPhone());
				pstmt.setString(4, mdto.getEmail());
				pstmt.setString(5, mdto.getGender());
				pstmt.setInt(6, mdto.getBirth());
				pstmt.setString(7, mdto.getPostcode());
				pstmt.setString(8, mdto.getAddr1());
				pstmt.setString(9, mdto.getAddr2());
				pstmt.setString(10, mdto.getId());
				//UPDATE
				check = pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("updateMember 실패 : "+e);
	
		}finally {
			freeResource();		
		}	
		return check;
	} //updateMember끝
	
	//ID 중복체크
	public int idCheck(String id){

		int check = 0;
		
		try {
			con = getConnection();

			sql = "select * from cmember where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){ 
				check = 1;
			}else{
				check = 0;
			}
		} catch (Exception e) {
			System.out.println("idCheck 실패 : "+e);
		} finally {
			freeResource();
		}	
		
		return check;
	}
	
	//비밀번호 찾기
	public int getPass(String id,String pass) {
		int check = 0;
		try {
			con = getConnection();
			sql = "select pass from cmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					check = 1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("비밀번호 얻기 실패 :"+e);
		}finally {
			freeResource();
		}
		
		return check;
	}
	
	//회원탈퇴
	public void deleteMember(String id) {
		try {
			getConnection();
			
			sql="delete from cmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.err.println("회원 탈퇴 실패 : "+e);
		}finally {
			freeResource();
		}
	}
	
	public int confirm(String name, String email) {
		
		int check = 0;
		
		try {
			con = getConnection();
			
			sql = "select * from cmember where name=? and email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 1;
			}
			
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return check;
	}
	//ID찾기
	public String getID(String name, String email) {
	
		String id="";
		
		try {
			con = getConnection();
			
			sql = "select id from cmember where name=? and email=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			id=rs.getString(1);
			
		} catch (Exception e) {
			System.out.println("insert 실패 : "+e);
		}finally {
			freeResource();
		}
		
		return id;
	}
	
	
	
}//class 끝
