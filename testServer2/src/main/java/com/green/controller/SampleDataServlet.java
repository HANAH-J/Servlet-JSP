package com.green.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.green.dao.Repository;

public class SampleDataServlet extends HttpServlet {
	
	Repository repo = Repository.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		repo.inputSample();
		
		request.getRequestDispatcher("index.html").forward(request, response);
	}
}