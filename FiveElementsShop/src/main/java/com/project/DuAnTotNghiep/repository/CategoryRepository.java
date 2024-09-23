package com.project.DuAnTotNghiep.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.DuAnTotNghiep.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    boolean existsByCode(String code);
    List<Category> findAllByDeleteFlagFalse();
}