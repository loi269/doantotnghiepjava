package com.project.DuAnTotNghiep.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.DuAnTotNghiep.entity.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {
}