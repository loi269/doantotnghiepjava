package com.project.DuAnTotNghiep.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.DuAnTotNghiep.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    boolean existsByOrderId(String orderId);
    Payment findByOrderId(String orderId);

}
