-- Chọn cơ sở dữ liệu mẫu
USE classicmodels;

-- ================================================
-- 1. Tạo Stored Procedure đầu tiên
-- Khái niệm: Lưu trữ tập lệnh SQL để tái sử dụng nhiều lần.
-- ================================================
DELIMITER //

CREATE PROCEDURE findAllCustomers()
BEGIN
  SELECT * FROM customers;
END //

DELIMITER ;

-- Gọi Stored Procedure vừa tạo
CALL findAllCustomers();


-- ================================================
-- 2. Sửa/Cập nhật Stored Procedure
-- Do MySQL không có lệnh ALTER trực tiếp cho logic procedure, 
-- ta thực hiện DROP (xóa nếu tồn tại) rồi CREATE lại.
-- ================================================
DELIMITER //

DROP PROCEDURE IF EXISTS findAllCustomers //

CREATE PROCEDURE findAllCustomers()
BEGIN
  SELECT * FROM customers WHERE customerNumber = 175;
END //

DELIMITER ;

-- Gọi lại Stored Procedure sau khi đã cập nhật logic
CALL findAllCustomers();


-- ================================================
-- 3. Xóa Stored Procedure
-- ================================================
DROP PROCEDURE IF EXISTS findAllCustomers;