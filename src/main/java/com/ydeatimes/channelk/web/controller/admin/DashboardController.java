package com.ydeatimes.channelk.web.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
    private static final Logger LOG = LoggerFactory.getLogger(DashboardController.class);

    @RequestMapping("/admin")
    public String dashboard(Model model) {
    	
        return "/admin/dashboard";
    }
    
    
}
