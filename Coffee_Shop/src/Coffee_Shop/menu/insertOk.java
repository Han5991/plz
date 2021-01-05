package Coffee_Shop.menu;

import java.io.File;
import java.io.FileInputStream;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/insertOk")
public class insertOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertOk() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		Connection con = null;
		PreparedStatement stmt = null;
		MultipartRequest multi = null;
		Context context = null;
		DataSource dataSource = null;
		int fileSize = 1024 * 1024 * 10; // 10mb�� ���� ũ�⸦ ����
		String uploadFile = null;
		String name = null;
		String type = null;
		int rownum = 0;
		int price = 0;

		String uploadPath = "C:\\Users\\admin\\git\\plz\\Coffee_Shop\\WebContent\\img\\menuImg";

		try {
			context = new InitialContext();// ���α׷�
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();// ����
		} catch (Exception e) {
			System.out.println("����Ŭ �α��� ���� : " + e);
		}

		try {
			multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			name = multi.getParameter("name");
			price = Integer.parseInt(multi.getParameter("price"));
			type = multi.getParameter("type");
			uploadFile = multi.getFilesystemName("image");
		} catch (Exception e) {
			System.out.println("�Ķ���� �� �޾ƿ��� ���� : " + e);
		}

		try {
			File f = new File(uploadPath + "\\" + uploadFile);
			File fileNew = new File(uploadPath + "\\" + type + uploadFile);
			if (f.exists())
				f.renameTo(fileNew);
			FileInputStream fis = new FileInputStream(fileNew);

			stmt = con.prepareStatement("insert into menu values(?,?,?,?)");
			stmt.setString(1, name);
			stmt.setInt(2, price);
			stmt.setBinaryStream(3, fis, (int) fileNew.length());
			stmt.setString(4, fileNew.getName());
			rownum = stmt.executeUpdate();
			if (rownum > 0) {
				pw.print("���Լ���<br>");
				pw.print("<a href=\"../insertForm.jsp\">�Է������� �̵�</a>");
			}
		} catch (Exception e) {
			pw.print("���Խ���");
			pw.print("<a href=\"../insertForm.jsp\">�Է������� �̵�</a>");
			System.out.println("���� ���� : " + e.getMessage());
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				System.out.println("������ �۾� ���� : " + e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
