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
 * ログイン処理を行うサーブレット
 * @author M.Takahashi
 */
@WebServlet("/login-servlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");

		// ログイン処理
		HttpSession session = request.getSession();	// セッションオブジェクト取得
		Moperation op = new Moperation();
		boolean result = op.loginProc(userId, password, session);

		// 転送先設定
		String url = "select.jsp";
		if (!result) {					// エラーの場合にはログイン画面に戻す
			request.setAttribute("errorMsg", "ユーザID または パスワードに 誤りがあります。");	
			url = "login.jsp";
		}
		
		// 転送
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
