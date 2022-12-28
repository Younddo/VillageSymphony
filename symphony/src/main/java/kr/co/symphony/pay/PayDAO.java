package kr.co.symphony.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class PayDAO {
	
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public PayDAO() {
		dbopen = new DBOpen();
	}

	//강사명
	public String name(int c_id) {
		
		String name = "";

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append("SELECT (SELECT UNAME FROM USER_TB WHERE ID = A.ID ) NAME FROM LESSON_TB A WHERE C_ID = ?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, c_id);

			rs = pstmt.executeQuery();
			rs.next();
			
			name = rs.getString("NAME");

		} catch (Exception e) {
			System.out.println("강사명 가져오기 실패 : " + e);

		} finally {
			DBClose.close(con, pstmt, rs);
		} // end

		return name;
	}

	//주문
	public int insPayment(PaymentDTO payment) {
		
		System.out.println("insPayment() >>>>> " + payment);
		
		int cnt = 0;
		
		try {
			con = dbopen.getConnection();		
			
			sql = new StringBuilder();		
			sql.append("INSERT INTO PAYMENT_TB (ORDER_ID, ID, PAY_TIME, T_PAY, C_ID, PAY_WITH, CONFIRM)");
			sql.append("VALUES ((SELECT NVL(MAX(ORDER_ID),'0')+1 FROM PAYMENT_TB), ?, SYSDATE, ?, ?,'MONEY', 'Y')");
			
			pstmt = con.prepareStatement(sql.toString()); 
			pstmt.setString(1, payment.getId());
			pstmt.setInt(2, payment.gettPay());
			pstmt.setInt(3, payment.getC_id());

			cnt = pstmt.executeUpdate();	
			
		}catch(Exception e) {
			System.out.println("주문 실패 : " + e);
		
		}finally {
			DBClose.close(con, pstmt);
		}//end

		return cnt;
		
	}
	
	//주문 순번 최대값
	public int maxOderId() {
		
		System.out.println("maxOderId()");
		
		int maxOderId = 0;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append("SELECT NVL(MAX(ORDER_ID),'0')+1 AS maxOderId FROM PAYDETAIL_TB");

			pstmt = con.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();
			rs.next();
			
			maxOderId = rs.getInt("maxOderId");

		} catch (Exception e) {
			System.out.println("강사명 가져오기 실패 : " + e);

		} finally {
			DBClose.close(con, pstmt, rs);
		} // end

		return maxOderId;
	}

	//주문 상세
	public int insPayDetail(ArrayList<PayDTO> newDtos, int maxOderId) {
		
		System.out.println("insPayDetail() >>>>> " + newDtos.toString());
		
		int cnt = 0;
		
		try {
			con = dbopen.getConnection();		
			
			//가지고 온 날짜와 시간 모두 인설트 해야 하므로 반복문 사용
			for(int i = 0; i < newDtos.size(); i++) {
				
				PayDTO dto = newDtos.get(i);
				
				sql = new StringBuilder();		
				sql.append("INSERT INTO PAYDETAIL_TB (ORDER_ID, S_TIME, S_DATE, T_TIME) VALUES (?, ?, ?, '1')");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, maxOderId);
				pstmt.setString(2, dto.getC_time());
				pstmt.setString(3, dto.getC_date());
				
				cnt += pstmt.executeUpdate();
			}

			System.out.println("insert 수 : "+ cnt);
			
		}catch(Exception e) {
			System.out.println("주문 실패 : " + e);
		
		}finally {
			DBClose.close(con, pstmt);
		}//end
		
		return cnt;
	}

}