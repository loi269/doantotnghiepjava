package com.project.DuAnTotNghiep.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.DuAnTotNghiep.dto.Product.ProductSearchDto;
import com.project.DuAnTotNghiep.dto.Statistic.BestSellerProduct;
import com.project.DuAnTotNghiep.dto.Statistic.ProductStatistic;
import com.project.DuAnTotNghiep.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
        Product findByCode(String code);

        @Query("SELECT p FROM Product p WHERE p.name LIKE %:name%")
        Page<Product> getAllByName(String name, Pageable pageable);

        boolean existsByCode(String code);

        Page<Product> findAllByStatus(int status, Pageable pageable);

        Page<Product> findAllByStatusAndDeleteFlag(int status, boolean deleteFlag, Pageable pageable);

        @Query(value = "SELECT p.id as id, " +
                        "p.code as code, " +
                        "p.name as name, " +
                        "br.name as brandName, " +
                        "mt.name as materialName, " +
                        "ct.name as categoryName " +
                        // "p.price as price " +
                        "from Product p " +
                        "inner join Brand br on br.id = p.brand.id " +
                        "inner join Material mt on mt.id = p.material.id " +
                        "inner join Category ct on ct.id = p.category.id " +
                        "WHERE p.name LIKE %:productName% and p.deleteFlag=false ")
        Page<Product> searchProductName(String productName, Pageable pageable);

        @Query(value = "SELECT p.id as idSanPham,p.code as maSanPham,p.name as tenSanPham,p.brand.name as nhanHang,p.material.name as chatLieu,p.category.name as theLoai,p.status as trangThai FROM Product p where (:maSanPham is null or p.code like CONCAT('%', :maSanPham, '%')) and "
                        +
                        "(:tenSanPham is null or p.name like CONCAT('%', :tenSanPham, '%')) and (:nhanHang is null or p.brand.id=:nhanHang) and "
                        +
                        "(:chatLieu is null or p.material.id=:chatLieu) and (:theLoai is null or p.category.id=:theLoai) and (:trangThai is null or p.status=:trangThai) and(p.deleteFlag = false)")
        Page<ProductSearchDto> listSearchProduct(String maSanPham, String tenSanPham, Long nhanHang, Long chatLieu,
                        Long theLoai, Integer trangThai, Pageable pageable);

        @Query(value = "SELECT p.id as idSanPham,p.code as maSanPham,p.name as tenSanPham,p.brand.name as nhanHang,p.material.name as chatLieu,p.category.name as theLoai,p.status as trangThai FROM Product p where p.deleteFlag = false")
        Page<ProductSearchDto> getAll(Pageable pageable);

        Page<Product> findAllByDeleteFlagFalse(Pageable pageable);

        @Query("select p from Product p join ProductDetail pd on p.id = pd.product.id where pd.id = :productDetaiLId")
        Product findByProductDetail_Id(Long productDetaiLId);

        Product findTopByOrderByIdDesc();

        @Query(value = "SELECT p.id, " +
                        "       p.code, " +
                        "       p.name, " +
                        "       (SELECT image.link FROM image WHERE image.product_id = p.id LIMIT 1) AS imageUrl, " +
                        "       brand.name AS brand, " +
                        "       cat.name AS category, " +
                        "       COALESCE(SUM(bd.quantity), 0) AS totalQuantity, " +
                        "       COALESCE(SUM(bd.return_quantity), 0) AS totalQuantityReturn, " +
                        "       SUM(bd.quantity * bd.moment_price) AS revenue " +
                        "FROM bill b " +
                        "JOIN bill_detail bd ON b.id = bd.bill_id " +
                        "JOIN product_detail pd ON pd.id = bd.product_detail_id " +
                        "JOIN product p ON p.id = pd.product_id " +
                        "LEFT JOIN bill_return br ON br.bill_id = b.id " +
                        "JOIN brand ON brand.id = p.brand_id " +
                        "JOIN category cat ON cat.id = p.category_id " +
                        "WHERE b.status = 'HOAN_THANH' " +
                        "GROUP BY p.id, p.code, p.name, brand.name, cat.name " +
                        "ORDER BY totalQuantity DESC " +
                        "LIMIT 10", nativeQuery = true)
        List<BestSellerProduct> getBestSellerProduct();

        @Query(value = "SELECT p.id, p.code, p.name, " +
                        "       (SELECT image.link FROM image WHERE image.product_id = p.id LIMIT 1) AS imageUrl, " +
                        "       brand.name AS brand, cat.name AS category, " +
                        "       COALESCE(SUM(bd.quantity), 0) AS totalQuantity, " +
                        "       COALESCE(SUM(bd.return_quantity), 0) AS totalQuantityReturn, " +
                        "       SUM(bd.quantity * bd.moment_price) AS revenue " +
                        "FROM bill b " +
                        "JOIN bill_detail bd ON b.id = bd.bill_id " +
                        "JOIN product_detail pd ON pd.id = bd.product_detail_id " +
                        "JOIN product p ON p.id = pd.product_id " +
                        "LEFT JOIN bill_return br ON br.bill_id = b.id " +
                        "JOIN brand ON brand.id = p.brand_id " +
                        "JOIN category cat ON cat.id = p.category_id " +
                        "WHERE b.status = 'HOAN_THANH' AND b.create_date BETWEEN :fromDate AND :toDate " +
                        "GROUP BY p.id, p.code, p.name, brand.name, cat.name " +
                        "ORDER BY totalQuantity DESC " +
                        "LIMIT 10", nativeQuery = true)
        List<BestSellerProduct> getBestSellerProduct(@Param("fromDate") String fromDate,
                        @Param("toDate") String toDate);

        // @Query(value = "SELECT p.id, p.code, p.name, COALESCE(SUM(bd.quantity),0) AS
        // totalQuantity, COALESCE(SUM(bd.return_quantity),0) AS totalQuantityReturn,
        // SUM(bd.quantity * bd.moment_price) as revenue\n" +
        // "FROM bill b\n" +
        // "\t JOIN bill_detail bd ON bd.id = b.id\n" +
        // "\t JOIN product_detail pd ON bd.id = pd.id\n" +
        // "\t JOIN product p on p.id = pd.product_id\n" +
        // "\tleft join bill_return br ON b.id = br.bill_id\n" +
        // "\tleft JOIN return_detail rd ON br.id = rd.id\n" +
        // "\t JOIN image i on i.product_id = p.id\n" +
        // "WHERE b.status = 'HOAN_THANH' AND b.create_date BETWEEN :fromDate AND
        // :toDate\n" +
        // "GROUP BY p.id, p.code, p.name",nativeQuery = true)
        // List<ProductStatistic> getStatisticProduct(String fromDate, String toDate);

        @Query(value = "SELECT\n" +
                        "    p.id,\n" +
                        "    p.code,\n" +
                        "    p.name,\n" +
                        "    brand.name AS brand,\n" +
                        "    cat.name AS category,\n" +
                        "    COALESCE(SUM(bd.quantity), 0) AS totalQuantity,\n" +
                        "    COALESCE(SUM(bd.return_quantity), 0) AS totalQuantityReturn,\n" +
                        "    COALESCE(SUM(bd.quantity * bd.moment_price), 0) AS revenue\n" +
                        "FROM\n" +
                        "    product p\n" +
                        "JOIN\n" +
                        "    product_detail pd ON p.id = pd.product_id\n" +
                        "LEFT JOIN\n" +
                        "    bill_detail bd ON pd.id = bd.product_detail_id\n" +
                        "LEFT JOIN\n" +
                        "    bill b ON bd.bill_id = b.id\n" +
                        "LEFT JOIN\n" +
                        "    brand ON brand.id = p.brand_id\n" +
                        "LEFT JOIN\n" +
                        "    category cat ON cat.id = p.category_id\n" +
                        "WHERE (b.status = 'HOAN_THANH' AND b.create_date BETWEEN :fromDate AND :toDate OR b.status IS NULL)\n"
                        +
                        "GROUP BY\n" +
                        "    p.id, p.code, p.name, brand.name, cat.name;", nativeQuery = true)
        List<ProductStatistic> getStatisticProduct(@Param("fromDate") String fromDate, @Param("toDate") String toDate);

}