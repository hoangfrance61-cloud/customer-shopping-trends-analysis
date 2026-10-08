# Phân tích xu hướng mua sắm của khách hàng

Dự án cuối khóa Data Analyst (Rikkei x Đại học Bách Khoa Hà Nội).

## Bài toán
Phân tích hành vi mua sắm của khách hàng để xác định nhóm sản phẩm chủ lực,
đặc điểm khách hàng đăng ký thành viên, xu hướng chi tiêu theo mùa và phương thức thanh toán.

## Dữ liệu
- Nguồn: [Customer Shopping Trends Dataset](https://www.kaggle.com/datasets/iamsouravbanerjee/customer-shopping-trends-dataset) (Kaggle)
- Lưu ý: đây là bộ dữ liệu mô phỏng (synthetic) dùng cho mục đích học tập và thực hành.
- Quy mô: 3.900 khách hàng, [số cột] thuộc tính

## Công cụ
- **SQL:** truy vấn, tổng hợp dữ liệu
- **Power BI:** xây dựng dashboard trực quan hóa

## Chỉ số tổng quan
| Tổng khách hàng | Chi tiêu trung bình | Đánh giá trung bình | Tổng doanh thu |
|---|---|---|---|
| 3.900 | 59,76 | 3,75 | 233,08K |

## Insight chính
- **Quần áo (Clothing) là danh mục trụ cột:** 1,74K đơn hàng (44,54%), tiếp theo là Accessories (31,79%), Footwear (≈15,4%) và Outerwear (8,31%).
- **Không có sản phẩm nào vượt trội:** các mặt hàng bán chạy nhất (Blouse, Jewelry, Pants, Shirt, Dress) cùng ở mức khoảng 170 đơn.
- **Chi tiêu theo mùa ổn định:** chi tiêu trung bình mỗi mùa dao động nhẹ quanh mức 59-61, cao nhất vào mùa Thu.
- **Khách hàng đăng ký thành viên đều là nam giới:** khoảng 40% khách nam đăng ký, không có khách nữ nào đăng ký.
- **Phương thức thanh toán cân bằng:** Credit Card cao nhất (≈690 giao dịch), các phương thức còn lại ở mức ≈630-650.
- **Khuyến mãi:** [điền kết quả so sánh chi tiêu có/không dùng khuyến mãi, xem lưu ý bên dưới]

## Dashboard
![Dashboard tổng quan](Dashboard%20PowerBi.png)

## Tài liệu trong repo
- [FinalProject.sql](FinalProject.sql): các truy vấn SQL
- [DashBoard Final Project.pbix](DashBoard%20Final%20Project.pbix): file Power BI
