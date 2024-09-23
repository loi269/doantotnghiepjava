package com.project.DuAnTotNghiep.config;

import com.project.DuAnTotNghiep.entity.DiscountCode;
import com.project.DuAnTotNghiep.repository.DiscountCodeRepository;
import com.project.DuAnTotNghiep.service.DiscountCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

// Đây là tệp Java trong ứng dụng Spring Boot, được sử dụng để định nghĩa các tác vụ tự động.
// Sử dụng annotation @Scheduled để lên lịch chạy phương thức checkAndSetExpiredStatus mỗi 1 giờ.
// Phương thức checkAndSetExpiredStatus kiểm tra và cập nhật trạng thái của các mã giảm giá đã hết hạn.

@Component
public class ScheduledApp {
    @Autowired
    private DiscountCodeService discountCodeService;

    @Autowired
    private DiscountCodeRepository discountCodeRepository;

    // Kiểm tra từng mã giảm giá trong danh sách, nếu mã giảm giá đã hết hạn 
    // (currentDate.after(discountCode.getEndDate())), cập nhật trạng thái của mã giảm giá
    // thành hết hạn (discountCode.setStatus(3)) và lưu lại thay đổi vào cơ sở dữ liệu 
    // (discountCodeRepository.save(discountCode)).

    @Scheduled(fixedRate = 60*60*100) // Run every 24 hours, adjust as needed
    public void checkAndSetExpiredStatus() {
        Date currentDate = new Date();
        List<DiscountCode> expiredDiscountCodes = null;
        if(!expiredDiscountCodes.isEmpty()) {
            for (DiscountCode discountCode : expiredDiscountCodes) {
                if (currentDate.after(discountCode.getEndDate())) {
                    discountCode.setStatus(3); //cập nhật trạng thái mã giảm giá thành hết hạn
                    discountCodeRepository.save(discountCode);
                }
            }
        }

    }
}
