

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.ItemDetailViewModel;

/**
 * Servlet implementation class ItemDetailServlet
 */
@WebServlet("/shopping/itemDetail")
public class ItemDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemCd = request.getParameter("selectedCode");
		ItemDetailViewModel vm = new ItemDetailViewModel(itemCd);

		request.setAttribute(ItemDetailViewModel.class.getSimpleName(), vm);
		request.getRequestDispatcher("/shopping/itemDetail.jsp").forward(request, response);
	}

}
