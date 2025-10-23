package control;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Moperation;

/**
 * カートに商品を追加するサーブレット
 * @author M.Takahashi
 */
@WebServlet("/add-prod-servlet")
public class AddProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// パラメータ取得
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));

		// セッションオブジェクト取得
		HttpSession session = request.getSession();
		
		// カートへの商品追加処理
		Moperation op = new Moperation();
		op.addProd(idx, session);

		// 転送先設定
		String url = "cart.jsp";
		
		// 転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
