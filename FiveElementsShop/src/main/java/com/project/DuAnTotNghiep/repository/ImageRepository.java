package com.project.DuAnTotNghiep.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.DuAnTotNghiep.entity.Image;
import com.project.DuAnTotNghiep.entity.Product;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {

    List<Image> findAllByProduct(Product product);
    Image findImageById(Long id);
}