Create Database QL_Shop
go
use QL_Shop
go

Create Table Administrator(
	taikhoan varchar(500) ,
	matkhau varchar(500),
	constraint pk_admin primary key (taikhoan)
)
select * from Administrator

Create Table Nhom(
	maNhom int identity(1,1) ,
	tenNhom Nvarchar(100),
	hinhanhdaidien Nvarchar(MAX)
	constraint pk_Nhom primary key (maNhom)
)

Create Table Loai(
	maLoai int identity(1,1) ,
	maNhom int ,
	tenloai Nvarchar(100),
	constraint pk_Loai primary key (maLoai),
	constraint fk_Loai_Nhom foreign key (maNhom) references Nhom(maNhom),
)
 select * from Loai

Create Table nhaCungCap(
	maNCC int identity(1,1) ,
	tenNCC Nvarchar(100),
	sdtNCC varchar(20),
	email varchar(50),
	diachi Nvarchar(MAX),
	hinhanh Nvarchar(MAX),
	mota Nvarchar(MAX)
	constraint pk_NCC primary key (maNCC),
)

Create Table sanPham(
	maSP varchar(50) ,
	maNCC int ,
	maLoai int ,
	tenSP Nvarchar(200),
	Size varchar(10),
	dongia decimal(18,0) null,	
	hinhanh Nvarchar(MAX),
	mota Nvarchar(MAX),
	constraint pk_sanPham primary key (maSP),
	constraint fk_NCC_SP foreign key (maNCC) references nhaCungCap(maNCC),
	constraint fk_Loai_SP foreign key (maLoai) references Loai(maLoai),
	
)

Create Table KhachHang(
	maKH int identity(1,1) ,
	tenKH Nvarchar(200),
	sdtKhach varchar(20) ,	
	Email varchar(100),
	diachi Nvarchar(500),
	TaiKhoan varchar(50) NULL,
	MatKhau nvarchar(50) NULL,
	constraint pk_khachhang primary key (maKH)
)

Create Table HoaDon(
	maHD int identity(1,1) ,
	maKH int,
	sdtKhach varchar(20) ,
	ghichu Nvarchar(MAX),
	ngaymua datetime null,
	ngaygiao datetime null,
	DaThanhToan nvarchar(50),
	trangthaiHD Nvarchar(50),
	constraint pk_HD primary key (maHD),
	constraint fk_HD_KH foreign key (maKH) references KhachHang(maKH),
)

Create Table chiTietHoaDon(
	maHD int identity(1,1) ,
	maSP varchar(50) ,
	soluong int,
	ThanhTien decimal(18,0) null,
	Constraint PK_OrderDetails Primary key (maHD, maSP),
	constraint fk_HD_CTHD foreign key (maHD) references HoaDon(maHD),
	constraint fk_SP_CTHD foreign key (maSP) references sanPham(maSP),
)
Create Table Rates(
	maSP varchar(50),
	rateStar int,
	Constraint PK_Rates Primary key (maSP),
	constraint fk_SP_Rate foreign key (maSP) references sanPham(maSP),
)

Create Table Comments(
	commentID int identity(1,1),
	maSP varchar(50) ,
	commentMessage Nvarchar(MAX),
	Constraint PK_Comments Primary key (commentID),
	constraint fk_SP_Com foreign key (maSP) references sanPham(maSP),
)

select * from KhachHang
--Thêm vào bảng Administrator
Insert into Administrator values('admin','admin123')

select * from Administrator
--Thêm vào bảng Nhom
Insert into Nhom values(N'Quần-áo', N'img (7).jpg')--1
Insert into Nhom values(N'Giày-dép', N'img (23).jpg')--2
Insert into Nhom values(N'Mũ(nón)', N'non.jpg')--3
Insert into Nhom values(N'Máy ảnh', N'mayanh.jpg')--4
Insert into Nhom values(N'Điện thoại', N'dienthoai.jpg')--5
Insert into Nhom values(N'Laptop', N'laptop.jpg')--6
--delete from Nhom
select * from Nhom
--Thêm vào bảng Loai
Insert into Loai values(1, N'Quần thun')--1
Insert into Loai values(1, N'Áo thun')--2
Insert into Loai values(1, N'Quần kaki')--3
Insert into Loai values(1, N'Áo sơ mi')--4
Insert into Loai values(1, N'Áo khoác')--5
Insert into Loai values(1, N'Đồ bộ')--6
Insert into Loai values(1, N'Đồ công sở')--7
Insert into Loai values(1, N'Đồ ngủ')--8
Insert into Loai values(1, N'Đồ lót')--9
Insert into Loai values(2, N'Giày thể thao')--10
Insert into Loai values(2, N'Giày thời trang')--11
Insert into Loai values(2, N'Dép lê')--12
Insert into Loai values(2, N'Dép có quai')--13
Insert into Loai values(3, N'Mũ thời trang')--14
Insert into Loai values(3, N'Mũ bảo hiểm')--15
Insert into Loai values(4, N'Máy ảnh SONY')--16
Insert into Loai values(4, N'Máy ảnh CANON')--17
Insert into Loai values(5, N'Iphone')--18
Insert into Loai values(5, N'SamSung')--19
Insert into Loai values(6, N'LapTop DELL')--20
Insert into Loai values(6, N'LapTop ASUS')--21
select * from Loai

--Thêm vào bảng Nhà cung cấp

Insert into nhaCungCap values(N'Adidas','0121269282','adidas@gmail.com',N'TpHCM',N'img (2).png',N'Adidas là tập đoàn thời trang thể thao đa quốc gia đến từ Đức, nổi tiếng toàn cầu và được xem là biểu tượng quyền năng của lĩnh vực thể thao chuyên dụng.')
--1
Insert into nhaCungCap values(N'FILA','0121269202','fila@gmail.com',N'TpHCM',N'img (3).png',N'Thương hiệu thời trang thể thao FILA được anh em nhà Fila của Ý sáng lập vào năm 1911. Ban đầu, FILA chuyên may quần áo, sản phẩm chủ lực của họ là đồ lót cho người dân vùng Alps- nước Ý. Thương hiệu trở nên nổi tiếng hơn khi họ chuyển hướng sang sản xuất chuyên về trang phục thể thao từ thập niên 1970 và tiến tới trở thành thương hiệu thời trang thể thao mang tầm cỡ thế giới. Trong lịch sử hoạt động, FILA từng rơi vào trạng trái “ngụp lặn” với thua lỗ vào năm 2003 trước bối cảnh khủng hoảng kinh tế thế giới vào cuối thế kỷ 20 diễn ra và từng đứng trước nguy cơ đóng cửa trước khi về tay FILA KOREA năm 2017.')
--2
Insert into nhaCungCap values(N'Versage','0121292802','versage@gmail.com',N'TpHCM',N'img (5).jpg',N'Versace là biểu tượng thời trang mang tính di sản của nước Ý với niềm cảm hứng nghệ thuật và thời trang luôn sánh bước cùng nhau. Nhà sáng lập thương hiệu, Gianni Versace là người chịu ảnh hưởng mạnh mẽ bởi truyền thống và lịch sử của vùng đất Hy Lạp cổ đại, ông theo học kiến trúc, nghiên cứu văn hóa, nghệ thuật, ngôn ngữ Latin và Hy Lạp, đồng thời bị hấp dẫn bởi trường phái nghệ thuật đại chúng (Pop Art) của Andy Warhol.')
--3
Insert into nhaCungCap values(N'Chanel','01212692802','chanel@gmail.com',N'TpHCM',N'img (15).jpg',N'Chanel là một trong những thương hiệu thời trang uy tín nhất thế giới với các dòng sản phẩm như thời trang cao cấp, quần áo may sẵn, phụ kiện, nữ trang và nước hoa. Những thiết kế đơn giản mà tinh tế, cổ điển mà hiện đại, sang trọng mà tiện dụng của Chanel luôn được các phái đẹp trên toàn thế giới ưa chuộng và đầy hấp lực với các tín đồ thời trang.')
--4
Insert into nhaCungCap values(N'D&G','0121692802','dg@gmail.com',N'TpHCM',N'img (18).jpg',N'Nhãn hiệu Dolce & Gabbana là một hiện tượng hiếm có của làng thời trang thế giới. Sự gắn kết kỳ lạ của hai gã đồng tính yêu thời trang, Domenico Dolce và Stefano Gabbana, đã khiến họ trở thành cặp đôi bất bại. Từ bàn tay trắng, cả hai cùng nhau gặt hái những đỉnh cao vinh quang cũng như trải qua muôn trùng thử thách. Ngay cả khi tuyên bố chia tay, họ vẫn sát cánh bên nhau, thực hiện sứ mệnh của những ông chủ Dolce & Gabbana chứ không hề đường ai nấy đi.')
--5
Insert into nhaCungCap values(N'LV','01212692802','lv@gmail.com',N'TpHCM',N'img (21).jpg',N'Louis Vuitton (viết tắt là LV) là thương hiệu thời trang cao cấp đến từ Pháp danh giá bậc nhất thế giới, thành lập từ năm 1854, mang tên chính người sáng lập Louis Vuitton. Các sản phẩm của thương hiệu Louis Vuitton hãng bao gồm các vật dụng từ da, túi xách, giày, đồng hồ, va-li du lịch, trang sức và phụ kiện. Nét đặc trưng của tất cả sản phẩm này là họa tiết chữ LV lồng vào nhau và hoa bốn thùy (monogram) cộp mác thương hiệu trên nền da hoặc vải canvas thượng hạng.')
--6
Insert into nhaCungCap values(N'Nike','0212692802','nike@gmail.com',N'TpHCM',N'img (26).jpg',N'Nike là nhà cung cấp giày và quần áo thể thao hàng đầu trên thế giới và là nhà sản xuất dụng cụ thể thao lớn với tổng doanh thu hơn 18,6 tỷ đô la Mỹ trong năm tài chính 2008. Tính đến năm 2008, công ty này có hơn 30.000 nhân viên trên khắp thế giới. Slogan “Just Do It” và biểu trưng dấu ngoặc phẩy, Nike đang là nhãn hiệu đồ thể thao ưa chuộng hàng đầu thế giới.')
--7
Insert into nhaCungCap values(N'Lacoste','0121692802','lacoste@gmail.com',N'TpHCM',N'img (30).jpg',N'Lacoste là một công ty quần áo may sẵn Pháp được thành lập vào năm 1933 chuyên bán các loại quần áo cao cấp, giày dép, nước hoa, đồ da, đồng hồ, kính mát và nổi tiếng nhất với các loại áo thun thể thao. Trong những năm gần đây, Lacoste đã sản xuất các dòng sản phẩm như khăn trải giường và khăn tắm. Công ty có logo là hình con cá sấu màu xanh lá cây.')
--8
Insert into nhaCungCap values(N'SONY','0145269280','sọny@gmail.com',N'TpHCM',N'sony.jpg',N'Công ty công nghiệp Sony là một tập đoàn đa quốc gia của Nhật Bản, với trụ sở chính nằm tại Minato, Tokyo, Nhật Bản, và là tập đoàn điện tử đứng thứ 5 thế giới với 81,64 tỉ USD (2011). Sony là một trong những công ty hàng đầu thế giới về: Điện tử,  Sản xuất tivi, Máy ảnh, Máy tính xách tay, Điện thoại đi động, Đồ dân dụng khác.')
--9
Insert into nhaCungCap values(N'CANON','0145285280','canon@gmail.com',N'TpHCM',N'canon.jpg',N'Canon là một tập đoàn đa quốc gia của Nhật Bản, một công ty trong lĩnh vực sản xuất các sản phẩm về hình ảnh và quang học, bao gồm máy Camera, máy photocopy và máy in. Trụ sở chính của tập đoàn đặt ở Ōta, Tokyo. Trụ sở ở Bắc Mỹ nằm ở Lake Success, New York, Hoa Kỳ. Các dòng sản phẩm chính: Máy ảnh DSLR, Máy ảnh số, Máy ảnh ống kính rời không gương lật, Máy quay kỹ thuật số, Máy fax, Máy in, Máy in laser, Máy in phun, Máy chiếu, Máy quét, Máy camera theo dõi qua Internet, Máy tính (Calculator).')
--10
Insert into nhaCungCap values(N'Apple','0574185280','appleiphone@gmail.com',N'TpHCM',N'iphone.jpg',N'Apple là một tập đoàn công nghệ lớn của Mỹ có trụ sở chính đặt tại Cupertino, bang California thuộc Mỹ. Apple được thành lập ngày 1 tháng 4 năm 1976 bởi ba nhà sáng lập là Steve Wozniak, Steve Jobs và Ronald Wayne, dưới tên gọi ban đầu là Apple Computer Inc, sau đó đổi tên thành Apple vào đầu năm 2007.Cho tới hiện tại, Apple là công ty công nghệ đứng thứ 2 trên thế giới, sản lượng bán ra toàn cầu hàng năm lên đến 13,9 tỷ đô la Mỹ (số liệu năm 2005). Hiện tại Apple có hơn 98.000 nhân viên ở nhiều quốc gia với các sản phẩm chủ lực là: iPhone, iPad ,Apple Watch và Macbook.')
--11
Insert into nhaCungCap values(N'SamSung','0574165280','samsung@gmail.com',N'TpHCM',N'samsung.jpg',N'Samsung là một tập đoàn đa quốc gia có trụ sở đặt tại Seoul, Hàn Quốc. Được sáng lập bởi Lee Byung-chul năm 1938 với khởi đầu là một công ty buôn bán nhỏ lẻ. Bắt đầu từ thập niên 90, Samsung dần mở rộng quy mô hoạt động ra toàn cầu với chiến lược tập trung nghiên cứu và phát triển vào lĩnh vực điện tử tiêu dùng bao gồm các mảng như điện thoại di động và chấn bán dẫn là những mảng đã góp phần lớn vào tổng doanh thu cả tập đoàn. Theo báo cáo trong năm 2019, giá trị thương hiệu của Samsung dẫn đầu Châu Á và xếp thứ 4 trên toàn thế giới.')
--12
Insert into nhaCungCap values(N'DELL','0741652489','dell@gmail.com',N'TpHCM',N'dell.jpg',N'Dell Inc là một công ty đa quốc gia của Hoa Kỳ về phát triển và thương mại hóa công nghệ máy tính có trụ sở tại Round Rock,Texas, Hoa Kỳ. Dell được thành lập năm 1984 do Michael Dell. Đây là công ty có thu nhập lớn thứ 28 tại Hoa Kỳ.')
--13
Insert into nhaCungCap values(N'ASUS','0524652489','asus@gmail.com',N'TpHCM',N'asus.jpg',N'Asus (ASUSTeK Computer Incorporated) là một tập đoàn đa quốc gia có trụ sở tại Đài Loan, được thành lập vào ngày 2/4/1990. Ngoài sản xuất điện thoại, Asus còn được biết đến với các sản phẩm nổi tiếng như: laptop, máy tính bảng.')
--14
select * from nhaCungCap
--Thêm vào bảng sản phẩm
--maSP varchar(50) ,
	--maNCC int ,
	--maLoai int ,
	--tenSP Nvarchar(200),
	--Size varchar(10),
	--dongia money,	
	--hinhanh Nvarchar(MAX),
	--mota Nvarchar(MAX),
select * from sanpham
Insert into sanPham values('MU001', 1, 14, N'Mũ phớt nam-nữ', 'M,S,L,...', '60000',  N'img (1).jpg', N'Mũ được làm bằng chất liệu 100% cotton mang lại cảm giác thoáng mát, thoải mái cho người dùng bởi khả năng hút ẩm cao, thấm hút tốt. Chưa hết, nó còn giúp mũ có độ bền cao, không bị bay màu. Khi giặt nhanh khô, có thể sử dụng các chất tẩy rửa. Thiết kế mũ lưỡi trai cổ điển nhưng cá tính, vành nón trẻ trung và phong cách, giúp bạn luôn nổi bật khi xuống phố, đi chơi, đi học, cà phê cùng bạn bè hoặc khi đi du lịch. Các lớp trên mũ được cố định với nhau bằng nhiều đường chỉ chắc chắn, đều nếp. Nhờ kết cấu vững chãi này, mũ có thể bảo vệ người dùng trong các điều kiện thời tiết xấu như nắng nóng, mưa nhẹ, hay gió lốc.')
Insert into sanPham values('MU002', 1, 14, N'Mũ phớt nam-nữ', 'M,S,L,...', '60000',  N'mu02.jpg', N'Mũ được làm bằng chất liệu 100% cotton mang lại cảm giác thoáng mát, thoải mái cho người dùng bởi khả năng hút ẩm cao, thấm hút tốt. Chưa hết, nó còn giúp mũ có độ bền cao, không bị bay màu. Khi giặt nhanh khô, có thể sử dụng các chất tẩy rửa. Thiết kế mũ lưỡi trai cổ điển nhưng cá tính, vành nón trẻ trung và phong cách, giúp bạn luôn nổi bật khi xuống phố, đi chơi, đi học, cà phê cùng bạn bè hoặc khi đi du lịch. Các lớp trên mũ được cố định với nhau bằng nhiều đường chỉ chắc chắn, đều nếp. Nhờ kết cấu vững chãi này, mũ có thể bảo vệ người dùng trong các điều kiện thời tiết xấu như nắng nóng, mưa nhẹ, hay gió lốc.')
Insert into sanPham values('MU003', 1, 14, N'Mũ nón nam-nữ', 'M,S,L,...', '60000',  N'mu03.jpg', N'Mũ được làm bằng chất liệu 100% cotton mang lại cảm giác thoáng mát, thoải mái cho người dùng bởi khả năng hút ẩm cao, thấm hút tốt. Chưa hết, nó còn giúp mũ có độ bền cao, không bị bay màu. Khi giặt nhanh khô, có thể sử dụng các chất tẩy rửa. Thiết kế mũ lưỡi trai cổ điển nhưng cá tính, vành nón trẻ trung và phong cách, giúp bạn luôn nổi bật khi xuống phố, đi chơi, đi học, cà phê cùng bạn bè hoặc khi đi du lịch. Các lớp trên mũ được cố định với nhau bằng nhiều đường chỉ chắc chắn, đều nếp. Nhờ kết cấu vững chãi này, mũ có thể bảo vệ người dùng trong các điều kiện thời tiết xấu như nắng nóng, mưa nhẹ, hay gió lốc.')
Insert into sanPham values('MU004', 2, 14, N'Mũ thời trang kiểu xã hội đen', 'M,S,...', '82000',  N'img (20).jpg', N'Mũ được làm bằng chất liệu 100% cotton mang lại cảm giác thoáng mát, thoải mái cho người dùng bởi khả năng hút ẩm cao, thấm hút tốt. Chưa hết, nó còn giúp mũ có độ bền cao, không bị bay màu. Khi giặt nhanh khô, có thể sử dụng các chất tẩy rửa. Thiết kế mũ lưỡi trai cổ điển nhưng cá tính, vành nón trẻ trung và phong cách, giúp bạn luôn nổi bật khi xuống phố, đi chơi, đi học, cà phê cùng bạn bè hoặc khi đi du lịch. Các lớp trên mũ được cố định với nhau bằng nhiều đường chỉ chắc chắn, đều nếp. Nhờ kết cấu vững chãi này, mũ có thể bảo vệ người dùng trong các điều kiện thời tiết xấu như nắng nóng, mưa nhẹ, hay gió lốc.')
Insert into sanPham values('MU005', 2, 14, N'Mũ thời trang kiểu xã hội đen', 'M,S,...', '82000',  N'mu05.jpg', N'Mũ được làm bằng chất liệu 100% cotton mang lại cảm giác thoáng mát, thoải mái cho người dùng bởi khả năng hút ẩm cao, thấm hút tốt. Chưa hết, nó còn giúp mũ có độ bền cao, không bị bay màu. Khi giặt nhanh khô, có thể sử dụng các chất tẩy rửa. Thiết kế mũ lưỡi trai cổ điển nhưng cá tính, vành nón trẻ trung và phong cách, giúp bạn luôn nổi bật khi xuống phố, đi chơi, đi học, cà phê cùng bạn bè hoặc khi đi du lịch. Các lớp trên mũ được cố định với nhau bằng nhiều đường chỉ chắc chắn, đều nếp. Nhờ kết cấu vững chãi này, mũ có thể bảo vệ người dùng trong các điều kiện thời tiết xấu như nắng nóng, mưa nhẹ, hay gió lốc.')
Insert into sanPham values('MU006', 2, 14, N'Mũ thời trang beanie', 'M,S,...', '82000',  N'mu06.jpg', N'Mũ được làm bằng chất liệu 100% cotton mang lại cảm giác thoáng mát, thoải mái cho người dùng bởi khả năng hút ẩm cao, thấm hút tốt. Chưa hết, nó còn giúp mũ có độ bền cao, không bị bay màu. Khi giặt nhanh khô, có thể sử dụng các chất tẩy rửa. Thiết kế mũ lưỡi trai cổ điển nhưng cá tính, vành nón trẻ trung và phong cách, giúp bạn luôn nổi bật khi xuống phố, đi chơi, đi học, cà phê cùng bạn bè hoặc khi đi du lịch. Các lớp trên mũ được cố định với nhau bằng nhiều đường chỉ chắc chắn, đều nếp. Nhờ kết cấu vững chãi này, mũ có thể bảo vệ người dùng trong các điều kiện thời tiết xấu như nắng nóng, mưa nhẹ, hay gió lốc.')
Insert into sanPham values('MU007', 3, 14, N'Mũ thời trang FILA (đen)', 'XL,L,...', '45000', N'img (27).jpg', N' Được thiết kế với phong cách đơn giản kết hợp với những đường chỉ dày dặn tạo cho chiếc nón phong cách khỏe khoắn, mạnh mẽ. Form nón đẹp, đội ôm và sâu phù hợp cho cả nam và nữ. Có thể đều chỉnh thông qua khóa phía sau. Chất liệu vải Kaki cotton cao cấp, cực bền, thấm hút mồ hôi tốt. Đường may kỹ càng, tinh tế.')
Insert into sanPham values('MU008', 3, 14, N'Mũ thời trang FILA (xanh dương)', 'XL,L,...', '45000', N'mu08.jpg', N' Được thiết kế với phong cách đơn giản kết hợp với những đường chỉ dày dặn tạo cho chiếc nón phong cách khỏe khoắn, mạnh mẽ. Form nón đẹp, đội ôm và sâu phù hợp cho cả nam và nữ. Có thể đều chỉnh thông qua khóa phía sau. Chất liệu vải Kaki cotton cao cấp, cực bền, thấm hút mồ hôi tốt. Đường may kỹ càng, tinh tế.')
Insert into sanPham values('MU009', 3, 14, N'Mũ thời trang FILA (trắng)', 'XL,L,...', '45000', N'mu09.jpg', N' Được thiết kế với phong cách đơn giản kết hợp với những đường chỉ dày dặn tạo cho chiếc nón phong cách khỏe khoắn, mạnh mẽ. Form nón đẹp, đội ôm và sâu phù hợp cho cả nam và nữ. Có thể đều chỉnh thông qua khóa phía sau. Chất liệu vải Kaki cotton cao cấp, cực bền, thấm hút mồ hôi tốt. Đường may kỹ càng, tinh tế.')
Insert into sanPham values('MU010', 4, 15, N'Mũ bảo hiểm Chanel Asia', 'S,M,...', '120000', N'img (29).jpg', N'Thiết kế thông minh, có thể chịu lực đồng đều, bảo vệ đầu một cách hiệu quả.Mũ thông khí, thoáng gió, lớp lót có độ đàn hồi cao, thoải mái khi đội.Chất liệu EPS nhập khẩu (tầng xốp của mũ bảo hiểm) và PC nhập khẩu (vỏ bọc ngoài mũ bảo hiểm) chịu được tác động mạnh.Quai nón bền chắc, không bị tuột, đứt bởi lực kéo.Khóa nón dễ tháo, dễ gài nhưng không bị tuột khi đang sử dụng.')
Insert into sanPham values('MU011', 4, 15, N'Mũ bảo hiểm Chanel FullFace GTX', 'S,M,...', '120000', N'mu10.jpg', N'Thiết kế thông minh, có thể chịu lực đồng đều, bảo vệ đầu một cách hiệu quả.Mũ thông khí, thoáng gió, lớp lót có độ đàn hồi cao, thoải mái khi đội.Chất liệu EPS nhập khẩu (tầng xốp của mũ bảo hiểm) và PC nhập khẩu (vỏ bọc ngoài mũ bảo hiểm) chịu được tác động mạnh.Quai nón bền chắc, không bị tuột, đứt bởi lực kéo.Khóa nón dễ tháo, dễ gài nhưng không bị tuột khi đang sử dụng.')
Insert into sanPham values('MU012', 4, 15, N'Mũ bảo hiểm Chanel FullFace GTX', 'S,M,...', '120000', N'mu11.jpg', N'Thiết kế thông minh, có thể chịu lực đồng đều, bảo vệ đầu một cách hiệu quả.Mũ thông khí, thoáng gió, lớp lót có độ đàn hồi cao, thoải mái khi đội.Chất liệu EPS nhập khẩu (tầng xốp của mũ bảo hiểm) và PC nhập khẩu (vỏ bọc ngoài mũ bảo hiểm) chịu được tác động mạnh.Quai nón bền chắc, không bị tuột, đứt bởi lực kéo.Khóa nón dễ tháo, dễ gài nhưng không bị tuột khi đang sử dụng.')
Insert into sanPham values('CS001', 5, 7, N'Đầm công sở nữ', 'S,M,...', '320000', N'img (2).jpg', N'Vải cát hàn  mềm mịn dày dặn,co giãn mặc thoải mái khi duy chuyển,vận động. Đặc biệt không ra màu khi giặt,thoải mái khi giặt máy. Kiểu dáng trẻ trung phù hợp với các bạn khi đến công sở,dạo phố cùng bạn bè,...')
Insert into sanPham values('CS002', 5, 7, N'Đầm công sở nữ', 'S,M,...', '320000', N'congso2.jpg', N'Vải cát hàn  mềm mịn dày dặn,co giãn mặc thoải mái khi duy chuyển,vận động. Đặc biệt không ra màu khi giặt,thoải mái khi giặt máy. Kiểu dáng trẻ trung phù hợp với các bạn khi đến công sở,dạo phố cùng bạn bè,...')
Insert into sanPham values('CS003', 5, 7, N'Đầm công sở nữ', 'S,M,...', '320000', N'congso3.jpg', N'Vải cát hàn  mềm mịn dày dặn,co giãn mặc thoải mái khi duy chuyển,vận động. Đặc biệt không ra màu khi giặt,thoải mái khi giặt máy. Kiểu dáng trẻ trung phù hợp với các bạn khi đến công sở,dạo phố cùng bạn bè,...')
Insert into sanPham values('CS004', 6, 7, N'Đồ công sở quần dài', 'M,S,L', '230000',  N'img (4).jpg', N' Với thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('CS005', 6, 7, N'Đồ công sở quần dài', 'M,S,L', '230000',  N'congso5.jpg', N' Với thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('CS006', 6, 7, N'Đồ công sở quần dài', 'M,S,L', '230000',  N'congso6.jpg', N' Với thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('CS007', 3, 7, N'Đồ kiểu dáng học sinh', 'M,S,...', '200000',  N'img (19).jpg', N'ới thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('CS008', 3, 7, N'Đồ kiểu dáng học sinh', 'M,S,...', '200000',  N'hs01.jpg', N'ới thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('CS009', 3, 7, N'Đồ kiểu dáng học sinh', 'M,S,...', '200000',  N'hs02.jpg', N'ới thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('CS010', 3, 7, N'Đồ kiểu dáng học sinh', 'M,S,...', '200000',  N'hs03.jpg', N'ới thiết kế theo phong cách trẻ Hàn Quốc trên chất liệu cao cấp mang tới cho bạn một phong cách thời trang thanh lịch mà quyến rũ. Quần dáng côn ly thẳng. Form chuẩn phù hợp với vóc dáng phụ nữ Việt.Quần được thiết kế theo dáng côn nên rất dễ mặc và dễ phối đồ. Quần cách điệu ly thẳng, vừa thanh lịch lại rất thời trang, phù hợp để các nàng diện trong mọi hoàn cảnh.')
Insert into sanPham values('AK001', 3, 5, N'Áo khoác nam', 'XL,XXL,L', '110000', N'img (3).jpg', N'Áo khoác Kaki Nam phù hợp với phong cách năng động, trẻ trung, nam tính. Lựa chọn áo khoác kết hợp với quần kaki là bạn có một bô cánh hoàn hảo. Chất liệu: vải kaki thô, dày, ấm, bền, thiết kế tinh tế, màu sắc trang trọng')
Insert into sanPham values('AK002', 3, 5, N'Áo khoác nam', 'XL,XXL,L', '110000', N'aokhoac1.jpg', N'Áo khoác Kaki Nam phù hợp với phong cách năng động, trẻ trung, nam tính. Lựa chọn áo khoác kết hợp với quần kaki là bạn có một bô cánh hoàn hảo. Chất liệu: vải kaki thô, dày, ấm, bền, thiết kế tinh tế, màu sắc trang trọng')
Insert into sanPham values('AK003', 3, 5, N'Áo khoác nam', 'XL,XXL,L', '110000', N'aokhoac02.jpg', N'Áo khoác Kaki Nam phù hợp với phong cách năng động, trẻ trung, nam tính. Lựa chọn áo khoác kết hợp với quần kaki là bạn có một bô cánh hoàn hảo. Chất liệu: vải kaki thô, dày, ấm, bền, thiết kế tinh tế, màu sắc trang trọng')
Insert into sanPham values('AK004', 3, 5, N'Áo khoác nam', 'XL,XXL,L', '110000', N'aokhoac03.jpg', N'Áo khoác Kaki Nam phù hợp với phong cách năng động, trẻ trung, nam tính. Lựa chọn áo khoác kết hợp với quần kaki là bạn có một bô cánh hoàn hảo. Chất liệu: vải kaki thô, dày, ấm, bền, thiết kế tinh tế, màu sắc trang trọng')
Insert into sanPham values('AT001', 4, 2, N'Áo thun nữ sành điệu', 'S,M,L...', '80000', N'img (8).jpg', N'thiết kế đẹp, chuẩn form, đường may sắc xảo, vải cotton dày, mịn, thấm hút mồ hôi tạo sự thoải mái khi mặc! Chất liệu thun mềm mại co giãn tốt , thoáng mát. Được thiết kế đẹp, trẻ trung năng động, hợp xu hướng thời trang quốc tế. Đường may tinh xảo, tạo nên gu thời trang sành điệu cho bạn gái. Dễ dàng phối hợp cùng nhiều phụ kiện khác mang đến phong cách thời trang riêng cho bạn nữ, khéo léo lựa chọn trang phục cùng phụ kiện phù hợp, bạn sẽ có set đồ đẹp mắt...')
Insert into sanPham values('AT002', 4, 2, N'Áo thun nữ sành điệu', 'S,M,L...', '80000', N'aothun1.jpg', N'thiết kế đẹp, chuẩn form, đường may sắc xảo, vải cotton dày, mịn, thấm hút mồ hôi tạo sự thoải mái khi mặc! Chất liệu thun mềm mại co giãn tốt , thoáng mát. Được thiết kế đẹp, trẻ trung năng động, hợp xu hướng thời trang quốc tế. Đường may tinh xảo, tạo nên gu thời trang sành điệu cho bạn gái. Dễ dàng phối hợp cùng nhiều phụ kiện khác mang đến phong cách thời trang riêng cho bạn nữ, khéo léo lựa chọn trang phục cùng phụ kiện phù hợp, bạn sẽ có set đồ đẹp mắt...')
Insert into sanPham values('AT003', 4, 2, N'Áo thun nữ sành điệu', 'S,M,L...', '80000', N'aothun2.jpg', N'thiết kế đẹp, chuẩn form, đường may sắc xảo, vải cotton dày, mịn, thấm hút mồ hôi tạo sự thoải mái khi mặc! Chất liệu thun mềm mại co giãn tốt , thoáng mát. Được thiết kế đẹp, trẻ trung năng động, hợp xu hướng thời trang quốc tế. Đường may tinh xảo, tạo nên gu thời trang sành điệu cho bạn gái. Dễ dàng phối hợp cùng nhiều phụ kiện khác mang đến phong cách thời trang riêng cho bạn nữ, khéo léo lựa chọn trang phục cùng phụ kiện phù hợp, bạn sẽ có set đồ đẹp mắt...')
Insert into sanPham values('AT004', 4, 2, N'Áo thun nữ sành điệu', 'S,M,L...', '80000', N'aothun3.jpg', N'thiết kế đẹp, chuẩn form, đường may sắc xảo, vải cotton dày, mịn, thấm hút mồ hôi tạo sự thoải mái khi mặc! Chất liệu thun mềm mại co giãn tốt , thoáng mát. Được thiết kế đẹp, trẻ trung năng động, hợp xu hướng thời trang quốc tế. Đường may tinh xảo, tạo nên gu thời trang sành điệu cho bạn gái. Dễ dàng phối hợp cùng nhiều phụ kiện khác mang đến phong cách thời trang riêng cho bạn nữ, khéo léo lựa chọn trang phục cùng phụ kiện phù hợp, bạn sẽ có set đồ đẹp mắt...')
Insert into sanPham values('AT005', 3, 2, N'Áo body nam', 'L,XL,XXL', '130000', N'aobody1.jpg', N'Một trong những loại áo thun được phái mạnh ưa chuộng. Không đơn giản vì nó dễ mặc dễ phối đồ, phù hợp với nhiều lứa tuổi mà nó còn thể hiện được sự nam tính, mạnh mẽ của các đấng mày râu. Sẽ không thể nào để một chàng trai dễ dàng bỏ qua chiếc áo thun làm tăng thêm sự thu hút của mình và Áo Thun Nam HILGOR 1985 Siêu Đẹp là một trong những chiếc áo thun hội tụ tất cả những ưu điểm của một chiếc áo thun có cổ. Chất liệu 100% cotton. Mặc cực kỳ thoải mái form á rất hợp với dáng Việt Nam! ')
Insert into sanPham values('AT006', 3, 2, N'Áo body nam', 'L,XL,XXL', '130000', N'aobody2.jpg', N'Một trong những loại áo thun được phái mạnh ưa chuộng. Không đơn giản vì nó dễ mặc dễ phối đồ, phù hợp với nhiều lứa tuổi mà nó còn thể hiện được sự nam tính, mạnh mẽ của các đấng mày râu. Sẽ không thể nào để một chàng trai dễ dàng bỏ qua chiếc áo thun làm tăng thêm sự thu hút của mình và Áo Thun Nam HILGOR 1985 Siêu Đẹp là một trong những chiếc áo thun hội tụ tất cả những ưu điểm của một chiếc áo thun có cổ. Chất liệu 100% cotton. Mặc cực kỳ thoải mái form á rất hợp với dáng Việt Nam! ')
Insert into sanPham values('AT007', 3, 2, N'Áo body nam', 'L,XL,XXL', '130000', N'aobody3.jpg', N'Một trong những loại áo thun được phái mạnh ưa chuộng. Không đơn giản vì nó dễ mặc dễ phối đồ, phù hợp với nhiều lứa tuổi mà nó còn thể hiện được sự nam tính, mạnh mẽ của các đấng mày râu. Sẽ không thể nào để một chàng trai dễ dàng bỏ qua chiếc áo thun làm tăng thêm sự thu hút của mình và Áo Thun Nam HILGOR 1985 Siêu Đẹp là một trong những chiếc áo thun hội tụ tất cả những ưu điểm của một chiếc áo thun có cổ. Chất liệu 100% cotton. Mặc cực kỳ thoải mái form á rất hợp với dáng Việt Nam! ')
Insert into sanPham values('AK005', 8, 5, N'Áo khoác nữ', 'S,M,L...', '170000',  N'aokhoacnu1.jpg',  N' Chất liệu tự nhiên 100% cotton. Không pha bất kỳ sợi nhựa polyester như đa số công ty Việt Nam. Công nghệ thoát nhiệt Nhật Bản Cool-Tech: Giúp áo khoác chống nắng nóng và chống lạnh đều hiệu quả, cực kỳ thoáng mát, thấm hút mồ hôi => Cảm giác thoải mái vận động, tập gym, đi chơi ngoài trời, đi phượt. Ngoài ra, áo có khả năng kháng khuẩn và khử mùi. Giúp bạn thơm tho cả ngày bên người yêu.')
Insert into sanPham values('AK006', 8, 5, N'Áo khoác nữ', 'S,M,L...', '170000',  N'aokhoacnu2.jpg',  N' Chất liệu tự nhiên 100% cotton. Không pha bất kỳ sợi nhựa polyester như đa số công ty Việt Nam. Công nghệ thoát nhiệt Nhật Bản Cool-Tech: Giúp áo khoác chống nắng nóng và chống lạnh đều hiệu quả, cực kỳ thoáng mát, thấm hút mồ hôi => Cảm giác thoải mái vận động, tập gym, đi chơi ngoài trời, đi phượt. Ngoài ra, áo có khả năng kháng khuẩn và khử mùi. Giúp bạn thơm tho cả ngày bên người yêu.')
Insert into sanPham values('AK007', 8, 5, N'Áo khoác nữ', 'S,M,L...', '170000',  N'aokhoacnu3.jpg',  N' Chất liệu tự nhiên 100% cotton. Không pha bất kỳ sợi nhựa polyester như đa số công ty Việt Nam. Công nghệ thoát nhiệt Nhật Bản Cool-Tech: Giúp áo khoác chống nắng nóng và chống lạnh đều hiệu quả, cực kỳ thoáng mát, thấm hút mồ hôi => Cảm giác thoải mái vận động, tập gym, đi chơi ngoài trời, đi phượt. Ngoài ra, áo có khả năng kháng khuẩn và khử mùi. Giúp bạn thơm tho cả ngày bên người yêu.')
Insert into sanPham values('MASonyA7',9,16,N'Máy ảnh SONY A7 mark III',null,'4700000', N'sonyA73.jpg',N'g số kỹ thuật Sony A7 III: Ngàm ống kính: E-mount, tương thích FE, E-mount. Cảm biến: BSI-CMOS Exmor R 24.2 MP. Bộ xử lý: BIONZ X, chip ngoại vi front-end LSI, bộ chuyển A/D: 14-bit. Chống rung 5 trục trên hệ thống cảm biến. Màn hình: LCD 3, cảm ứng, 921.600 điểm ảnh, lật đa chiều. Kính ngắm:EVF OLED 2.359.000 điểm ảnh, lớp phủ ZEISS T*, phóng đại 0.78x. Tốc độ màn trập: 1/8.000 giây, chụp liên tiếp 10 fps. Chế độ chụp im lặng: silent mode, màn trập điện tửISO: 100 - 51.200, mở rộng 50 - 204.800, quay phim ISO 100 -51.200 (mở rộng 102.400) .Lấy nét: Phase Detection AF 693 điểm, gồm 425 điểm lấy nét tương phảnQuay phim 4K: 3.840 x 2.160 pixel, XAVC S,30p/25p/24p (100 Mbps / 60 Mbps). Quay phim Full HD: XAVC S HD 120p(100Mbps), 60p(50Mbps)Profile picture: Hybrid Log-Gamma (HDR), S-Log2, S-Log3... .Kết nối: Wi-Fi n, Bluetooth 4.1, NFCGiao tiếp: USB-C 3.1, MULTI (microUSB), HDMI, headphone, micro-phone. Thẻ nhớ: 2 khe SD, 1 khe hỗ trợ UHS-IIPin: NP-FZ100 7.2 V/16.4 Wh (2,280 mAh)Kích thước: 126.9 x 95.6 x 73.7 mm. Trọng lượng: 650 g.')
Insert into sanPham values('MASonyA6000',9,16,N'Máy ảnh SONY A6000',null ,'2500000',N'sonya6k.jpg',N'Cảm biến APS-C CMOS 24.3 Megapixels. Bộ xử lý hình ảnh Bionz X. Tốc độ lấy nét 0,06s nhanh nhất thế giới. Hệ thống lấy nét lai AF 179 điểm phase và 25 điểm contrast. Bắt nét 4D Focus, chụp liên tiếp 11fps (11 hình/s). Tốc độ màn trập 1/4000s. Màn hình LCD 3 inch xoay lật với 921.600 điểm ảnh. Kính ngắm OLED điện tử 1.44 triệu điểm ảnh. Đèn flash pop-up và cổng kết nổi mở rộng Multi-Interface. Kết nối Wifi, NFC, cài ứng dụng Playmemories. Máy ảnh Sony A6000 là máy ảnh mirrorless (không gương lật) dùng cảm biến APS-C có khả năng lấy nét nhanh nhất hiện nay (0.06s).')
Insert into sanPham values('MASonyRX1007',9,16,N'Máy ảnh SONY RX100 mark VII',null,'3200000',N'sonyRX1007.jpg',N' Bộ cảm biến Exmor RS CMOS 20.1MP tích hợp chip DRAM. Bộ xử lý hình ảnh BIONZ X & LSI Front-End. Ống kính ZEISS Vario-Sonnar T * f / 2.8-4.5.  Zoom tương đương 24-200mm (35mm). Thiết kế quang học: 15 thấu kính trong 12 nhóm. Video HDR 4K 4K30p với Gamma HLG & S-Log3. Màn hình cảm ứng LCD 3inch 921.600 điểm lật 180°. Khung ngắm điện tử EVF (OLED) 2.359.296 điểm. Theo dõi thời gian thực và Eye-AF.  Kết nối Wifi, NFC.')
Insert into sanPham values('MACanon5D4',10,17,N'Máy ảnh CANON 5D mark IV',null, '4000000',N'canon5D4.jpg',N'Chip xử lý hình ảnh: DIGIC 6+. Dual Pixel RAW. Khả năng quay video: 4K. Chế độ khử flicker. Tích hợp: kết nối Wi-Fi và NFC. Thẻ nhớ: SD/ SDHC/ SDXC, CompactFlash Type II. Tuổi thọ pin (theo CIPA): 900 tấm khi sạc đầy. Cổng kết nối: USB 3.0, HDMI. Kích thước: 150.7 x 116.4 x 75.9mm. Khối lượng: 890g.')
Insert into sanPham values('MACanonM10',10,17,N'Máy ảnh CANON M10',null, '1500000',N'canonM10.jpg',N'Cảm biến CMOS APS-C 24.2MP. Bộ xử lý hình ảnh DIGIC 7. Màn hình cảm ứng LCD 3.0 inch "1.04m-dot. Quay phim Full HD 1080p với tốc độ 60 fps. Built-In Wi-Fi với NFC, Bluetooth. Dual Pixel CMOS AF. Tốc độ chụp 6,1 fps và ISO 25600. Hỗ trợ Sáng tạo và Chân dung Tự chụp. Pin tương thích LP-E12.')
Insert into sanPham values('MACanonM10',10,17,N'Máy ảnh CANON M50',null, '2000000',N'canonM50.jpg',N'Cảm biến APS - C CMOS 24.1MP. Chip xử lý ảnh DIGIC 8. Số điểm lấy nét tối đa 143 đối với lens tương thích, lens dùng ngàm chuyển 99 điểm. Video 4K 25p Full HD 1080 60p, HD 720 120p. Trích xuất hình ảnh từ video phim 4K. Chống rung điện tử 5 trục kết hợp với chúng rung IS. ISO: 100-25600 mở rộng ISO 51200. Chụp liên tục lên đến 10fps. Màn hình cảm ứng 3" 104 triệu điểm ảnh. Tích hợp wifi, bluetooth, NFC. Hỗ trợ định dạng RAW CR3 thế hệ tiếp theo và định dạng nén C-RAW mới. Định dạng C-RAW có kích thước tệp nhỏ hơn 40% so với RAW thông thường.')
Insert into sanPham values('Iphone11',11,18,N'Iphone 11',null, '1947900',N'ip11.jpg',N'Công nghệ màn hình: IPS LCD. Độ phân giải: 828 x 1792 pixels. Màn hình rộng: 6.1 inches. Camera sau: Độ phân giải: 12 MP + 12 MP. Quay phim: 2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec. Camera trước :Độ phân giải: 12 MP, f/2.2. Hệ điều hành: iOS 13. Chipset (hãng SX CPU): Apple A13 Bionic (7 nm+). RAM: 4 GB. Bộ nhớ trong: 64-128-256 GB. SIM: 2 SIM. Wifi: Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, hotspot. GPS: A-GPS, GLONASS, GALILEO, QZSS. Bluetooth: 5.0, A2DP, LE. Kích thước: 150.9 x 75.7 x 8.3 mm. Trọng lượng: 194 g. Dung lượng pin: 3110 mAh. Loại pin: Li-Ion.')
Insert into sanPham values('Iphone11pro',11,18,N'Iphone 11 Pro',null, '2697900',N'ip11pro.jpg',N'Công nghệ màn hình: OLED (Super Retina XDR). Độ phân giải:  1125 x 2436 pixels. Màn hình rộng: 5.8 inches. Camera sau: Độ phân giải: 12 MP + 12 MP + 12 MP. Quay phim: 2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec. Camera trước :Độ phân giải: 12 MP, f/2.2. Hệ điều hành: iOS 13. Chipset (hãng SX CPU): Apple A13 Bionic (7 nm+). RAM: 4 GB. Bộ nhớ trong: 64-128-256 GB. SIM: 2 SIM. Wifi: Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, hotspot. GPS: A-GPS, GLONASS, GALILEO, QZSS. Bluetooth: 5.0, A2DP, LE. Kích thước: 144 x 71.4 x 8.1 mm. Trọng lượng: 188 g. Dung lượng pin: 3190 mAh. Loại pin: Li-Ion. Công nghệ pin: Sạc nhanh 18W.')
Insert into sanPham values('Iphone11proMax',11,18,N'Iphone 11 Pro Max',null, '2947900',N'ip11promax.jpg',N'Công nghệ màn hình: OLED (Super Retina XDR). Độ phân giải: 1242 x 2688 pixels. Màn hình rộng: 6.5 inches. Camera sau: Độ phân giải: 12 MP + 12 MP + 12 MP. Quay phim: 2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec. Camera trước :Độ phân giải: 12 MP, f/2.2. Hệ điều hành: iOS 13. Chipset (hãng SX CPU): Apple A13 Bionic (7 nm+). RAM: 4 GB. Bộ nhớ trong: 64-128-256 GB. SIM: 2 SIM. Wifi: Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, hotspot. GPS: A-GPS, GLONASS, GALILEO, QZSS. Bluetooth: 5.0, A2DP, LE. Kích thước: 144 x 71.4 x 8.1 mm. Trọng lượng: 188 g. Dung lượng pin: 3969 mAh. Loại pin: Li-Ion. Công nghệ pin: Sạc nhanh 18W.')
Insert into sanPham values('SamsungS10',12,19,N'SamSung Galaxy S10',null,'1799000',N'sss10.jpg',N'Màn hình:Dynamic AMOLED, 6.1", Quad HD+ (2K+). Hệ điều hành: Android 9.0 (Pie). Camera sau: Chính 12 MP & Phụ 12 MP, 16 MP. Camera trước: 10 MP. CPU: Exynos 9820 8 nhân 64-bit. RAM: 8 GB. Bộ nhớ trong: 128 GB. Thẻ nhớ: MicroSD, hỗ trợ tối đa 512 GB. Thẻ SIM:2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G. Dung lượng pin:3400 mAh, có sạc nhanh.')
Insert into sanPham values('SamsungS10pl',12,19,N'SamSung Galaxy S10+',null,'2299000',N'sss10pl.jpg',N'Màn hình:	Dynamic AMOLED, 6.4", Quad HD+ (2K+). Hệ điều hành: Android 9.0 (Pie). Camera sau: Chính 12 MP & Phụ 12 MP, 16 MP. Camera trước: 10 MP & Phụ 8 MP. CPU: Exynos 9820 8 nhân 64-bit. RAM: 8 GB. Bộ nhớ trong: 128 GB. Thẻ nhớ: MicroSD, hỗ trợ tối đa 512 GB. Thẻ SIM:2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G. Dung lượng pin:4100 mAh, có sạc nhanh.')
Insert into sanPham values('SamsungNote10',12,19,N'SamSung Galaxy Note 10',null,'2299000',N'ssnote10.jpg',N'Màn hình:Dynamic AMOLED, 6.3", Quad HD+ (2K+). Hệ điều hành: Android 9.0 (Pie). Camera sau: Chính 12 MP & Phụ 12 MP, 16 MP. Camera trước: 10 MP. CPU: Exynos 9825 8 nhân 64-bit. RAM: 8 GB. Bộ nhớ trong: 256 GB. Thẻ nhớ: MicroSD, hỗ trợ tối đa 512 GB. Thẻ SIM:2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G. Dung lượng pin:3500 mAh, có sạc nhanh.')
Insert into sanPham values('SamsungNote10+',12,19,N'SamSung Galaxy Note 10+',null,'2299000',N'ssnote10pl.jpg',N'Màn hình:	Dynamic AMOLED, 6.8", Quad HD+ (2K+). Hệ điều hành: Android 9.0 (Pie). Camera sau: Chính 12 MP & Phụ 12 MP, 16 MP, TOF 3D. Camera trước: 10 MP. CPU: Exynos 9825 8 nhân 64-bit. RAM: 12 GB. Bộ nhớ trong: 256 GB. Thẻ nhớ: MicroSD, hỗ trợ tối đa 512 GB. Thẻ SIM:2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G. Dung lượng pin:4300 mAh, có sạc nhanh.')
Insert into sanPham values('DellAlian',13,20,N'Laptop ALIENWARE M17',null,'6749000',N'dellalian.jpg',N'CPU: 9th Generation Intel® Core™ i7-9750H (6-Core 12MB Cache up to 4.5GHz w/ Turbo Boost). VGA: NVIDIA® GeForce RTX™ 2070 8GB GDDR6 with Max-Q Design. RAM: 16GB DDR4 2666Mhz, HARD DRIVE: 512GB PCIe M.2 SSD, DISPLAY: 17.3" FHD (1920 x 1080) 144Hz 9ms 72% color gamut Tobii Eyetracking, OS: Windows 10 Home,')
Insert into sanPham values('DellGaming',13,20,N'Laptop DELL GAMING G7 7590 ',null,'4499000',N'dellgaming.jpg',N'CPU: Intel Core i7-9750H 2.6GHz up to 4.5GHz 12MB. VGA: NVIDIA GeForce® RTX 2060 6GB GDDR5. RAM: 16GB (8GB x2) DDR4 2666MHz, HARD DRIVE: HDD 1TB 5400rpm + 256GB SSD M.2 PCIe, DISPLAY: 15.6" FHD (1920 x 1080) IPS with Anti-Glare 144Hz. OS: Windows 10 Home,')
Insert into sanPham values('DellIns',13,20,N'Laptop DELL Inspiron 5570-N5570A ',null,'2499000',N'dellins.jpg',N' CPU: Intel Core i7-8550U ( 1.8 GHz - 4.0 GHz / 8MB / 4 nhân, 8 luồng ). Màn hình: 15.6" ( 1920 x 1080 ) , không cảm ứng. RAM: 1 x 8GB DDR4 2400MHz. Đồ họa: Intel UHD Graphics 620 / AMD Radeon 530 4GB. Lưu trữ: 128GB SSD / 1TB HDD 5400RPM. Hệ điều hành: Windows 10 Home SL 64-bit. Pin: 3 cell 42 Wh Pin liền , khối lượng: 2.1 kg.')
Insert into sanPham values('AsusVivo',14,21,N'Laptop ASUS VivoBook S15 S530UN-BQ005T',null,'2269000',N'asusvivobook.jpg',N'CPU: Intel Core i7-8550U ( 1.8 GHz - 4.0 GHz / 8MB / 4 nhân, 8 luồng ). Màn hình: 15.6" ( 1920 x 1080 ) , không cảm ứng. RAM: 1 x 8GB DDR4 2400MHz.  Đồ họa: Intel UHD Graphics 620 / NVIDIA GeForce MX150 2GB GDDR5. Lưu trữ: 256GB SSD M.2 SATA. Hệ điều hành: Windows 10 Home SL 64-bit. Pin: 3 cell 42 Wh Pin liền , khối lượng: 1.8 kg.')
Insert into sanPham values('AsusZenBook',14,21,N'Laptop ASUS ZenBook Pro 14 UX480FD-BE040T',null,'3599000',N'asuszenbookpro.jpg',N' CPU: Intel Core i7-8565U ( 1.8 GHz - 4.6 GHz / 8MB / 4 nhân, 8 luồng ). Màn hình: 14" ( 1920 x 1080 ) , không cảm ứng. RAM: 8GB Onboard DDR4 2400MHz. Đồ họa: Intel UHD Graphics 620 / NVIDIA GeForce GTX 1050 4GB GDDR5. Lưu trữ: 512GB SSD M.2 NVMe. Hệ điều hành: Windows 10 Home SL 64-bit. Pin: 4 cell 70 Wh Pin liền , khối lượng: 1.6 kg.')
Insert into sanPham values('AsusROG',14,21,N'Laptop ASUS ROG Zephyrus S GX531GW-ES006T',null,'6199000',N'asusi7.jpg',N'CPU: Intel Core i7-8750H ( 2.2 GHz - 4.1 GHz / 9MB / 6 nhân, 12 luồng ). Màn hình: 15.6" ( 1920 x 1080 ) , không cảm ứng. RAM: 16GB (8GB + 8GB Onboard) DDR4 2666MHz. Đồ họa: Intel UHD Graphics 630 / NVIDIA GeForce RTX 2070 8GB GDDR6. Lưu trữ: 512GB SSD M.2 NVMe. Hệ điều hành: Windows 10 Home SL 64-bit. Pin: 4 cell 60 Wh Pin liền , khối lượng: 2.1 kg.')
select * from sanPham


--Insert table Rates
Insert into Rates values('MU001', 1)
Insert into Rates values('MU002', 2)
Insert into Rates values('MU003', 3)
Insert into Rates values('MU004', 4)
Insert into Rates values('CS001', 5)
Insert into Rates values('CS002', 1)
Insert into Rates values('CS003', 2)
Insert into Rates values('AK001', 3)
Insert into Rates values('AT001', 4)
Insert into Rates values('AT002', 5)
Insert into Rates values('AT003', 1)
--Insert table Comments
Insert into Comments values('MU001', N'đã đánh giá MU001')
Insert into Comments values('MU002', N'đã đánh giá MU002')
Insert into Comments values('MU003', N'đã đánh giá MU003')
Insert into Comments values('MU004', N'đã đánh giá MU004')
Insert into Comments values('CS001', N'đã đánh giá CS001')
Insert into Comments values('CS002', N'đã đánh giá CS002')
Insert into Comments values('CS003', N'đã đánh giá CS003')
Insert into Comments values('AK001', N'đã đánh giá AK001')
Insert into Comments values('AT001', N'đã đánh giá AT001')
Insert into Comments values('AT002', N'đã đánh giá AT002')
Insert into Comments values('AT003', N'đã đánh giá AT003')