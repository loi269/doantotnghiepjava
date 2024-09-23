package com.project.DuAnTotNghiep.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.project.DuAnTotNghiep.entity.DiscountCode;

public interface DiscountCodeRepository extends JpaRepository<DiscountCode, Long>, JpaSpecificationExecutor<DiscountCode> {
    boolean existsByCode(String code);

    @Query(value = "SELECT * FROM discount_code WHERE status = 1 AND start_date < NOW() AND end_date > NOW() AND delete_flag = 'false' AND maximum_usage > 0", nativeQuery = true)
    Page<DiscountCode> findAllAvailableValid(Pageable pageable);
    
}
