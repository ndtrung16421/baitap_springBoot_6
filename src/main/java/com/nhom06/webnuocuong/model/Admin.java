package com.nhom06.webnuocuong.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_admin")
public class Admin {
	@Id
	@Column(name = "admin_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int adminid;

	@Column(name = "taikhoan_id")
	private long taikhoan;

	@Column(name = "admin_ten")
	private String adminten;

	@Column(name = "admin_sdt")
	private String adminsdt;
	
	@Column(name = "admin_diachi")
	private String admindiachi;
	
	@Column(name = "admin_anh")
	private String adminanh;

	
	@Column(name = "admin_trangthai")
	private int admintrangthai;
	
	

	public Admin() {
		super();
	}

	public Admin(long taikhoan, int in, String adminten, String adminsdt) {
		super();
		this.taikhoan = taikhoan;
		this.admintrangthai = in;
		this.adminten = adminten;
		this.adminsdt = adminsdt;

	}
	
	
	
	

	public String getAdmindiachi() {
		return admindiachi;
	}

	public void setAdmindiachi(String admindiachi) {
		this.admindiachi = admindiachi;
	}

	public String getAdminanh() {
		return adminanh;
	}

	public void setAdminanh(String adminanh) {
		this.adminanh = adminanh;
	}

	public int getAdmintrangthai() {
		return admintrangthai;
	}

	public void setAdmintrangthai(int admintrangthai) {
		this.admintrangthai = admintrangthai;
	}

	public int getAdminid() {
		return adminid;
	}

	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}

	public long getTaikhoan() {
		return taikhoan;
	}

	public void setTaikhoan(long taikhoan) {
		this.taikhoan = taikhoan;
	}

	public String getAdminten() {
		return adminten;
	}

	public void setAdminten(String adminten) {
		this.adminten = adminten;
	}

	public String getAdminsdt() {
		return adminsdt;
	}

	public void setAdminsdt(String adminsdt) {
		this.adminsdt = adminsdt;
	}

	

}