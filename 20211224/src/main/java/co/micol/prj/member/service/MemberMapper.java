package co.micol.prj.member.service;

import java.util.List;

public interface MemberMapper {
	List<MemberVO> memberSelectList(); //전체리스트 가져오기
	MemberVO memberSelect(MemberVO vo); //한명분 데이터 조회
	//resultType        (parameterType)
	int memberInsert(MemberVO vo); //삽입
	int memberDelete(MemberVO vo); //삭제
	int memberUpdate(MemberVO vo); //수정
	boolean isIdCheck(String id); //존재하면 false, 그렇지 않으면 true
}
