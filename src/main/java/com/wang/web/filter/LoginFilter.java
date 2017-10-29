package com.wang.web.filter;

import com.wang.module.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： wangl
 * 创建时间：  2017-07-0410:50 AM
 * 创建描述：
 *
 * 修 改 者：  
 * 修改时间： 
 * 修改描述： 
 *
 * 审 核 者：
 * 审核时间：
 * 审核描述：
 *
 */
@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse)resp ;

        // 获得用户请求的URI
        String path = request.getRequestURI();
        if(path.equals("/")) {
            chain.doFilter(request, response);
            return;
        }

        User user= (User) request.getSession().getAttribute("loginUser");
        if(null == user){
            String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
            response.sendRedirect(url+"/");
        }else{
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
