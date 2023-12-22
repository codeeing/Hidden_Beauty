package q_board.controller;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import q_board.model.QBoardBean;
import q_board.model.QBoardDao;
import users.model.UsersBean;


@Controller
public class QBoardDetailController {
	
	@Autowired
	private QBoardDao qdao;
	 
	
	
	public final String command="/detail.qb";
	public final String viewPage="qBoardDetail";
	public final String viewPage2="redirect:/qBoardDetail";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String toDetailList(
			Model model,HttpSession session,
			@RequestParam(value = "u_id", required = false) String u_id,
			@RequestParam("q_num") int q_num,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("whatColumn") String whatColumn,
			@RequestParam("keyword") String keyword,
			HttpServletResponse response
			) throws Exception {
		
		QBoardBean bb = qdao.selectContent(q_num);
		UsersBean ub = (UsersBean)session.getAttribute("loginInfo");
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("whatColumn",whatColumn);
		model.addAttribute("keyword",keyword);
		model.addAttribute("bb",bb);

	
		PrintWriter out = response.getWriter();
		  
		if(qdao.didYouJoin(ub)) { // 가입 한 회원 혹은 관리자이면
			// 아이디 session 설정
			session.setAttribute("loginInfo", qdao.getUserById(ub.getU_id()));
			if(ub.getU_id().equals("admin")) {
				qdao.updateReadcount(q_num);
				return viewPage;
			}
			else {
				if(session.getAttribute("destination") != null) {
					viewPage = String.valueOf(session.getAttribute("destination"));
				}
				return viewPage;
			}
		} else { 
			response.setContentType("text/html; charset=UTF-8");
			out.print("<script>alert('가입되지 않은 회원입니다.');</script>");
			out.flush();
			return viewPage;
		}
	
		
}
