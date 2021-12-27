package co.micol.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.serviceImpl.MemberServiceImpl;

public class AjaxIdCheck implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//Ajax로 아이디 중복체크 하는것
		MemberService memberService = new MemberServiceImpl();
		String id = request.getParameter("id");
		//System.out.println(id);
		boolean b = memberService.isIdCheck(id); //0이면 존재, 1이면 사용가능
		//System.out.println(b);
		String str = null;
		if(!b) {
			// 이미존재하는 아이디
			str = "0";
		} else {
			// 사용가능
			str = "1";
		}
		return "ajax:"+str; //ajax:0
	}

}
