package Coffee_Shop.menu;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/deleteOk")
public class deleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteOk() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con = null;
		PreparedStatement stmt = null;
		Context context = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		DataSource dataSource = null;
		String delete = null;
		int rownum = 0;
		boolean de = false;

		String uploadPath = "C:\\Users\\admin\\git\\plz\\Coffee_Shop\\WebContent\\img\\menuImg";

		try {
			context = new InitialContext();// 프로그램
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();// 연결
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			delete = request.getParameter("delete");
			stmt = con.prepareStatement("DELETE FROM menu WHERE filename='" + delete+"'");
			rownum = stmt.executeUpdate();
			File f = new File(uploadPath + "\\" + delete);
			if (f.exists())
				de = f.delete();
			if (rownum > 0 && de == true) {
				pw.print("삭제성공<br>");
				pw.print("<a href=\"../deleteForm.jsp\">삭제폼으로 이동</a>");
			}
		} catch (Exception e) {
			pw.print("삭제실패");
			pw.print("<a href=\"../deleteForm.jsp\">삭제폼으로 이동</a>");
			System.out.println("쿼리문 실행 실패 : " + e.getMessage());
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				System.out.println("마무리 작업 실패 : "+e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}