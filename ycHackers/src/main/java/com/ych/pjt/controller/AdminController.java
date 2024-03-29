package com.ych.pjt.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ych.pjt.command.ChangeGradeCommand;
import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.InfoBoardHomeCommand;
import com.ych.pjt.command.InfoBoardListCommand;
import com.ych.pjt.command.InfoBoardManageCommand;
import com.ych.pjt.command.InfoBoardPagelistCommand;
import com.ych.pjt.command.InfoManagePagelistCommand;
import com.ych.pjt.command.InfoModifyCommand;
import com.ych.pjt.command.InfoModifyViewCommand;
import com.ych.pjt.command.InfoReplyListAdminCommand;
import com.ych.pjt.command.InfoReplyDeleteCommand;
import com.ych.pjt.command.InfoReplyInsertCommand;
import com.ych.pjt.command.InfoReplyTermCommand;
import com.ych.pjt.command.InfoBoardWriteCommand;
import com.ych.pjt.command.InfoDeleteCommand;
import com.ych.pjt.command.InfoDetailsReplyListCommand;
import com.ych.pjt.command.InfoDetailsModalCommand;
import com.ych.pjt.command.InfoDetailsPreviewCommand;
import com.ych.pjt.command.InfoDetailsUserCommand;
import com.ych.pjt.command.InfoListMainCommand;
import com.ych.pjt.command.UserGradeCommand;
import com.ych.pjt.command.UserSearchCommand;
import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

@Controller
public class AdminController {
	private IYchCommand com;
	
	private AdminDao adDao;
	@Autowired
	public void setAdDao(AdminDao adDao) {
		this.adDao = adDao;
		Constant.adDao=adDao;
	}
	
/*admin page*/
	@RequestMapping("/admin")
	public String admin(HttpServletRequest req,Model model) {
		System.out.println("admin page request");
		//공지 게시판 최근 10개 호출 command
		com=new InfoListMainCommand();
		com.execute(req, model);
		//page 정보 관련 data 호출 command
		return "adminPage";
	}	
	
/*공지게시판 관련 request*/
	//home.jsp에서 접근하는 infoBoard list
	@RequestMapping("/infoBoardHome")
	public String infoBoardHome(HttpServletRequest req, Model model) {
		System.out.println("infoBoard show from Home request");
		com = new InfoBoardHomeCommand();
		com.execute(req, model);
		return "infoBoardHome";
	}
	//information board list
	@RequestMapping("/infoBoard")
	public String infoBoardList(HttpServletRequest req,Model model) {
		System.out.println("infoBoardList request");
		com=new InfoBoardListCommand();
		com.execute(req, model);
		return "infoBoard";
	}
	//infoBoard pagination
	@RequestMapping("/infoBoardPageList")
	public String infoBoardPageList(HttpServletRequest req, Model model) {
		String pageNum = req.getParameter("pageNo");
		System.out.println("infoBoard page List request: "+pageNum);
		com=new InfoBoardPagelistCommand();
		com.execute(req, model);
		return "infoBoardPageList";
	}
	//when someone click pagination
	@RequestMapping("/infoPList")
	public String infoPList(HttpServletRequest req, Model model) {
		String pageNum = req.getParameter("pageNo");
		System.out.println("infoBoard page request: "+pageNum);
		com=new InfoManagePagelistCommand();
		com.execute(req, model);
		return "infoManagePageList";
	}
	//infoBoard List in Admin page
	@RequestMapping("/infoBoardManage")
	public String infoBoardManage(HttpServletRequest req, Model model) {
		System.out.println("infoBoardManage request");
		com = new InfoBoardManageCommand();
		com.execute(req, model);
		return "infoBoardManage";
	}
	//Form to write information Board
	@RequestMapping("/infoBoardWriteForm")
	public String infoBoardWriteForm() {
		System.out.println("infoBoardWriteForm request");
		return "infoBoardWriteForm";
	}
	//Using CK editor for file upload in information Board
	@RequestMapping("/infoCKedit")
	public void infoCKedit(MultipartHttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("CK editor image upload");
		String image_request_path = "/pjt/editUpload/";
		String tomcat_request_path = req.getSession().getServletContext().getRealPath(image_request_path);
		System.out.println("##tomcat path: "+tomcat_request_path);
		
		//multipartFile로 파일 저장
		MultipartFile mf = req.getFile("upload");//ckeditor module의 name attribute
		String originFileName = mf.getOriginalFilename();
		long fileSize=mf.getSize();
		System.out.println("##upload file(size): "+originFileName+"("+fileSize+" bytes)");
		
		String uuid = UUID.randomUUID().toString();

		String resources_path = "/Users/choikmacbookair/Desktop/workspace/ycHacker/ycHackers/src/main/webapp/resources/editUpload/";
		String tomcat_path="/Users/tomcat/apache-tomcat-9.0.63/wtpwebapps/ycHackers/resources/editUpload/";
		String safeFilePath1=resources_path+uuid+originFileName;
		String safeFilePath2=tomcat_path+uuid+originFileName;
		System.out.println("##save file path: "+safeFilePath1);
		String changeFileName=uuid+originFileName;
		try {
			mf.transferTo(new File(safeFilePath1));
			mf.transferTo(new File(safeFilePath2));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//저장 후 CK Editor에 표시하기위한 data를 JSON으로 전달
		JSONObject editorData = new JSONObject();
		//upload: true
		editorData.put("uploaded", true);

		//노트엔 이렇게 적힘 
		//url: protocol(scheme)://도메인(서버주소:포트)/request 경로/파일명
		//https://localhost:8443/pjt/editUpload/0f5f307b-4c20-495a-9d54-8c4a7f40263aimg_avatar3.png
		//req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+image_request_path+changeFileName
		String requestURL=req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+image_request_path+changeFileName;
		editorData.put("url",requestURL);
		System.out.println("##uploaded URL: "+(String)editorData.get("url"));
		
		//response로 CK editor module에 전송
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		res.getWriter().print(editorData.toString());
	}
	//Insert into infoBoard DB
	@RequestMapping(value="/infoWrite",produces="application/text;charset=UTF8")
	public String infoWrite(HttpServletRequest req, Model model) {
		System.out.println("infoWrite request");
		com= new InfoBoardWriteCommand();
		com.execute(req, model);
		System.out.println("infoBoard write Complete: "+req.getParameter("infoTitle"));

		com = new InfoBoardManageCommand();
		com.execute(req, model);
		System.out.println("(infoWrite request)infoBoardList");
		return "infoBoardManage";
	}
	//view details(infoBoard) for home.jsp
	@RequestMapping(value="/infoDetailsHome",produces="application/text;charset=UTF8")
	@ResponseBody
	public String infoDetailsHome(HttpServletRequest req, Model model) {
		System.out.println("infoDetailsHome request > infoModal");
		com = new InfoDetailsModalCommand();
		com.execute(req, model);
		String modalData = (String)req.getAttribute("modalData");
		return modalData;
	}
	//view details(infoBoard) for User(main/infoBoard tab)
	@RequestMapping("/infoDetailsUser")
	public String infoDetailsUser(HttpServletRequest req, Model model) {
		System.out.println("infoDetailsUser request");
		com = new InfoDetailsUserCommand();
		com.execute(req, model);
		//reply list
		String infoGroup =req.getParameter("infoNum");
		System.out.println("infoReply list in detailsUser: "+infoGroup);
		com=new InfoDetailsReplyListCommand();
		com.execute(req, model);
		
		return "infoDetailsUser";
	}
	//view details(infoBoard) for Admin
	@RequestMapping("/infoDetailsPreview")
	public String infoDetailsPreview(HttpServletRequest req, Model model) {
		System.out.println("infoDetailsPreview request");
		com=new InfoDetailsPreviewCommand();
		com.execute(req, model);
		return "infoDetailsPreview";
	}
	//form modifying infoBoard
	@RequestMapping("/infoModifyView")
	public String infoModifyView(HttpServletRequest req, Model model) {
		System.out.println("infoModifyView request");
		com=new InfoModifyViewCommand();
		com.execute(req, model);
		return "infoModifyView";
	}
	//modify infoBoard request with infoNum
	@RequestMapping(value="/infoModify",produces="application/text;charset=UTF8")
	public String infoModify(HttpServletRequest req, Model model) {
		System.out.println("infoModify request");
		com=new InfoModifyCommand();
		com.execute(req, model);
		//admin으로 재호출
		com=new InfoListMainCommand();
		com.execute(req, model);
		return "adminPage";	
	}
	//delete infoBoard request with infoNum
	@RequestMapping("/infoDelete")
	public String infoDelete(HttpServletRequest req,Model model) {
		System.out.println("infoDelete request");
		com=new InfoDeleteCommand();
		com.execute(req, model);
		//admin으로 재호출
		com=new InfoListMainCommand();
		com.execute(req, model);
		return "adminPage";	
	}
	//Before insert infoBoard reply, check in 10 minute
	@RequestMapping(value="/infoReplyTerm",produces="application/text;charset=UTF8")
	@ResponseBody
	public String infoReplyTerm(HttpServletRequest req, Model model) {
		System.out.println("confirm infoBoard item made in 10 minutes");
		
		com=new InfoReplyTermCommand();
		com.execute(req, model);
		String termCheck = (String)req.getAttribute("result");
		System.out.println("term check: "+termCheck);
		
		return termCheck;
	}
	//info reply upload > redirection detailsView
	@RequestMapping("/infoReply")
	public String infoReply(HttpServletRequest req, Model model) {
		//reply insert command
		System.out.println("infoReply insert request");
		com=new InfoReplyInsertCommand();
		com.execute(req, model);
		//hit을 제외한 details
		String infoNum =req.getParameter("infoGroup");
		System.out.println("infoDetails reload: "+infoNum);
		com=new InfoDetailsPreviewCommand();
		com.execute(req, model);
		//reply list
		String infoGroup =infoNum;
		System.out.println("infoReply list in detailsUser: "+infoGroup);
		com=new InfoDetailsReplyListCommand();
		com.execute(req, model);

		return "infoDetailsUser";
	}
	@RequestMapping("/replyDelete")
	public String replyDelete(HttpServletRequest req, Model model) {
		System.out.println("replyDelete: "+req.getParameter("replyNum"));
		com=new InfoReplyDeleteCommand();
		com.execute(req, model);
		//hit을 제외한 details
		System.out.println("reload: "+req.getParameter("infoNum"));
		com=new InfoDetailsPreviewCommand();
		com.execute(req, model);
		//reply list
		com=new InfoDetailsReplyListCommand();
		com.execute(req, model);
		return "infoDetailsUser";
	}
	//info reply manage page
	@RequestMapping("/infoReplyAdmin")
	public String infoReplyAdmin(HttpServletRequest req, Model model) {
		System.out.println("infoReply manage request");
		com=new InfoReplyListAdminCommand();
		com.execute(req, model);
		return "infoReplyListAdmin";
	}
}
