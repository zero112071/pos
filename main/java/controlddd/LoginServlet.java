package controlddd;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import model.EmployeeBean;
import service.EmployeeService;

@WebServlet("/Login_v3/Login.controller")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private EmployeeService employeeService;
	
	@Override
	public void init() throws ServletException {
		System.out.println("init in");
		ApplicationContext context = (ApplicationContext) this.getServletContext()
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		employeeService = (EmployeeService) context.getBean("employeeService");
		System.out.println("init ok");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//接收資料
		String eid = request.getParameter("eid");
		String pwd = request.getParameter("pwd");
		System.out.println(eid);
		System.out.println(pwd);

//驗證資料
		Map<String, String> errorMsgs = new HashMap<>();
		request.setAttribute("errors", errorMsgs);

		if (eid == null || eid.length() == 0) {
			errorMsgs.put("xxx1", "請輸入員工編號");
		}
		if (pwd == null || pwd.length() == 0) {
			errorMsgs.put("xxx2", "請輸入密碼");
		}
		if (errorMsgs != null && !errorMsgs.isEmpty()) {
			request.getRequestDispatcher("/Login_v3/List.jsp").forward(request, response);
			return;
		}

//呼叫MODEL
		EmployeeBean bean = employeeService.login(eid, pwd);

//根據MODEL執行結果呼叫VIEW
		if (bean == null) {
			errorMsgs.put("xxx2", "Login failed, please try again.");
			request.getRequestDispatcher("/Login_v3/Login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);

			String path = request.getContextPath();
			response.sendRedirect(path + "/Login_v3/AllOrder.jsp"); // 管理頁面
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
