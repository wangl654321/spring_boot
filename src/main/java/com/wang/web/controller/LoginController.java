package com.wang.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wang.module.entity.User;
import com.wang.module.service.UserService;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： wangl
 * 创建时间：  2017-06-2202:01 PM
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
@Controller
@RequestMapping("/login/user")
public class LoginController {


    @Autowired
    private UserService userService;
    
   


    /**
     * @方法说明：用户登录
     * @时间： 2017-04-14 11:40 AM
     * @创建人：wangl
     */
    @RequestMapping(value = "/login")
    public String login(User user, Model model,
                        HttpServletRequest request) {

    	List<User> list = userService.getList();
    	System.out.println(list);
       /* logger.info("用户登录--->{}");
        Subject currentUser = SecurityUtils.getSubject();

        if (!currentUser.isAuthenticated()) {
            // 把用户名和密码封装为 UsernamePasswordToken 对象
            UsernamePasswordToken token = null;
            try {
                Double.parseDouble(user.getName());
                user.setPhone(user.getName());
                token = new UsernamePasswordToken(user.getPhone(), user.getPassword());
            } catch (NumberFormatException e) {
                user.setEmail(user.getName());
                token = new UsernamePasswordToken(user.getEmail(), user.getPassword());
            }

            // 记住我
            token.setRememberMe(true);
            try {
                currentUser.login(token);

            }
            // 所有认证时异常的父类.
            catch (AuthenticationException ae) {
            }
        }*/

        //登录成功
        return "bootstrap/index/index";
    }
    /**
     * @方法说明：用户退出
     * @时间： 2017-04-14 11:40 AM
     * @创建人：wangl
     *//*
    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpServletRequest request) {

        logger.info("用户用户退出--->{}");
        HttpSession session = request.getSession();
        session.removeAttribute("loginUser");
        return "redirect:/";
    }*/

    /**
     * @方法说明：用户找回密码
     * @时间： 2017-04-14 11:40 AM
     * @创建人：wangl
     */
    @RequestMapping(value = "/forgot")
    public String forgot(User user, Model model) {
        model.addAttribute("user", user);
        return "bootstrap/login/forgot";
    }

    /**
     * @方法说明：用户注册跳转
     * @时间： 2017-04-14 11:40 AM
     * @创建人：wangl
     */
    @RequestMapping(value = "/register")
    public String register(User user, Model model) {

        model.addAttribute("user", user);
        return "bootstrap/login/register";
    }

    /**
     * @方法说明：用户注册
     * @时间： 2017-04-14 11:40 AM
     * @创建人：wangl
     */
    @RequestMapping(value = "/save")
    public String save(User user, Model model) {
        user.setPassword(user.getPassword());
        userService.insert(user);
        return "redirect:/";
    }


    /**
     * @方法说明：验证邮箱或者手机号是否存在验证
     * @时间： 2017-04-14 11:40 AM
     * @创建人：wangl
     */
    @ResponseBody
    @RequestMapping(value = "/validation")
    public int validation(@RequestParam(value = "value") String value, User user) {

        try {
            Double.parseDouble(value);
            user.setPhone(value);
        } catch (NumberFormatException e) {
            user.setEmail(value);
        }

        int num = userService.countNum(user);
        return num;
    }

}
