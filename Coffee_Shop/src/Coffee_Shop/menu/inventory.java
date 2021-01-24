package Coffee_Shop.menu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/inventory", "/inventoryUpdate.do" })
public class inventory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public inventory() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] menu = request.getParameterValues("menu");
		String[] stock = request.getParameterValues("stock3");
		for (String a : menu)
			System.out.print(a);
		System.out.println();
		for (String a : stock)
			System.out.print(a);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
