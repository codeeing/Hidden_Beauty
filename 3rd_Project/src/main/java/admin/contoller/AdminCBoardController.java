package admin.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import c_board.model.CBoardBean;
import utility.Paging;

@Controller 
public class AdminCBoardController {

	@Autowired
	private AdminDao adminDao; 

	public final String listCommand="/cBoardList.admin";
	public final String viewPage="adminCBoard";
	public final String deleteCommand="/cBoardDelete.admin";
	public final String gotoPage="redirect:/cBoardList.admin";
	private final String commandChkDel = "/cBoardChkDel.admin";
	private final String commandDetail = "/cBoardDetail.admin";
	private final String viewPageDetail = "adminCBoardDetail";
	 
	@RequestMapping(value=listCommand,method=RequestMethod.GET)
	public String goAdmin(
				Model model,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
		Map<String,String> map = new HashMap<String,String>(); 
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = adminDao.getTotalCountC(map);
		String url = request.getContextPath()+listCommand;
		
		String ps="1000";
		
		Paging pageInfo = new Paging(pageNumber,ps,totalCount,url,whatColumn,keyword);
		
		List<CBoardBean> list = adminDao.getAllBoardListC(pageInfo,map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		
		return viewPage;
	}
	
	@RequestMapping(value=deleteCommand,method=RequestMethod.GET)
	public String delete(
				Model model,
				@RequestParam("c_num") int c_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		
		CBoardBean bb = adminDao.selectContentC(c_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		adminDao.deleteBoardC(c_num);
		
		return gotoPage;
	}
	
	@RequestMapping(value = commandChkDel, method = RequestMethod.GET)
	public String c_boardChkDel(Model model, @RequestParam("check") int[] checks, @RequestParam("pageNumber") String pageNumber) {
		adminDao.deleteChkBoardC(checks);
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
	
	@RequestMapping(value = commandDetail, method = RequestMethod.GET)
	public String c_boardDetail(Model model, @RequestParam("c_num") int c_num, @RequestParam("pageNumber") String pageNumber) {
		//cd.updateReadcount(c_num); => 마이페이지 내에서 본인이 조회할 때는 조회수가 오르지 않음.
		CBoardBean cb = adminDao.selectContentC(c_num);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("cb", cb);
		return viewPageDetail;
	}
	
	
	
}