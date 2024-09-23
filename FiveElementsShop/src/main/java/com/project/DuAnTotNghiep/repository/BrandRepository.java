package com.project.DuAnTotNghiep.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.DuAnTotNghiep.entity.Brand;

public interface BrandRepository extends JpaRepository<Brand, Long> {
    boolean existsByCode(String code);
    List<Brand> findAllByDeleteFlagFalse();
}