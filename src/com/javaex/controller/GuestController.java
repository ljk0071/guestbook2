package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.guestVo.GuestVo;
import com.javaex.guestdao.GuestDao;
import com.javaex.util.WebUtil;

/**
 * Servlet implementation class GuestController
 */
@WebServlet("/gc")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		GuestDao GuestDao = new GuestDao();
		List<GuestVo> guestList = GuestDao.SelectAll();

		String action = request.getParameter("action");
		if (action.equals("addList")) {
			request.setAttribute("gList", guestList);
			WebUtil.forward(request, response, "WEB-INF/addList.jsp");

		} else if (action.equals("write")) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			String regDate = request.getParameter("regDate");

			GuestVo GuestVo = new GuestVo(name, password, content, regDate);
			GuestDao.Insert(GuestVo);

			WebUtil.redirect(request, response, "/guestbook2/gc?action=addList");

		} else if (action.equals("delete")) {
			String no = request.getParameter("no");
			GuestDao.Delete(Integer.parseInt(no));
			WebUtil.redirect(request, response, "/guestbook2/gc?action=addList");

		} else if (action.equals("deleteform")) {
			WebUtil.forward(request, response, "WEB-INF/deleteForm.jsp");
		} else {
			System.out.println("action파라미터 없음");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
