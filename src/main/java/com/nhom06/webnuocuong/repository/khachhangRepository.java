package com.nhom06.webnuocuong.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.nhom06.webnuocuong.model.khachhang   ;
@Repository
public interface khachhangRepository extends JpaRepository<khachhang, Integer> {

	khachhang findByTaikhoan(Long id);

	khachhang findFirstByKhachhangtenContaining(String sss);
    
}