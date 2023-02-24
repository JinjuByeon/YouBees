package com.yb.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

		HttpSession session = request.getSession();
		if(session.getAttribute("loginUserC") != null) {
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용가능 합니다");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
}
