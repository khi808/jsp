package model;

import java.util.Date;

// Bean은 테이블의 속성과 같이 생성
public class Member {
	// 필드
	private String id;
	private String password;
	private String name;
	private Date birth;
	private Date regdate;
	// 생성자
	public Member() {}
	// 메소드
	public String getId() {	return id;}
	public void setId(String id) {this.id = id;}
	public String getPassword() {return password;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public void setPassword(String password) {this.password = password;}
	public Date getBirth() {return birth;}
	public void setBirth(Date birth) {this.birth = birth;}
	public Date getRegdate() {return regdate;}
	public void setRegdate(Date regdate) {this.regdate = regdate;}
	
	
	
}
