# Phân tích xu hướng mua sắm của khách hàng

Dự án cuối khóa Data Analyst (Rikkei x Đại học Bách Khoa Hà Nội).

## Bài toán
Phân tích hành vi mua sắm của khách hàng để xác định nhóm sản phẩm chủ lực,
đặc điểm khách hàng, phương thức thanh toán và hiệu quả của chương trình khuyến mãi.

## Dữ liệu
- Nguồn: [Customer Shopping Trends Dataset](https://www.kaggle.com/datasets/iamsouravbanerjee/customer-shopping-trends-dataset) (Kaggle, tác giả Sourav Banerjee)
- Lưu ý: đây là bộ dữ liệu mô phỏng (synthetic) dùng cho mục đích học tập và thực hành.
- Quy mô: 3900 bản ghi, 19 thuộc tính
- Nội dung: thông tin nhân khẩu học của khách hàng, danh mục sản phẩm, giá trị đơn hàng, phương thức thanh toán, khuyến mãi, đánh giá...

## Công cụ
- **SQL:** truy vấn, tổng hợp dữ liệu
- **Power BI:** xây dựng dashboard trực quan hóa

## Insight chính
- Danh mục **quần áo** là nhóm sản phẩm trụ cột, chiếm [X%] doanh thu.
- Mức chi tiêu giữa các nhóm khách hàng khá đồng đều ([số liệu, ví dụ chi tiêu trung bình].
- Khách hàng đăng ký chủ yếu là nam giới ([X%]).
- Các phương thức thanh toán phân bổ cân bằng ([tỷ lệ từng phương thức]).
- Chương trình khuyến mãi chưa tạo hiệu quả rõ rệt ([so sánh có/không khuyến mãi]).

## Dashboard
![Dashboard tổng quan](Dashboard%20PowerBi.png)

## Tài liệu trong repo
- [FinalProject.sql](FinalProject.sql): các truy vấn SQL
- [DashBoard Final Project.pbix](DashBoard%20Final%20Project.pbix): file Power BI
