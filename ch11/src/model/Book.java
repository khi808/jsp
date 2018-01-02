package model;
// Bean
public class Book {
	// 필드
	private int code;
	private String title;
	private String writer;
	private int price;
	// 생성자
	public Book() {}
	// 메소드
	public int getCode() {	return code;}
	public void setCode(int code) {	this.code = code;}
	public String getTitle() {	return title;}
	public void setTitle(String title) {	this.title = title;	}
	public String getWriter() {	return writer;	}
	public void setWriter(String writer) {	this.writer = writer;}
	public int getPrice() {	return price;}
	public void setPrice(int price) {	this.price = price;}
	
	
}
