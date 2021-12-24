package co.micol.prj.member.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String author;
	private String tel;
	private String address;
	private String picture;
	private String pfile;  //lombok을 할때는 대문자없이, 접두어없이 만들어야된다
}
