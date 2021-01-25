package oder;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/receiptPrint.do")
public class receiptPrint extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public receiptPrint() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num = request.getParameter("odernum");
		RequestDispatcher dispatcher = request.getRequestDispatcher("kiosk/receiptPrint.jsp");
		String oder = OderDao.getInstance().getOneOder(num);
		request.setAttribute("oneOder", oder);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
