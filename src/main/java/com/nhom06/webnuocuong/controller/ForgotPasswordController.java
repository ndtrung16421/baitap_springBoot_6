package com.nhom06.webnuocuong.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.bcel.Utility;
//import org.aspectj.apache.bcel.classfile.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.nhom06.webnuocuong.model.CustomerServices;
import com.nhom06.webnuocuong.model.Kvgh;
import com.nhom06.webnuocuong.model.User;
import com.nhom06.webnuocuong.repository.UserRepository;

import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {
    @Autowired
    private JavaMailSender mailSender;
     
    @Autowired
    private CustomerServices customerService;
    @Autowired
	private UserRepository userRepository;
     
    @GetMapping("/forgot_password")
    public String showForgotPasswordForm() {
    	
    	return "forgot_password_form";
 
    }
 
    @PostMapping("/forgot_password")
    public String processForgotPassword(HttpServletRequest request, Model model) throws MessagingException {
        String email = request.getParameter("email");
        String token = RandomString.make(30);
        String username="";
        String siteURL = request.getRequestURL().toString();
        siteURL.replace(request.getServletPath(), "");
        
        
        long millis=System.currentTimeMillis();
		java.sql.Date datenow  =new java.sql.Date(millis);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        User ktu = userRepository.findByEmail(email);
        if( ktu.getTokenngaytao() ==null ) {
        	ktu.setTokenngaytao( java.time.LocalDate.now() );
        	userRepository.save(ktu) ;
        }
        
        if( (ktu.getTokenngaytao().isEqual(  java.time.LocalDate.now() ) == false)  ) {
        	ktu.setTokenngaytao( java.time.LocalDate.now() );
        	ktu.setTokensolan(0) ;
        	userRepository.save(ktu) ;
       }
        
       
       
        if( (ktu.getTokenngaytao().isEqual(  java.time.LocalDate.now() ) ==  true) && ktu.getTokensolan() >3 ) {
        	 model.addAttribute("a", 1    );
        	return "forgot_password_form";
        }
        
        
        
        
        
         
        try {
        	User customer = userRepository.findByEmail(email);
        	if(customer !=null) {
        		username = customer.getUsername() ;
        	}
            customerService.updateResetPasswordToken(token, email);
            customerService.updateResetPasswordToken(token, email);
            String resetPasswordLink =  siteURL.replace(request.getServletPath(), "") + "/reset_password?token=" + token;
            sendEmail(email, resetPasswordLink, username);
            model.addAttribute("message", "Ch??ng t??i ???? g???i link c???p l???i m???t kh???u ?????n ?????a ch??? mail c???a b???n - We have sent a reset password link to your email. Please check.");
            
            if(customer !=null) {
            	customer.setTokensolan( customer.getTokensolan() + 1  );
            	userRepository.save(customer) ;
            }
            
            
            
             
        } catch (IOException ex) {
            model.addAttribute("error", "Email kh??ng t???n t???i");
        } 
             
        return "forgot_password_form";
    }
     
    public void sendEmail(String recipientEmail, String link, String username)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = mailSender.createMimeMessage();              
        MimeMessageHelper helper = new MimeMessageHelper(message);
         
        helper.setFrom("ndtrung@shopFS06.com", "Ndtrung Support");
        helper.setTo(recipientEmail);
         
        String subject = "C???p l???i m???t kh???u kh??ch h??ng website FS06 ";
         
        String content = "<p>T??n ????ng nh???p: "+  username +" </p>"
                + "<p>B???n ???? c?? y??u c???u c???p l???i m???t kh???u.</p>"
                + "<p>Click v??o link b??n d?????i ????? c???p l???i m???t kh???u c???a b???n:</p>"
                + "<p><a href=\"" + link + "\">C???p l???i m???t kh???u</a></p>"
                + "<br>"
                + "<p>B??? qua email n??y n???u b???n ???? nh??? m???t kh???u ho???c kh??ng ph???i ch??nh b???n y??u c???u !, "
                + ".....</p>";
         
        helper.setSubject(subject);
         
        helper.setText(content, true);
         
        mailSender.send(message);
    } 
     
     
    @GetMapping("/reset_password")
    public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
        User customer = customerService.getByResetPasswordToken(token);
        model.addAttribute("token", token);
         
        if (customer == null) {
            model.addAttribute("message", "Invalid Token");
            return "message";
        }
         
        return "reset_password_form";
    }
     
    @PostMapping("/reset_password")
    public String processResetPassword(HttpServletRequest request, Model model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
         
        User customer = customerService.getByResetPasswordToken(token);
        model.addAttribute("title", "Reset your password");
         
        if (customer == null) {
            model.addAttribute("message", "Invalid Token");
            return "redirect:/dang-nhap-khach-hang?Doitb";
        } else {           
            customerService.updatePassword(customer, password);
             
            model.addAttribute("message", "You have successfully changed your password.");
        }
         
        return "redirect:/dang-nhap-khach-hang?Doitc";
    }
    
    
    
    
    
    
}