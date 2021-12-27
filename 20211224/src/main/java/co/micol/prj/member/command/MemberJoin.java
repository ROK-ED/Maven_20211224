package co.micol.prj.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.micol.prj.comm.Command;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.service.MemberVO;
import co.micol.prj.member.serviceImpl.MemberServiceImpl;

public class MemberJoin implements Command {
//cos.jar를 이용하는 multipart data 다루기
	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		//multipart로 데이터가 날아오면 multipart객체를 통해 데이터를 받아야 함
		MemberService memberService = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		int size = 1024*1024*1024;//1Gb까지 ~ 파일최대사이즈
		String filePath = request.getSession().getServletContext().getRealPath("uploadFile");//파일이 저장될 경로
		int insert = 0;
		try {
			MultipartRequest multi = new MultipartRequest(request, filePath, size, "UTF-8",new DefaultFileRenamePolicy());
			String uploadFileName = multi.getFilesystemName("file");//물리파일명
			String sourceFileName = multi.getOriginalFileName("file");//원본파일명
			System.out.println(uploadFileName+"================");
			System.out.println(sourceFileName+"================");
			vo.setId(multi.getParameter("id")); //form 에서 text형식의 데이터 담기
			vo.setPassword(multi.getParameter("password"));
			vo.setName(multi.getParameter("name"));
			vo.setTel(multi.getParameter("tel"));
			vo.setAddress(multi.getParameter("address"));
			vo.setPicture(sourceFileName);//DB에 파일명을 저장
			vo.setPfile(uploadFileName);//DB에 실제 저장된 위치의 파일명을 저장
			
			insert = memberService.memberInsert(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(insert > 0 ) {
			request.setAttribute("message", "회원가입이 성공 했습니다.");
		} else {
			request.setAttribute("message", "회원가입이 실패 했습니다.");
		}
		return "member/memberJoin";
	}

}
