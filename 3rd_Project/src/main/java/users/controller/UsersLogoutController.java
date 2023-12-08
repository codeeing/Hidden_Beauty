package users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UsersLogoutController {
	private final String command = "/logout.u";
	private final String gotoPage = "redirect:/.main";
	
	@RequestMapping(command)
	public String doAction(HttpSession session) {
		session.invalidate();
		System.out.println(1);
		return gotoPage;
	}
}
