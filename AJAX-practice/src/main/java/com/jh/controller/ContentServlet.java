package com.jh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ContentServlet
 */
@WebServlet("/content.do")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Map> board = new ArrayList();
		board.add(Map.of("title", "제목1", "content", "내용1", "writer", "작성자1"));
		board.add(Map.of("title", "제목2", "content", "내용2", "writer", "작성자2"));
		board.add(Map.of("title", "제목3", "content", "내용3", "writer", "작성자3"));
		board.add(Map.of("title", "제목4", "content", "내용4", "writer", "작성자4"));
		board.add(Map.of("title", "제목5", "content", "내용5", "writer", "작성자5"));
		
		List<Map> gallary = new ArrayList();
		gallary.add(Map.of("title", "이미지1", "path", "이미지경로1", "content", "내용1"));
		gallary.add(Map.of("title", "이미지2", "path", "이미지경로2", "content", "내용2"));
		gallary.add(Map.of("title", "이미지3", "path", "이미지경로3", "content", "내용3"));
		gallary.add(Map.of("title", "이미지4", "path", "이미지경로4", "content", "내용4"));
		
		response.setContentType("application/json;charset=utf-8");
		switch(request.getParameter("title")) {
			case "board" : new Gson().toJson(board, response.getWriter()); break;
			case "gallary" : new Gson().toJson(gallary, response.getWriter()); break;
			case "movie" : new Gson().toJson(gallary, response.getWriter()); break;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
















