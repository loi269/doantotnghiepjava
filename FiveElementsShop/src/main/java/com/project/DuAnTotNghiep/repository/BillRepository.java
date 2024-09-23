package com.project.DuAnTotNghiep.repository;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.DuAnTotNghiep.dto.Bill.BillDetailDtoInterface;
import com.project.DuAnTotNghiep.dto.Bill.BillDetailProduct;
import com.project.DuAnTotNghiep.dto.Bill.BillDtoInterface;
import com.project.DuAnTotNghiep.dto.Refund.RefundDto;
import com.project.DuAnTotNghiep.dto.Statistic.OrderStatistic;
import com.project.DuAnTotNghiep.entity.Bill;
import com.project.DuAnTotNghiep.entity.enumClass.BillStatus;
import com.project.DuAnTotNghiep.entity.enumClass.InvoiceType;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long>, JpaSpecificationExecutor<Bill> {

        @Query(value = "SELECT DISTINCT b.id AS maHoaDon,b.code AS maDinhDanh, a.name AS hoVaTen, a.phoneNumber " +
                        "AS soDienThoai,b.createDate AS ngayTao, b.amount AS tongTien, b.status AS trangThai, b.invoiceType "
                        +
                        "AS loaiDon, pm.name AS hinhThucThanhToan, coalesce(br.code, '') as maDoiTra, pmt.orderId as maGiaoDich "
                        +
                        "FROM Bill b " +
                        "JOIN Payment pmt on b.id = pmt.bill.id " +
                        "LEFT JOIN Customer a ON b.customer.id = a.id " +
                        "LEFT JOIN BillDetail bd ON b.id = bd.bill.id " +
                        "LEFT JOIN PaymentMethod pm ON b.paymentMethod.id = pm.id LEFT JOIN BillReturn br on b.id = br.bill.id")
        Page<BillDtoInterface> listBill(Pageable pageable);

        @Query(value = "SELECT DISTINCT b.id AS maHoaDon,b.code AS maDinhDanh, a.name AS hoVaTen, a.phoneNumber " +
                        "AS soDienThoai, b.createDate AS ngayTao, b.amount AS tongTien, b.status AS trangThai, b.invoiceType "
                        +
                        "AS loaiDon, pm.name AS hinhThucThanhToan, coalesce(br.code, '') as maDoiTra " +
                        "FROM Bill b " +
                        "LEFT JOIN Customer a ON b.customer.id = a.id " +
                        "LEFT JOIN BillDetail bd ON b.id = bd.bill.id " +
                        "LEFT JOIN PaymentMethod pm ON b.paymentMethod.id = pm.id left join BillReturn br on b.id = br.bill.id "
                        +
                        "WHERE (:maDinhDanh IS NULL OR b.code LIKE CONCAT('%', :maDinhDanh, '%')) " +
                        "AND (:ngayTaoStart IS NULL OR :ngayTaoEnd IS NULL OR (b.createDate BETWEEN :ngayTaoStart AND :ngayTaoEnd)) "
                        +
                        "AND (:trangThai IS NULL OR b.status = :trangThai) " +
                        "AND (:loaiDon IS NULL OR b.invoiceType= :loaiDon) " +
                        "AND (:soDienThoai IS NULL OR a.phoneNumber IS NULL OR a.phoneNumber LIKE CONCAT('%', :soDienThoai, '%')) "
                        +
                        "AND (:hoVaTen IS NULL OR a.name IS NULL OR a.name LIKE CONCAT('%', :hoVaTen, '%'))")
        Page<BillDtoInterface> listSearchBill(
                        @Param("maDinhDanh") String maDinhDanh,
                        @Param("ngayTaoStart") LocalDateTime ngayTaoStart,
                        @Param("ngayTaoEnd") LocalDateTime ngayTaoEnd,
                        @Param("trangThai") BillStatus trangThai,
                        @Param("loaiDon") InvoiceType loaiDon,
                        @Param("soDienThoai") String soDienThoai,
                        @Param("hoVaTen") String hoVaTen,
                        Pageable pageable);

        @Modifying
        @Query(value = "UPDATE bill SET status=:status WHERE id=:id", nativeQuery = true)
        @Transactional
        int updateStatus(@Param("status") String status, @Param("id") Long id);

        @Query(value = "SELECT DISTINCT b.id AS maDonHang, b.code AS maDinhDanh, b.billing_address AS diaChi, " +
                        "b.amount AS tongTien, b.promotion_price AS tienKhuyenMai, a.name AS tenKhachHang, " +
                        "a.phone_number AS soDienThoai, a.email AS email, b.status AS trangThaiDonHang, " +
                        "pmt.order_id AS maGiaoDich, pm.name AS phuongThucThanhToan, " +
                        "b.invoice_type AS loaiHoaDon, dc.code AS voucherName, b.create_date AS createdDate " +
                        "FROM bill b " +
                        "LEFT JOIN customer a ON b.customer_id = a.id " +
                        "LEFT JOIN discount_code dc ON b.discount_code_id = dc.id " +
                        "LEFT JOIN bill_detail bd ON b.id = bd.bill_id " +
                        "LEFT JOIN payment pmt ON b.id = pmt.bill_id " +
                        "LEFT JOIN payment_method pm ON b.payment_method_id = pm.id " +
                        "WHERE b.id = :maHoaDon", nativeQuery = true)
        BillDetailDtoInterface getBillDetail(@Param("maHoaDon") Long maHoaDon);

        @Query(value = "SELECT " +
                        "    pd.id, " +
                        "    bd.id AS billDetailId, " +
                        "    p.id AS productId, " +
                        "    p.name AS tenSanPham, " +
                        "    c.name AS tenMau, " +
                        "    s.name AS kichCo, " +
                        "    bd.moment_price AS giaTien, " +
                        "    bd.quantity AS soLuong, " +
                        "    bd.moment_price * bd.quantity AS tongTien,  " +
                        "    (SELECT link " +
                        "     FROM image " +
                        "     WHERE p.id = image.product_id " +
                        "     LIMIT 1) AS imageUrl " +
                        "FROM " +
                        "    bill b " +
                        "JOIN " +
                        "    bill_detail bd ON b.id = bd.bill_id " +
                        "JOIN " +
                        "    product_detail pd ON bd.product_detail_id = pd.id " +
                        "JOIN " +
                        "    product p ON pd.product_id = p.id " +
                        "JOIN " +
                        "    color c ON pd.color_id = c.id " +
                        "JOIN " +
                        "    size s ON pd.size_id = s.id " +
                        "WHERE " +
                        "    b.id = :maHoaDon", nativeQuery = true)
        List<BillDetailProduct> getBillDetailProduct(@Param("maHoaDon") Long maHoaDon);

        Bill findTopByOrderByIdDesc();

        Page<Bill> findAllByStatusAndCustomer_Account_Id(BillStatus status, Long id, Pageable pageable);

        Page<Bill> findByCustomer_Account_Id(Long id, Pageable pageable);

        @Query(value = "select * from bill b where DATEDIFF(DAY, b.create_date, GETDATE()) <= 7 and b.status='HOAN_THANH'", nativeQuery = true)
        Page<Bill> findValidBillToReturn(Pageable pageable);

        @Query(value = "SELECT \n" +
                        "    COALESCE(SUM(b.amount), 0) - COALESCE(SUM(br.return_money), 0) + COALESCE(SUM(rd.quantity_return * pd.price), 0) AS total\n"
                        +
                        "FROM \n" +
                        "    bill b \n" +
                        "    LEFT JOIN bill_return br ON b.id = br.bill_id \n" +
                        "    LEFT JOIN return_detail rd ON br.id = rd.id \n" +
                        "    LEFT JOIN product_detail pd ON rd.product_detail_id = pd.id \n" +
                        "WHERE \n" +
                        "    b.status = 'HOAN_THANH';", nativeQuery = true)
        Double calculateTotalRevenue();

        @Query(value = "SELECT\n" +
                        "    COALESCE(SUM(b.amount), 0) - COALESCE(SUM(br.return_money), 0) + COALESCE(SUM(rd.quantity_return * pd.price), 0) AS total\n"
                        +
                        "FROM\n" +
                        "    bill b\n" +
                        "LEFT JOIN\n" +
                        "    bill_return br ON b.id = br.bill_id\n" +
                        "LEFT JOIN\n" +
                        "    return_detail rd ON br.id = rd.id\n" +
                        "LEFT JOIN\n" +
                        "    product_detail pd ON rd.product_detail_id = pd.id\n" +
                        "WHERE\n" +
                        "    b.status = 'HOAN_THANH'\n" +
                        "    AND (\n" +
                        "        (b.create_date BETWEEN :startDate AND :endDate)\n" +

                        "    )", nativeQuery = true)
        Double calculateTotalRevenueFromDate(String startDate, String endDate);

        @Query(value = "SELECT CONVERT(DATE, create_date) AS date, COALESCE(SUM(b.amount), 0) - COALESCE(SUM(br.return_money), 0) + COALESCE(SUM(rd.quantity_return * pd.price), 0) AS revenue\n"
                        +
                        "FROM bill b LEFT JOIN bill_return br ON b.id = br.bill_id LEFT JOIN return_detail rd ON br.id = rd.id\n"
                        +
                        "LEFT JOIN product_detail pd ON rd.product_detail_id = pd.id " +
                        "WHERE (YEAR(b.create_date) = :year AND MONTH(b.create_date) = :month AND b.status='HOAN_THANH' ) "
                        +
                        "GROUP BY CONVERT(DATE, create_date)\n" +
                        "ORDER BY CONVERT(DATE, create_date);", nativeQuery = true)
        List<Object[]> statisticRevenueDayInMonth(String month, String year);

        @Query(value = "SELECT MONTH(create_date) AS month, COALESCE(SUM(b.amount), 0) - COALESCE(SUM(br.return_money), 0) + COALESCE(SUM(rd.quantity_return * pd.price), 0) AS revenue\n"
                        +
                        "FROM bill b LEFT JOIN bill_return br ON b.id = br.bill_id LEFT JOIN return_detail rd ON br.id = rd.id\n"
                        +
                        "LEFT JOIN product_detail pd ON rd.product_detail_id = pd.id\n" +
                        "WHERE YEAR(b.create_date) = :year and b.status='HOAN_THANH' \n" +
                        "GROUP BY MONTH(b.create_date)\n" +
                        "ORDER BY MONTH(b.create_date)", nativeQuery = true)
        List<Object[]> statisticRevenueMonthInYear(String year);

        @Query("select b from Bill b where b.status = 'HOAN_THANH' AND b.createDate between :fromDate and :toDate")
        List<Bill> findAllCompletedByDate(@Param("fromDate") LocalDateTime fromDate,
                        @Param("toDate") LocalDateTime toDate);

        @Query("select count(b) from Bill b where b.status='CHO_XAC_NHAN'")
        int getTotalBillStatusWaiting();

        @Query(value = "SELECT " +
                        "DATE_FORMAT(b.create_date, '%m-%Y') AS date, " +
                        "COALESCE(SUM(b.amount), 0) - COALESCE(SUM(br.return_money), 0) + COALESCE(SUM(rd.quantity_return * pd.price), 0) AS revenue "
                        +
                        "FROM bill b " +
                        "LEFT JOIN bill_return br ON b.id = br.bill_id " +
                        "LEFT JOIN return_detail rd ON br.id = rd.bill_return_id " +
                        "LEFT JOIN product_detail pd ON rd.product_detail_id = pd.id " +
                        "WHERE b.status = 'HOAN_THANH' AND b.create_date BETWEEN :fromDate AND :toDate " +
                        "GROUP BY DATE_FORMAT(b.create_date, '%m-%Y') " +
                        "ORDER BY DATE_FORMAT(b.create_date, '%m-%Y')", nativeQuery = true)
        List<Object[]> statisticRevenueFormMonth(@Param("fromDate") String fromDate, @Param("toDate") String toDate);

        @Query(value = "SELECT " +
                        "DATE_FORMAT(b.create_date, '%Y-%m-%d') AS date, " +
                        "COALESCE(SUM(b.amount), 0) - COALESCE(SUM(br.return_money), 0) + COALESCE(SUM(rd.quantity_return * pd.price), 0) AS revenue "
                        +
                        "FROM bill b " +
                        "LEFT JOIN bill_return br ON b.id = br.bill_id " +
                        "LEFT JOIN return_detail rd ON br.id = rd.bill_return_id " +
                        "LEFT JOIN product_detail pd ON rd.product_detail_id = pd.id " +
                        "WHERE b.status = 'HOAN_THANH' AND b.create_date BETWEEN :fromDate AND :toDate " +
                        "GROUP BY DATE_FORMAT(b.create_date, '%Y-%m-%d') " +
                        "ORDER BY DATE_FORMAT(b.create_date, '%Y-%m-%d')", nativeQuery = true)
        List<Object[]> statisticRevenueDaily(@Param("fromDate") String fromDate, @Param("toDate") String toDate);

        @Query(value = "select status, count(b.status) as quantity, sum(b.amount) as revenue from bill b group by b.status", nativeQuery = true)
        List<OrderStatistic> statisticOrder();

        @Query(value = "SELECT " +
                        "b.code AS billCode, " +
                        "b.id AS billId, " +
                        "pm.order_id AS orderId, " +
                        "c.name AS customerName, " +
                        "b.update_date AS cancelDate, " +
                        "b.amount AS totalAmount, " +
                        "pm.status_exchange AS statusExchange " +
                        "FROM bill b " +
                        "LEFT JOIN customer c ON b.customer_id = c.id " +
                        "LEFT JOIN payment pm ON pm.bill_id = b.id " +
                        "JOIN payment_method pme ON pme.id = b.payment_method_id " +
                        "WHERE b.status = 'HUY' " +
                        "AND pme.name = 'CHUYEN_KHOAN' " +
                        "ORDER BY b.update_date DESC", nativeQuery = true)
        List<RefundDto> findListNeedRefund();

        @Query(value = "SELECT DISTINCT " +
                        "b.id AS maHoaDon, " +
                        "b.code AS maDinhDanh, " +
                        "a.name AS hoVaTen, " +
                        "a.phoneNumber AS soDienThoai, " +
                        "b.createDate AS ngayTao, " +
                        "b.amount AS tongTien, " +
                        "b.status AS trangThai, " +
                        "b.invoiceType AS loaiDon, " +
                        "pm.name AS hinhThucThanhToan, " +
                        "COALESCE(br.code, '') AS maDoiTra, " +
                        "pmt.orderId AS maGiaoDich " +
                        "FROM Bill b " +
                        "JOIN Payment pmt ON b.id = pmt.bill_id " +
                        "LEFT JOIN Customer a ON b.customer_id = a.id " +
                        "LEFT JOIN BillDetail bd ON b.id = bd.bill_id " +
                        "LEFT JOIN PaymentMethod pm ON b.payment_method_id = pm.id " +
                        "LEFT JOIN BillReturn br ON b.id = br.bill_id", nativeQuery = true)
        List<BillDtoInterface> listBill();

        @Query(value = "SELECT DISTINCT b.id AS maHoaDon,b.code AS maDinhDanh, a.name AS hoVaTen, a.phoneNumber " +
                        "AS soDienThoai, b.createDate AS ngayTao, b.amount AS tongTien, b.status AS trangThai, b.invoiceType "
                        +
                        "AS loaiDon, pm.name AS hinhThucThanhToan, coalesce(br.code, '') as maDoiTra " +
                        "FROM Bill b " +
                        "LEFT JOIN Customer a ON b.customer.id = a.id " +
                        "LEFT JOIN BillDetail bd ON b.id = bd.bill.id " +
                        "LEFT JOIN PaymentMethod pm ON b.paymentMethod.id = pm.id left join BillReturn br on b.id = br.bill.id "
                        +
                        "WHERE (:maDinhDanh IS NULL OR b.code LIKE CONCAT('%', :maDinhDanh, '%')) " +
                        "AND (:ngayTaoStart IS NULL OR :ngayTaoEnd IS NULL OR (b.createDate BETWEEN :ngayTaoStart AND :ngayTaoEnd)) "
                        +
                        "AND (:trangThai IS NULL OR b.status = :trangThai) " +
                        "AND (:loaiDon IS NULL OR b.invoiceType= :loaiDon) " +
                        "AND (:soDienThoai IS NULL OR a.phoneNumber IS NULL OR a.phoneNumber LIKE CONCAT('%', :soDienThoai, '%')) "
                        +
                        "AND (:hoVaTen IS NULL OR a.name IS NULL OR a.name LIKE CONCAT('%', :hoVaTen, '%'))")
        List<BillDtoInterface> listSearchBill(@Param("maDinhDanh") String maDinhDanh,
                        @Param("ngayTaoStart") LocalDateTime ngayTaoStart,
                        @Param("ngayTaoEnd") LocalDateTime ngayTaoEnd,
                        @Param("trangThai") BillStatus trangThai,
                        @Param("loaiDon") InvoiceType loaiDon,
                        @Param("soDienThoai") String soDienThoai,
                        @Param("hoVaTen") String hoVaTen);
}