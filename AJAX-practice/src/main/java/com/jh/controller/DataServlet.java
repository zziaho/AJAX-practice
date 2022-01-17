package com.jh.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/data.do")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Integer> number = Arrays.asList(new Integer[]{1, 2, 3, 4});
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Thread t = new Thread(()->{
			while(true) {
				try {
					Thread.sleep(5000);
					number.add((int)(Math.random() * 100));
				}catch(InterruptedException e) {
					e.printStackTrace();
				}
			}
		});
		t.start();
		new Gson().toJson(number, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
