package com.project.DuAnTotNghiep.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.project.DuAnTotNghiep.entity.Material;

public interface MaterialRepository extends JpaRepository<Material, Long> {
    boolean existsByCode(String code);
    List<Material> findAllByDeleteFlagFalse();

    Page<Material> findAllByDeleteFlagFalse(Pageable pageable);
}