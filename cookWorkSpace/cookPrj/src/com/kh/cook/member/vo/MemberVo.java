package com.kh.cook.member.vo;

public class MemberVo {
	public MemberVo() {
		
	}
	
	
	
	public MemberVo(String no, String grade, String id, String pwd, String email, String name, String phone,
			String nick, String addr, String detailAddr, String enrollDate, String modifyDate, String quitYn, int point,
			String adminYn) {
		super();
		this.no = no;
		this.grade = grade;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.nick = nick;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.quitYn = quitYn;
		this.point = point;
		this.adminYn = adminYn;
	}



	private String no;
	private String grade;
	private String id;
	private String pwd;
	private String email;
	private String name;
	private String phone;
	private String nick;
	private String addr;
	private String detailAddr;
	private String enrollDate;
	private String modifyDate;
	private String quitYn;
	private int point;
	private String adminYn;
	private String save;
	public String getNo() {
		return no;
	}



	public void setNo(String no) {
		this.no = no;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getNick() {
		return nick;
	}



	public void setNick(String nick) {
		this.nick = nick;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public String getDetailAddr() {
		return detailAddr;
	}



	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}



	public String getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}



	public String getModifyDate() {
		return modifyDate;
	}



	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}



	public String getQuitYn() {
		return quitYn;
	}



	public void setQuitYn(String quitYn) {
		this.quitYn = quitYn;
	}



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}



	public String getAdminYn() {
		return adminYn;
	}



	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}



	public String getSave() {
		return save;
	}



	public void setSave(String save) {
		this.save = save;
	}



	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", grade=" + grade + ", id=" + id + ", pwd=" + pwd + ", email=" + email
				+ ", name=" + name + ", phone=" + phone + ", nick=" + nick + ", addr=" + addr + ", detailAddr="
				+ detailAddr + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", quitYn=" + quitYn
				+ ", point=" + point + ", adminYn=" + adminYn + ", save=" + save + "]";
	}



	
	
	
	
	
}
