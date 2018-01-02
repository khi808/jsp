package model;
// 속성을 저장할 Bean 생성
// 속성은 private로 
// 메소드는 public 으로
// 기본 생성자는 반드시 있어야 됨. public
public class Dept {
	// 필드
	private int deptno;
	private String dname;
	private String loc;
	// 생성자
	public Dept() {}
	// 메소드
	public int getDeptno() {return deptno;}
	public void setDeptno(int deptno) {	this.deptno = deptno;}
	public String getDname() {return dname;}
	public void setDname(String dname) {this.dname = dname;	}
	public String getLoc() {return loc;	}
	public void setLoc(String loc) {this.loc = loc;	}
}
