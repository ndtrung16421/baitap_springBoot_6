package com.nhom06.webnuocuong.model;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "tbl_taikhoan")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "taikhoan_id")
	private Long id;

	@Column(name = "taikhoan")
	private String username;

	@Column(name = "matkhau")
	private String password;
	
	@Column(name = "reset_password_token")
    private String resetPasswordToken;
	
	@Column(name = "email")
    private String email;
	
	@Column(name = "reset_token_solan")
    private int tokensolan;
	
	 @Column(name = "token_ngaytao")
	  @JsonFormat(pattern="yyyy-MM-dd")
	  private LocalDate tokenngaytao;

	

	@Column(name = "taikhoan_trangthai")
	private String trangthai;

	  @Column(name = "thoigiantao")
	  @JsonFormat(pattern="HH:mm:ss")
	  private LocalTime thoigiantao;
	  
	  @Column(name = "ngaytao")
	  @JsonFormat(pattern="yyyy-MM-dd")
	  private LocalDate ngaytao;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_phanquyen", joinColumns = @JoinColumn(name = "taikhoan_id", referencedColumnName = "taikhoan_id"), inverseJoinColumns = @JoinColumn(name = "vaitro_id", referencedColumnName = "vaitro_id"))
	private Collection<Role> roles;
	
	public User() {
		
	}

	

	public User(String username, String password,  Collection<Role> roles, String email) {
		super();
		this.username = username;
		this.password = password;
		
		this.roles = roles;
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", trangthai=" + trangthai + ", roles=" + roles + "]";
	}

	
	
	
	
	
	
	
	public int getTokensolan() {
		return tokensolan;
	}



	public void setTokensolan(int tokensolan) {
		this.tokensolan = tokensolan;
	}



	public LocalDate getTokenngaytao() {
		return tokenngaytao;
	}



	public void setTokenngaytao(LocalDate tokenngaytao) {
		this.tokenngaytao = tokenngaytao;
	}



	public String getResetPasswordToken() {
		return resetPasswordToken;
	}



	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}











	public LocalTime getThoigiantao() {
		return thoigiantao;
	}



	public void setThoigiantao(LocalTime thoigiantao) {
		this.thoigiantao = thoigiantao;
	}



	public LocalDate getNgaytao() {
		return ngaytao;
	}



	public void setNgaytao(LocalDate ngaytao) {
		this.ngaytao = ngaytao;
	}



	public String getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public Collection<Role> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}

}
