USE FinalProject

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'shopping_trends'
ORDER BY ORDINAL_POSITION;

-- Làm sạch dữ liệu
--a. Kiểm tra tổng số dòng đã import
SELECT COUNT(*) AS Tong_Dong FROM shopping_trends;

--b. Kiểm tra giá trị thiếu (null) theo từng cột
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null,
    SUM(CASE WHEN Purchase_Amount_USD IS NULL THEN 1 ELSE 0 END) AS PurchaseAmount_Null,
    SUM(CASE WHEN Review_Rating IS NULL THEN 1 ELSE 0 END) AS Rating_Null
FROM shopping_trends;

--c. Kiểm tra dòng trùng lặp (theo Customer_ID)
SELECT Customer_ID, COUNT(*) AS SoLan
FROM shopping_trends
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

--d. Kiểm tra kiểu dữ liệu hiện tại của các cột số quan trọng
SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'shopping_trends'
  AND COLUMN_NAME IN ('Purchase_Amount_USD', 'Review_Rating');

--e. Sửa kiểu dữ liệu để hiển thị số đẹp (chỉ chạy nếu bước d cho thấy chưa đúng)
ALTER TABLE shopping_trends ALTER COLUMN Purchase_Amount_USD DECIMAL(10,1);
ALTER TABLE shopping_trends ALTER COLUMN Review_Rating DECIMAL(3,1);

--f. Kiểm tra giá trị bất thường (khoảng giá trị) ở các cột số
SELECT
    MIN(Age) AS Min_Age, MAX(Age) AS Max_Age,
    MIN(Purchase_Amount_USD) AS Min_Purchase, MAX(Purchase_Amount_USD) AS Max_Purchase,
    MIN(Review_Rating) AS Min_Rating, MAX(Review_Rating) AS Max_Rating
FROM shopping_trends;


--Phân tích mô tả dữ liệu
--a. Thống kê mô tả cơ bản cho Purchase_Amount_USD
SELECT
    ROUND(AVG(Purchase_Amount_USD), 1) AS Trung_Binh,
    ROUND(STDEV(Purchase_Amount_USD), 1) AS Do_Lech_Chuan,
    MIN(Purchase_Amount_USD) AS Nho_Nhat,
    MAX(Purchase_Amount_USD) AS Lon_Nhat
FROM shopping_trends;

--b. Trung vị và các phân vị (median, Q1, Q3)
SELECT DISTINCT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Purchase_Amount_USD) OVER() AS Q1,
    PERCENTILE_CONT(0.5)  WITHIN GROUP (ORDER BY Purchase_Amount_USD) OVER() AS Trung_Vi,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Purchase_Amount_USD) OVER() AS Q3
FROM shopping_trends;

--c. Thống kê mô tả cho Age và Review_Rating
SELECT
    ROUND(AVG(CAST(Age AS FLOAT)), 1) AS Age_TB,
    ROUND(STDEV(Age), 1) AS Age_DoLech,
    ROUND(AVG(Review_Rating), 1) AS Rating_TB,
    ROUND(STDEV(Review_Rating), 1) AS Rating_DoLech
FROM shopping_trends;

--d. Số lượng đơn hàng theo từng danh mục
SELECT Category, COUNT(*) AS So_Luong
FROM shopping_trends
GROUP BY Category
ORDER BY So_Luong DESC;

--e. Chi tiêu trung bình theo danh mục
SELECT Category,
       COUNT(*) AS So_Don_Hang,
       AVG(Purchase_Amount_USD) AS Chi_Tieu_TB
FROM shopping_trends
GROUP BY Category
ORDER BY So_Don_Hang DESC;

--f. Chi tiêu trung bình theo mùa
SELECT Season,
       COUNT(*) AS So_Don_Hang,
       AVG(Purchase_Amount_USD) AS Chi_Tieu_TB
FROM shopping_trends
GROUP BY Season;

--g. Số lượng khách hàng theo giới tính
SELECT Gender, COUNT(*) AS So_Luong
FROM shopping_trends
GROUP BY Gender;

--h. PHÁT HIỆN QUAN TRỌNG: Đăng ký thành viên (Subscription) theo giới tính
SELECT Gender, Subscription_Status, COUNT(*) AS So_Luong
FROM shopping_trends
GROUP BY Gender, Subscription_Status
ORDER BY Gender, Subscription_Status;

--i. Chi tiêu trung bình: có giảm giá vs không
SELECT Discount_Applied,
       COUNT(*) AS So_Don_Hang,
       AVG(Purchase_Amount_USD) AS Chi_Tieu_TB
FROM shopping_trends
GROUP BY Discount_Applied;

--j. Phương thức thanh toán phổ biến
SELECT Payment_Method, COUNT(*) AS So_Luong
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY So_Luong DESC;

--k. Top 10 sản phẩm bán chạy nhất
SELECT TOP 10 Item_Purchased, COUNT(*) AS So_Luot_Mua
FROM shopping_trends
GROUP BY Item_Purchased
ORDER BY So_Luot_Mua DESC;

--l. Tần suất mua hàng
SELECT Frequency_of_Purchases, COUNT(*) AS So_Luong
FROM shopping_trends
GROUP BY Frequency_of_Purchases
ORDER BY So_Luong DESC;

--m. Chi tiêu trung bình theo nhóm tuổi
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56-70'
    END AS Nhom_Tuoi,
    COUNT(*) AS So_Luong,
    AVG(Purchase_Amount_USD) AS Chi_Tieu_TB
FROM shopping_trends
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56-70'
    END
ORDER BY Nhom_Tuoi;