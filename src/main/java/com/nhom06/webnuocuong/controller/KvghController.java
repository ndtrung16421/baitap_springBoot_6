package com.nhom06.webnuocuong.controller;




import java.security.Principal;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nhom06.webnuocuong.model.*;
import com.nhom06.webnuocuong.repository.*;
@Controller
public class KvghController {
  @Autowired
  private KvghRepository KvghRepository;
  
  @Autowired
  UserRepository userRepository;
  
  @Autowired
  AdminRepository adminRepository;
  
  @RequestMapping("/KhuVucGiaoHang")
  public String listKvgh(Model model, Principal principal ) {
    model.addAttribute("listKvgh", KvghRepository.findAll());
    model.addAttribute("Kvgh", new Kvgh());
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
	 
    return "admin/KhuVucGiaoHang";
  }
  
  
  @RequestMapping("/Kvgh-update/{id}")
  public String updateKvgh(@PathVariable int id, Model model) {
    Kvgh Kvgh = KvghRepository.findById(id);
   
      model.addAttribute("Kvgh", Kvgh );
    
    return "admin/Kvgh-update";
  }
  @RequestMapping("/saveKvgh")
  public String doSaveKvgh(@ModelAttribute("Kvgh") Kvgh Kvgh, Model model) {
    KvghRepository.save(Kvgh);
    model.addAttribute("listKvgh", KvghRepository.findAll());
    return "redirect:/KhuVucGiaoHang";
  
  }
  
  @RequestMapping("/updateKvgh")
  public String doUpdateKvgh(@ModelAttribute("Kvgh") Kvgh Kvgh, Model model) {
    KvghRepository.save(Kvgh);
    model.addAttribute("listKvgh", KvghRepository.findAll());
    return  "redirect:/KhuVucGiaoHang";
  }
  
  @RequestMapping("/KvghDelete/{id}")
  public String doDeleteKvgh(@PathVariable int id, Model model) {
    KvghRepository.deleteById(id);
    model.addAttribute("listKvgh", KvghRepository.findAll());
    model.addAttribute("Kvgh", new Kvgh());
    return  "redirect:/KhuVucGiaoHang";
  }
}