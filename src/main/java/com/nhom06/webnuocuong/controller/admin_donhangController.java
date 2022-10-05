package com.nhom06.webnuocuong.controller;


import java.time.LocalDate;   
import java.time.LocalTime;   
import java.security.Principal;
import java.sql.Date;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nhom06.webnuocuong.model.*;
import com.nhom06.webnuocuong.repository.*;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nhom06.webnuocuong.model.*;
import com.nhom06.webnuocuong.repository.*;
import com.nhom06.webnuocuong.uploadimage.FileUploadUtil;


@Controller

public class admin_donhangController {
	
	@Autowired
	private HomeRepository homeRepository;
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private cnttdhRepository cnttdhRepository;
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private khachhangRepository khRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private giohangRepository ghRepository;
	@Autowired
	private KvghRepository kvRepository;
	@Autowired
	private donhangRepository dhRepository;
	@Autowired
	private chitietdonhangRepository ctdhRepository;
	
	
	@GetMapping("/DonHangAdmin") // Nếu người dùng request tới địa chỉ "/"
	public String dathang( Model model, Principal principal) {
		
		
		if (principal == null) {
			return "redirect:/admin";
		}
		
		model.addAttribute("donhangkh", dhRepository.findAllByOrderByDonhangidDesc()  );
		 model.addAttribute("ctdh", ctdhRepository.findAll()   );
		 model.addAttribute("sanpham", productRepository.findAll()   );
		 
		 model.addAttribute("newdh", new donhang()   );
		 
		 model.addAttribute("diemDH",  dhRepository.count()   ) ;
		 model.addAttribute("diemDH1",  dhRepository.countByTrangthaidonhangid(   1  )   );
		 model.addAttribute("diemDH2",  dhRepository.countByTrangthaidonhangid(   2  )   );
		 model.addAttribute("diemDH3",  dhRepository.countByTrangthaidonhangid(   3  )   );
		 model.addAttribute("diemDH4",  dhRepository.countByTrangthaidonhangid(   4  )   );
		 model.addAttribute("diemDH99",  dhRepository.countByTrangthaidonhangid(   99  )   );
			
		 model.addAttribute("kh", khRepository.findAll()  );
		 model.addAttribute("user", userRepository.findAll()  );
		 model.addAttribute("kvgh", kvRepository.findAll()  );
		 
		 
		 if (principal == null) {
				return "redirect:/admin";
			}
				String a="";
			 a = principal.getName();
			 User user = userRepository.findByUsername(a);
			 Admin ad = adminRepository.findByTaikhoan(user.getId() );
			
			 if(ad  != null) {
				 model.addAttribute("ad", ad   );
			 }
			 
		
		
		return "admin/DonHangAdmin"; // Trả về file index.html
	}
	
	
	
	  @PostMapping("/cap-nhat-don-hang") // Nếu người dùng request tới địa chỉ "/"
	  public String huydonhang(@ModelAttribute("newdh") donhang cndh, Model model,
	  Principal principal) {
	  
	  if (principal == null) { return "redirect:/"; }
	  
	  int donhangKH_id = cndh.getDonhangid() ;
	  int trangthai_cn = cndh.getTrangthaidonhangid() ;
	  
	  
	  
	  donhang dhNow = dhRepository.findByDonhangid(donhangKH_id) ;
	  dhNow.setTrangthaidonhangid(trangthai_cn) ;
	  
	  dhRepository.save(dhNow) ;
	  
	  //neu trang thai don hang=4 - hoan thanh - cap nhat so luong san pham cua ctdh vào sanpham_daban
	  if(trangthai_cn == 4) {
		  List<chitietdonhang> ctdh = ctdhRepository.findByDonhangid(donhangKH_id) ;
		  
		  for(chitietdonhang ctdh_pro : ctdh  ) {
			  
			  Product pro_daban = productRepository.findById(  ctdh_pro.getCtdhidsp()   ) ;
			  pro_daban.setSanphamdaban(  ctdh_pro.getCtdhsoluongsp() + pro_daban.getSanphamdaban() );
			  productRepository.save(pro_daban) ;
			  
		  }
		   
	  }
	  String a = new String();
		a = principal.getName();
		User user = userRepository.findByUsername(a);
		Admin ad = adminRepository.findByTaikhoan(user.getId());
		LocalDate ngaytao = java.time.LocalDate.now();
		LocalTime thoigiantao = java.time.LocalTime.now();
		String noidung = null;
		if(trangthai_cn==2)
			noidung = new String("Đã xác nhận");
		if(trangthai_cn==3)
			noidung = new String("Đang giao hàng");
		if(trangthai_cn==4)
			noidung = new String("Đã giao");
		cnttDonHang abc  = new cnttDonHang(ad.getAdminid(), donhangKH_id, ngaytao, thoigiantao, noidung );
		cnttdhRepository.save(abc);
		
	  
	  
	  
	  
	  
	  //ket thuc cap nhat sanpham đã bán
	  
	  return "redirect:/danhmucDHAdmin/1"; 
	  
	  }
	  
	  public static boolean isNumeric(String cs) {
	        
	        final int sz = cs.length();
	        for (int i = 0; i < sz; i++) {
	            if (!Character.isDigit(cs.charAt(i))) {
	                return false;
	            }
	        }
	        return true;
	    }
	  
	  @PostMapping("/tim-dh") // Nếu người dùng request tới địa chỉ "/"
		public String capnhatDonHang( @RequestParam("tim") String tim,Model model, Principal principal) {
			
			if (principal == null) {
				return "redirect:/admin";
			}
			
			//model.addAttribute("donhangkh", dhRepository.findAllByOrderByDonhangidDesc()  );
			 model.addAttribute("ctdh", ctdhRepository.findAll()   );
			 model.addAttribute("sanpham", productRepository.findAll()   );
			 
			 model.addAttribute("newdh", new donhang()   );
			 
			 model.addAttribute("diemDH",  dhRepository.count()   ) ;
			 model.addAttribute("diemDH1",  dhRepository.countByTrangthaidonhangid(   1  )   );
			 model.addAttribute("diemDH2",  dhRepository.countByTrangthaidonhangid(   2  )   );
			 model.addAttribute("diemDH3",  dhRepository.countByTrangthaidonhangid(   3  )   );
			 model.addAttribute("diemDH4",  dhRepository.countByTrangthaidonhangid(   4  )   );
			 model.addAttribute("diemDH99",  dhRepository.countByTrangthaidonhangid(   99  )   );
			 
			 model.addAttribute("kh", khRepository.findAll()  );
			 model.addAttribute("user", userRepository.findAll()  );
			 model.addAttribute("kvgh", kvRepository.findAll()  );
				
			 String temp = Normalizer.normalize(tim, Normalizer.Form.NFD);
			 Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
			 String sss = pattern.matcher(temp).replaceAll("").replace('đ','d').replace('Đ','D');
			 
			 if( isNumeric(sss )==true   ) {
				 
				 model.addAttribute("donhangkh", dhRepository.findByDonhangid( Integer.parseInt(sss)   )  );
			 }else {
				
				 khachhang khach =  khRepository.findFirstByKhachhangtenContaining(sss);
				 if( khach == null) {
					 return "admin/DonHangAdmin";
				 }
				 model.addAttribute("donhangkh", dhRepository.findByKhachhangid( khach.getKhachhangid() )  );
				 
			 }
			 
			 
			
			
			return "admin/DonHangAdmin"; // Trả về file index.html
		}
	  
	  @PostMapping("/cap-nhat-shipper") // Nếu người dùng request tới địa chỉ "/"
	  public String capnhatship(@ModelAttribute("newdh") donhang cndh, Model model,
	  Principal principal, HttpServletRequest request) {
	  
	  if (principal == null) { return "redirect:/"; }
	  
	  int donhangKH_id = cndh.getDonhangid() ;
	  String sten = cndh.getShipten() ;
	  String ssdt = cndh.getShipsdt() ;
	 
	  
	  String referer = request.getHeader("Referer");
	  
	  donhang dhNow = dhRepository.findByDonhangid(donhangKH_id) ;
	  
	  
	  if( dhNow.getTrangthaidonhangid() >=4 ) {
		  return "redirect:"+ referer;
	  }
	  
	  dhNow.setShipten(sten) ;
	  dhNow.setShipsdt(ssdt)  ;
//	  
//	  
	  dhRepository.save(dhNow) ;
	  
	  
	  return "redirect:"+ referer;
	  
	  }
	  
	 
	
	
	@GetMapping("/danhmucDHAdmin/{id}") // Nếu người dùng request tới địa chỉ "/"
	public String danhmucDH (@PathVariable int id, Model model, Principal principal)  {
		
		if (principal == null) {
			return "redirect:/";
		}
		
		model.addAttribute("donhangkh", dhRepository.findByTrangthaidonhangidOrderByDonhangidDesc(id)   );
		 model.addAttribute("ctdh", ctdhRepository.findAll()   );
		 model.addAttribute("sanpham", productRepository.findAll()   );
		 
		 model.addAttribute("newdh", new donhang()   );
		 
		 model.addAttribute("diemDH",  dhRepository.count()   ) ;
		 model.addAttribute("diemDH1",  dhRepository.countByTrangthaidonhangid(   1  )   );
		 model.addAttribute("diemDH2",  dhRepository.countByTrangthaidonhangid(   2  )   );
		 model.addAttribute("diemDH3",  dhRepository.countByTrangthaidonhangid(   3  )   );
		 model.addAttribute("diemDH4",  dhRepository.countByTrangthaidonhangid(   4  )   );
		 model.addAttribute("diemDH99",  dhRepository.countByTrangthaidonhangid(   99  )   );
		 
		 model.addAttribute("kh", khRepository.findAll()  );
		 model.addAttribute("user", userRepository.findAll()  );
		 model.addAttribute("kvgh", kvRepository.findAll()  );
		 
			if (principal == null) {
				return "redirect:/admin";
			}
				String a="";
			 a = principal.getName();
			 User user = userRepository.findByUsername(a);
			 Admin ad = adminRepository.findByTaikhoan(user.getId() );
			
			 if(ad  != null) {
				 model.addAttribute("ad", ad   );
			 }
			 
		 
		 return "admin/DonHangAdmin";
	}
	@GetMapping("/ThongTinAdmin") // Nếu người dùng request tới địa chỉ "/"
	public String ThongTinAdmin( Model model, Principal principal) {
		
		if (principal == null) {
			return "redirect:/admin";
		}
			String a="";
		 a = principal.getName();
		 User user = userRepository.findByUsername(a);
		 Admin ad = adminRepository.findByTaikhoan(user.getId() );
		
		 
		 model.addAttribute("ad", ad   );
		
		
		return "admin/ThongTinAdmin"; // Trả về file index.html
	}
	@PostMapping("/saveThongTinAdmin") // Nếu người dùng request tới địa chỉ "/"
	public String saveThongTinAdmin(@ModelAttribute("ad") Admin kh, Model model, Principal principal, @RequestParam("file") MultipartFile imgFile) {
		
		if (principal == null) {
			return "redirect:/admin";
		}
			String a="";
		 a = principal.getName();
		 User user = userRepository.findByUsername(a);
		 Admin ad = adminRepository.findByTaikhoan(user.getId() );
		
		 
		 if(imgFile.isEmpty()==false) {
				String path = "src/main/resources/static/pictures/admin";
				String url = "/pictures/admin/";
				
				try {
					String fileName = ad.getAdminid() + StringUtils.cleanPath(imgFile.getOriginalFilename()) ;
					String filePath = path + "/";
					kh.setAdminanh(url+fileName);
					FileUploadUtil.saveFile(filePath, fileName, imgFile);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		 
		 
		 
		 
		 adminRepository.save(kh) ;
		
		
		return "redirect:/ThongTinAdmin?cntc"; // Trả về file index.html
	}
	
	
	
	/*
	 * @GetMapping("/DonHangKhachHang") // Nếu người dùng request tới địa chỉ "/"
	 * public String DonHangKhachHang(Model model , Principal principal) {
	 * 
	 * if (principal == null) { return "redirect:/"; }
	 * 
	 * String a=""; a = principal.getName(); User user =
	 * userRepository.findByUsername(a); khachhang kh =
	 * khRepository.findByTaikhoan(user.getId() );
	 * 
	 * 
	 * model.addAttribute("donhangkh",
	 * dhRepository.findByKhachhangidOrderByDonhangidDesc(kh.getKhachhangid()) );
	 * model.addAttribute("ctdh", ctdhRepository.findAll() );
	 * model.addAttribute("sanpham", productRepository.findAll() );
	 * 
	 * model.addAttribute("newdh", new donhang() );
	 * 
	 * model.addAttribute("diemDH",
	 * dhRepository.countByKhachhangid(kh.getKhachhangid()) );
	 * model.addAttribute("diemDH1",
	 * dhRepository.countByTrangthaidonhangidAndKhachhangid( 1 ,
	 * kh.getKhachhangid()) ); model.addAttribute("diemDH2",
	 * dhRepository.countByTrangthaidonhangidAndKhachhangid( 2 ,
	 * kh.getKhachhangid()) ); model.addAttribute("diemDH3",
	 * dhRepository.countByTrangthaidonhangidAndKhachhangid( 3 ,
	 * kh.getKhachhangid()) ); model.addAttribute("diemDH4",
	 * dhRepository.countByTrangthaidonhangidAndKhachhangid( 4 ,
	 * kh.getKhachhangid()) ); model.addAttribute("diemDH99",
	 * dhRepository.countByTrangthaidonhangidAndKhachhangid( 99 ,
	 * kh.getKhachhangid()) );
	 * 
	 * 
	 * return "DonHangKhachHang"; // Trả về file index.html }
	 */

	
	
	
	
	
}