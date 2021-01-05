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
			context = new InitialContext();// ���α׷�
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();// ����
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
				pw.print("��������<br>");
				pw.print("<a href=\"../deleteForm.jsp\">���������� �̵�</a>");
			}
		} catch (Exception e) {
			pw.print("��������");
			pw.print("<a href=\"../deleteForm.jsp\">���������� �̵�</a>");
			System.out.println("������ ���� ���� : " + e.getMessage());
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				System.out.println("������ �۾� ���� : "+e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}