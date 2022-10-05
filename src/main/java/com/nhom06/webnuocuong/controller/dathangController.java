package com.nhom06.webnuocuong.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.chrono.ChronoLocalDate;
import java.util.List;
import java.util.Optional;

import java.text.ParseException;
import java.text.SimpleDateFormat;







import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nhom06.webnuocuong.model.*;
import com.nhom06.webnuocuong.repository.*;


@Controller

public class dathangController {

	@Autowired
	private danhgiaspRepository danhgiaspRepository;
	@Autowired
	private HomeRepository homeRepository;
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private khachhangRepository khRepository;
	@Autowired
	private giohangRepository ghRepository;
	@Autowired
	private KvghRepository kvRepository;
	@Autowired
	private donhangRepository dhRepository;
	@Autowired
	private chitietdonhangRepository ctdhRepository;
	@Autowired
	private maGiamGiaRepository mggRepository;
	
	@Autowired
    private JavaMailSender mailSender;
	
	 public void sendEmail( String nguoinhan,String link, int id, String tenkh)
	            throws MessagingException, UnsupportedEncodingException {
	        MimeMessage message = mailSender.createMimeMessage();              
	        MimeMessageHelper helper = new MimeMessageHelper(message);
	         
	        helper.setFrom("ndtrung@shopFS06.com", "Ndtrung Đơn hàng");
	        
	        helper.setTo(nguoinhan);
	        
	         
	        String subject = "Đơn hàng mới";
	         
	        String content = "<p>Đơn hàng: "+  id +" </p>"
	                + "<p>Có đơn hàng mới, khách hàng: "+ tenkh +  ".</p>"
	                + "<p>....</p>"
	                + "<p><a href=\"" + link + "\">Link đơn hàng</a></p>"
	                + "<br>"
	                + "<p>......................................... !, "
	                + ".....</p>";
	         
	        helper.setSubject(subject);
	         
	        helper.setText(content, true);
	         
	        mailSender.send(message);
	    } 
	     
	
	@PostMapping("/dat-hang") // Nếu người dùng request tới địa chỉ "/"
	public String dathang(@ModelAttribute("donhangr") donhang dh, Model model, Principal principal,  HttpServletRequest request) throws IOException, ParseException {
		
		if (principal == null) {
			return "redirect:/";
		}
		
		
		
		
		
		
		
		
		
		int pt_thanhtoan = dh.getPhuongthucthanhtoan();
		int tongtiensp = 0;
		String ghichu = dh.getNguoinhanghichu();
		
		
		
		
		String a="";
		a = principal.getName();
		//lay thông tin khach hàng ở bảng khachhang và taikhoan
		 User user = userRepository.findByUsername(a);
		 khachhang kh = khRepository.findByTaikhoan(user.getId() );
		 
//		 if( (kh.getKhachhangsdt() == 0 ) || ( kh.getKhachhangdiachi() == null) ) {
//			 return "redirect:/GioHang" ;
//		 }
		
		 if(kh == null) {
			 return "redirect:/GioHang";
		 }
		 
		 if(kh.getTrangthai() == 0) {
			 return "redirect:/GioHang";
		 }
		 List<giohang> giohanghtml = ghRepository.findByKhachhangid(kh.getKhachhangid()); 
		 int kvghid_kh = Integer.parseInt(kh.getKhuvucghid());
		 Kvgh kvgh = kvRepository.findById(kvghid_kh);
		 
		 
		 for(giohang giohang : giohanghtml  ) {
			 
				tongtiensp += giohang.getProduct().getSanphamgiatien()* giohang.getSoluong();
						 
						 	
		}
		 
		 //kiểm tra giỏ hàng có sản phẩm ko
		 if( tongtiensp==0 ) {
			 return "redirect:/GioHang" ;
		 }
		 
		 
		 //tính giảm giá
		 //tìm mã giảm giá mgg
		 maGiamGia mgg = mggRepository.findByMagiamgiacode( dh.getGiamgia() ) ;
		 
			// LocalDate datenow = java.time.LocalDate.now();
		 
		 //ngày hiện tại
			 long millis=System.currentTimeMillis();
			 java.sql.Date datenow  = new java.sql.Date(millis);
			 
			 int giamgia=0;
			
			  
			 
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				if(mgg != null) {
					
					//ngay het han
					java.util.Date date_magg  =new java.sql.Date(millis);
					 date_magg =  sdf.parse(mgg.getNgayhethan());
					//LocalDate date_ma = date_magg;
					//Date datenow2 = sdf.parse(   datenow );
					
					if( ( mgg.getMagiamgiasoluong() >0 ) && ( datenow.compareTo(date_magg)  <=0 )  && mgg.getMagiamgiasoluong() >0   ) {
						 giamgia =(tongtiensp * mgg.getMagiamgiaphantram() ) /100 ;
						 if(giamgia > mgg.getMagiamgiatoida()) {
							 giamgia = mgg.getMagiamgiatoida() ;
						 }
						
						 dh.setGiamgia(  String.valueOf(giamgia) ) ;
						
						mgg.setMagiamgiasoluong(  mgg.getMagiamgiasoluong() -1  );
						mggRepository.save(mgg);
					//nếu mã giảm giá hết số lượng, hết hạn, 
					}else {
						dh.setGiamgia(  "0" ) ;
					}
				//neu mã giảm giá = null, đặt giảm giá=0
				}else {
					dh.setGiamgia(  "0" ) ;
				}
		 
		 
		 
		 
		 
		 //tính tổng cộng, giảm giá của đơn hàng
		 int tongcong =0;
		 
		 if(dh.getGiamgia() != null ) {
				
				 tongcong = tongtiensp + kvgh.getGia() - Integer.parseInt( dh.getGiamgia() )  ;
			}else {
				tongcong = tongtiensp + kvgh.getGia()   ;
			}
		  
		 
		 //System.out.print(kvgh.getGia());
		 
		
		 LocalDate ngaytao = java.time.LocalDate.now();
		 LocalTime thoigiantao = java.time.LocalTime.now();
		 
		
		//System.out.print(tongtiensp );
		//System.out.print(ngaytao  );
		//System.out.print("\n");
		//System.out.print(  thoigiantao  );
		 
		 int kvghid_kh2 = Integer.parseInt(kh.getKhuvucghid());
			// int kvghid_kh=1;
		Kvgh kvgh_kh =  kvRepository.findById(kvghid_kh ) ;
		 
		 
		 String diachikh = kvgh_kh.getName() +", "+ kh.getKhachhangdiachi();
		
		//insert don hang mới
		donhang themdh = new donhang(1, kh.getKhachhangid() , pt_thanhtoan, tongcong, kvgh.getGia() , kvgh.getThoigian()  , thoigiantao, ngaytao,    ghichu, user.getEmail()  ,  dh.getGiamgia()  )  ;
		
		dhRepository.save(themdh) ;
		
		dhRepository.flush();
		
		int dhid = themdh.getDonhangid() ;
		
		dhRepository.save(themdh) ;
		//lay gio hang dua vao chi tiet donhang
		for(giohang giohang2 : giohanghtml  ) {
			 
			chitietdonhang ctdh_them = new chitietdonhang(dhid , giohang2.getProduct().getSanphamid() , giohang2.getSoluong() ,giohang2.getProduct().getSanphamgiatien()  , giohang2.getProduct().getSanphamten(), ngaytao  ,0) ;
				
				ctdhRepository.save(ctdh_them) ;
				
				ghRepository.deleteById(  giohang2.getGiohangid())   ;
					 	
		}
		
		//System.out.print("aaaaaaddddddddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssss");
		
		//System.out.print("aaaaaaddddddddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssss"+ dh.getGiamgia());
		String siteURL = request.getRequestURL().toString();
		String resetPasswordLink =  siteURL.replace(request.getServletPath(), "") + "/danhmucDHAdmin/1";
		 try {
			sendEmail( "ngdctrung261220@gmail.com",resetPasswordLink, dhid, kh.getKhachhangten());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/danhmucDH/1"; // Trả về file index.html
	}
	
	
	@PostMapping("/huy-don-hang") // Nếu người dùng request tới địa chỉ "/"
	public String huydonhang(@ModelAttribute("newdh") donhang huydh, Model model, Principal principal) {
		
		if (principal == null) {
			return "redirect:/";
		}
		
	int	donhangKH_id = huydh.getDonhangid()  ;
 		
		
		String a="";
		a = principal.getName();
		 User user = userRepository.findByUsername(a);
		 khachhang kh = khRepository.findByTaikhoan(user.getId() );
		
		 donhang dhNow = dhRepository.findByDonhangid(donhangKH_id) ;
		dhNow.setTrangthaidonhangid(99) ;
		 
		System.out.print(donhangKH_id) ;
		System.out.print("abccccccccccccccccccc") ;
		dhRepository.save(dhNow) ;
		
		return "redirect:/DonHangKhachHang"; // Trả về file index.html
	}
	
	
	@GetMapping("/danhmucDH/{id}") // Nếu người dùng request tới địa chỉ "/"
	public String danhmucDH (@PathVariable int id, Model model, Principal principal)  {
		
		if (principal == null) {
			return "redirect:/";
		}
		
		String a="";
		a = principal.getName();
		 User user = userRepository.findByUsername(a);
		 khachhang kh = khRepository.findByTaikhoan(user.getId() );
		 if(kh==null) {
			 return "redirect:/";
		 }
		 
		 int khid = kh.getKhachhangid() ;
		
		 model.addAttribute("donhangkh", dhRepository.findByTrangthaidonhangidAndKhachhangidOrderByDonhangidDesc(id, khid)  );
		 model.addAttribute("ctdh", ctdhRepository.findAll()   );
		 model.addAttribute("sanpham", productRepository.findAll()   );
		 
		 model.addAttribute("newdh", new donhang()   );
		 
		 
		 
		 model.addAttribute("diemDH",  dhRepository.countByKhachhangid(kh.getKhachhangid())   );
		 model.addAttribute("diemDH1",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   1  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH2",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   2  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH3",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   3  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH4",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   4  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH99",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   99  , kh.getKhachhangid())   );
		 
		 model.addAttribute("kh",   kh );
		 model.addAttribute("user", user);
		 if(kh.getKhuvucghid()==null) {
			 
			 model.addAttribute("kvgh_kh", new Kvgh(0,"...",0,0,0)    );
		 }else {
			 int kvghid_kh = Integer.parseInt(kh.getKhuvucghid());
			 model.addAttribute("kvgh_kh", kvRepository.findById(kvghid_kh )    );
		 }
		 
		//bat dau lay gio hang cua khach
			
				 int tongtien=0;
				 List<giohang> giohanghtml = ghRepository.findByKhachhangid(khid);
				 model.addAttribute("listgiohang", giohanghtml);
				 
				 model.addAttribute("kh", kh);
				 
				 //tinh tong tien trong gio hang
				 for(giohang giohang : giohanghtml  ) {
					 
					 tongtien += giohang.getProduct().getSanphamgiatien()* giohang.getSoluong();
					 
				 }
				 
				 model.addAttribute("tongtien", tongtien );
				 
			
			model.addAttribute("giohang", new giohang());
			
			//ket thuc lay gio hang cua khach
		 
		 
		 
		
		 return "DonHangKhachHang";
	}

	
	
	
	
	@GetMapping("/DonHangKhachHang") // Nếu người dùng request tới địa chỉ "/"
	public String DonHangKhachHang(Model model , Principal principal) {
		
		if (principal == null) {
			return "redirect:/";
		}
		
		String a="";
		a = principal.getName();
		 User user = userRepository.findByUsername(a);
		 khachhang kh = khRepository.findByTaikhoan(user.getId() );
		
		 if(kh ==null) {
			 return "redirect:/";
		 }
		 
		 model.addAttribute("donhangkh", dhRepository.findByKhachhangidOrderByDonhangidDesc(kh.getKhachhangid())   );
		 model.addAttribute("ctdh", ctdhRepository.findAll()   );
		 model.addAttribute("sanpham", productRepository.findAll()   );
		 
		 model.addAttribute("newdh", new donhang()   );
		 
		 model.addAttribute("diemDH",  dhRepository.countByKhachhangid(kh.getKhachhangid())   );
		 model.addAttribute("diemDH1",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   1  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH2",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   2  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH3",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   3  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH4",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   4  , kh.getKhachhangid())   );
		 model.addAttribute("diemDH99",  dhRepository.countByTrangthaidonhangidAndKhachhangid(   99  , kh.getKhachhangid())   );
		 
		 
		 model.addAttribute("kh",   kh );
		 model.addAttribute("user", user);
		 
		 //lay khu vuc giao hang
		 if(kh.getKhuvucghid()==null) {
			 
			 model.addAttribute("kvgh_kh", new Kvgh(0,"...",0,0,0)    );
		 }else {
			 int kvghid_kh = Integer.parseInt(kh.getKhuvucghid());
			 model.addAttribute("kvgh_kh", kvRepository.findById(kvghid_kh )    );
		 }
		 
		 
		 int khid=-9;
			//bat dau lay gio hang cua khach
			if (principal != null) {
				
				 khid= kh.getKhachhangid() ;
				 
				 int tongtien=0;
				 List<giohang> giohanghtml = ghRepository.findByKhachhangid(khid);
				 model.addAttribute("listgiohang", giohanghtml);
				 
				 
				 model.addAttribute("kh", kh);
				 
				 //tinh tong tien trong gio hang
				 for(giohang giohang : giohanghtml  ) {
					 
					 tongtien += giohang.getProduct().getSanphamgiatien()* giohang.getSoluong();
					 
				 }
				 model.addAttribute("tongtien", tongtien );
			}
			//ket thuc lay gio hang cua khach
		 
		 
		 
		return "DonHangKhachHang"; // Trả về file index.html
	}

	
	
	
	
	
}
