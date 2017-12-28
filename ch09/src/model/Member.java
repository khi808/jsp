package model;

// Member bean
public class Member {
	// 필드(속성)
	private String name;
	private int age;
	// 생성자
	public Member(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public Member() {}
	// 메소드
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
