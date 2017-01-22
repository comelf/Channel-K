package com.ydeatimes.channelk.web.controller.admin;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ydeatimes.channelk.web.model.User;
import com.ydeatimes.channelk.web.service.UserDBManager;
import com.ydeatimes.channelk.web.util.Paging;

@Controller
public class UsersController {
    private static final Logger LOG = LoggerFactory.getLogger(UsersController.class);

    private int count = 20;
    
	@Autowired
	UserDBManager userManager;
    
    @RequestMapping(value="/user/login", method=RequestMethod.GET)
    public String adminLogin(@RequestParam(defaultValue="0", required=false) int login_error, Model model) {
    	
    	if(login_error==1){
    		model.addAttribute("msg", "아이디나 비밀번호가 잘못되었습니다.");
    	}
    	if(login_error==2){
    		model.addAttribute("msg", "접근권한이 업습니다.");
    	}
    	
        return "/user/login";
    }

    @RequestMapping(value="/user/loginSuccess", method=RequestMethod.GET)
    public String adminLoginSuccess(HttpSession session) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getDetails();
        session.setAttribute("userLoginInfo", userDetails);
        return "redirect:/";
    }

    @RequestMapping(value="/user/logout", method=RequestMethod.POST)
     public String adminLogout(HttpSession session) {
    	UserDetails userDetails = (UserDetails)session.getAttribute("userLoginInfo");
        session.invalidate();
        return "/user/login";
    }
    
    @RequestMapping(value="/user/denied", method=RequestMethod.GET)
    public String accessDenied(Model model) {
    	model.addAttribute("login_error", 2);
        return "redirect:/user/login";
    }
    
    @RequestMapping(value="/admin/user/list", method=RequestMethod.GET)
    public String userList(@RequestParam(defaultValue="1", required=false) int page, Model model) {

		int start = (page - 1);
		
		Pageable pageable = new PageRequest(start, count);
		
		Page<User> userList =  userManager.findAllUser(pageable);
		
		
		model.addAttribute("userList", userList.getContent());
		model.addAttribute("paging", new Paging(page, (int)userList.getTotalElements(), count));	
        return "/admin/user/list";
    }
    
    @RequestMapping(value="/admin/user/add", method=RequestMethod.GET)
    public String userAdd(Model model) {
    	model.addAttribute("createUser", new User());
        return "/admin/user/add";
    }
    
    @RequestMapping(value="/admin/user/create", method=RequestMethod.POST)
    public String createUser(@Valid User user, BindingResult bindingResult, Model model) {
    	model.addAttribute("createUser", user);
    	if(bindingResult.hasErrors()){
    		return "/admin/user/add";
		}
		
		if(userManager.isExistentUser(user)){
			model.addAttribute("msg", "이미 존재하는 사용자입니다.");
			return "/admin/user/add";
		}
		
		userManager.createUserInAdminPage(user);
		model.addAttribute("msg", "사용자를 추가하였습니다.");
		model.addAttribute("createUser", new User());
		return "/admin/user/add";
    }

}
