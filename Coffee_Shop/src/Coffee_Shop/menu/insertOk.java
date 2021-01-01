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

@WebServlet("/HanSangwook/insertOk")
public class insertOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertOk() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		int fileSize = 1024 * 1024 * 10; // 10mb로 파일 크기를 제한
		String uploadPath = "C:\\Users\\user\\git\\plz\\Coffee_Shop\\WebContent\\img2";
		String uploadFile = null;
		Connection con = null;
		PreparedStatement stmt = null;
		MultipartRequest multi = null;
		String name = null;
		int rownum = 0;

		Context context = null;
		DataSource dataSource = null;

		try {
			context = new InitialContext();// 프로그램
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();// 연결
		} catch (Exception e) {
			e.printStackTrace();
		}

		int price = 0;
		try {
			multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			name = multi.getParameter("name");
			price = Integer.parseInt(multi.getParameter("price"));
			uploadFile = multi.getFilesystemName("image");
		} catch (Exception e) {
			System.out.println(e);
		}
		try {
			File f = new File(uploadPath + "\\" + uploadFile);
			FileInputStream fis = new FileInputStream(f);

			stmt = con.prepareStatement("insert into menu values(?,?,?)");
			stmt.setString(1, name);
			stmt.setInt(2, price);
			stmt.setBinaryStream(3, fis, (int) f.length());
			rownum = stmt.executeUpdate();
			if (rownum > 0) {
				System.out.println("삽입성공");
				pw.print("삽입성공");
			} else {
				System.out.println("실패");
				pw.print("삽입실패");
			}
		} catch (Exception e) {
			System.out.println("여긴가" + e.getMessage());
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
