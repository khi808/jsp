package model;

import java.util.Date;

// Bean은 테이블의 속성과 같이 생성
public class Member {
	// 필드
	private String id;
	private String password;
	private String name;
	private String birth;
	private Date regdate;
	// 추가
	private String address;
	private String tel;
	private String email;
	// 생성자
	public Member() {}
	// 메소드
	public String getId() {	return id;}
	public void setId(String id) {this.id = id;}
	public String getPassword() {return password;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public void setPassword(String password) {this.password = password;}
	public String getBirth() {return birth;}
	public void setBirth(String birth) {this.birth = birth;}
	public Date getRegdate() {return regdate;}
	public void setRegdate(Date regdate) {this.regdate = regdate;}
	public String getAddress() {return address;	}
	public void setAddress(String address) {this.address = address;	}
	public String getTel() {return tel;	}
	public void setTel(String tel) {this.tel = tel;	}
	public String getEmail() {return email;	}
	public void setEmail(String email) {this.email = email;	}
	
	
	
}
