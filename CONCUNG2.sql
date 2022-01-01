USE CONCUNG
GO

INSERT BOME(SDT, HOTEN_BM, EMAIL, PHAI_BM, NGAYSINH_BM, MATKHAU, DIACHI_BM)
VALUES
	('0938391731', N'Lâm Quốc Cường', 'david.quoccuong2001@gmail.com',  N'Nam', '2001-06-24', '12345', N'A39A Nguyễn Thần Hiến, phường 18, quận 4, Hồ Chí Minh'),
	('1234567890', N'Nguyễn Thị A', NULL, N'Nữ', '1999-01-01', 'abcde', N'2 Trần Hưng Đạo, phường Phạm Ngũ Lão, quận 1, Hồ Chí Minh')
GO

INSERT CON(SDT, STT, HOTEN_CON, PHAI_CON, NGAYSINH_CON)
VALUES
	('0938391731', 1, N'Lâm Nhi', N'Nữ', '2021-01-01'),
	('0938391731', 2, N'Lâm Nhân',N'Nam', '2020-01-01'),
	('1234567890', 1, N'Trần X', N'Nam', '2021-02-02')
GO

INSERT DIACHINHANHANG(SDT, STT, HOTEN_NHAN, SDT_NHAN, DIACHI_NHAN, DIACHI_MACDINH, DIACHI_CONGTY)
VALUES
	('0938391731', 1, N'Lâm Quốc Cường', '0938391731', N'A39A Nguyễn Thần Hiến, phường 18, quận 4, Hồ Chí Minh', 1, 0),
	('0938391731', 2, N'Lâm Văn', '0909441116', N'456B Nguyễn Tất Thành, phường 18, quận 4, Hồ Chí Minh', 0, 1),
	('1234567890', 1, N'Nguyễn Thị A', '1234567890', N'2 Trần Hưng Đạo, phường Phạm Ngũ Lão, quận 1, Hồ Chí Minh', 1, 1)
GO

INSERT THUONGHIEU(MA_TH, TEN_TH, XUATXU_TH)
VALUES
	('TH0001', N'Meiji', N'Nhật Bản'),
	('TH0002', N'Nestle NAN', N'Thụy Sĩ'),
	('TH0003', N'Bobby', N'Mỹ'),
	('TH0004', N'Fitobimbi ', NULL),
	('TH0005', N'Pregnacare', N'Anh Quốc'),
	('TH0006', N'DHC', N'Nhật Bản')
GO

INSERT LOAISP(MA_LOAI, TEN_LOAI, LOAISP_CHA)
VALUES
	('LSP001', N'Sữa bột cao cấp', NULL),
	('LSP002', N'Bỉm tả', NULL),
	('LSP003', N'Vitamin và sức khỏe', NULL),
	('LSP004', N'Vitamin cho bé', 'LSP003'),
	('LSP005', N'Vitamin cho mẹ', 'LSP003')
GO

INSERT CHITIETLOAI(MA_TH, MA_LOAI)
VALUES
	('TH0001', 'LSP001'),
	('TH0002', 'LSP001'),
	('TH0003', 'LSP002'),
	('TH0004', 'LSP004'),
	('TH0005', 'LSP005'),
	('TH0006', 'LSP005')
GO

INSERT SANPHAM(MA_SP, TEN_SP, MIEUTA, MA_LOAI, MA_TH, COMBO, MA_KM, GIA, SOLUONGTON)
VALUES
	('SP0000000000001', N'Sữa Meiji Infant Formula 800g (0-12 tháng)', N'Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ
Meiji Infant Formula 800g (0-1 tuổi): lon thiếc dày dặn, nắp nhựa trắng có sẵn thanh gạt giúp việc đong sữa dễ dàng hơn. Thìa đong đựng sẵn trong lon, được thiết kế để pha chuẩn 20ml sữa. 
Bột sữa Meiji Infant Formula có màu vàng nhạt, hương vị tự nhiên từ sữa, các hạt tơi mịn, không bị vón cục.
Quang cao lo vang_220521-01-min
Dinh dưỡng nổi bật:
DHA, ARA, FOS, Lactadherin, α-Lactalbumin, 5 Nucleotides
Quang cao lo vang_220521-02-min
Tập trung phát triển não bộ: Việc bổ sung DHA (100mg/100g) và ARA (100mg/100g) cùng sự hỗ trợ của Taurine, Choline, Acid folic, vi chất sắt, kẽm,... giúp não bộ của trẻ phát triển một cách tốt nhất ngay từ giai đoạn sơ sinh.
Hỗ trợ tiêu hóa và hấp thu: FOS có trong sản phẩm Meiji là chất xơ hòa tan giúp tăng lợi khuẩn đường ruột Bifidus từ đó cải thiện tình trạng tiêu hóa của trẻ. Chất đạm khó tiêu β-lactoglobulin được phân giải một cách có chọn lọc thành trạng thái dễ tiêu hóa.
Quang cao lo vang_220521-03-min
Quang cao lo vang_220521-04-min
Tăng cường sức đề kháng: Việc bổ sung 5 loại Nucleotides có trong sữa mẹ (Disodium 5"-cytidylate, Disodium 5"-uridylate, Disodium 5"-inosinate, Disodium 5"-guanylate, 5"-Adenylic acid) cộng thêm vitamin C, vitamin E giúp bé phòng chống những bệnh dễ gặp phải trong giai đoạn mới chào đời. Bên cạnh đó, Meiji Infant Formula còn được bổ sung lactadherin nhằm phòng ngừa nhiễm trùng đường ruột do virus gây ra.
ảnh 3_tiêu chuẩn WHO
Hướng dẫn sử dụng:
Quang cao lo vang_220521-05-min
Quang cao lo vang_220521-06-min
Hướng dẫn bảo quản:ảnh 5_ hướng dẫn bảo quản
',
	'LSP001', 'TH0001', 0, NULL, 529000, 1000),
	('SP0000000000002', N'Combo 2 lon Sữa Meiji Infant Formula 800g (0-12 tháng)', N'Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ
	Meiji Infant Formula 800g (0-1 tuổi): lon thiếc dày dặn, nắp nhựa trắng có sẵn thanh gạt giúp việc đong sữa dễ dàng hơn. Thìa đong đựng sẵn trong lon, được thiết kế để pha chuẩn 20ml sữa. 
Bột sữa Meiji Infant Formula có màu vàng nhạt, hương vị tự nhiên từ sữa, các hạt tơi mịn, không bị vón cục.
Dinh dưỡng nổi bật:
DHA, ARA, FOS, Lactadherin, α-Lactalbumin, 5 Nucleotides
ảnh 2
Tập trung phát triển não bộ: Việc bổ sung DHA (100mg/100g) và ARA (100mg/100g) cùng sự hỗ trợ của Taurine, Choline, Acid folic, vi chất sắt, kẽm,... giúp não bộ của trẻ phát triển một cách tốt nhất ngay từ giai đoạn sơ sinh.
Hỗ trợ tiêu hóa và hấp thu: FOS có trong sản phẩm Meiji là chất xơ hòa tan giúp tăng lợi khuẩn đường ruột Bifidus từ đó cải thiện tình trạng tiêu hóa của trẻ. Chất đạm khó tiêu β-lactoglobulin được phân giải một cách có chọn lọc thành trạng thái dễ tiêu hóa.
Tăng cường sức đề kháng: Việc bổ sung 5 loại Nucleotides có trong sữa mẹ (Disodium 5"-cytidylate, Disodium 5"-uridylate, Disodium 5"-inosinate, Disodium 5"-guanylate, 5"-Adenylic acid) cộng thêm vitamin C, vitamin E giúp bé phòng chống những bệnh dễ gặp phải trong giai đoạn mới chào đời. Bên cạnh đó, Meiji Infant Formula còn được bổ sung lactadherin nhằm phòng ngừa nhiễm trùng đường ruột do virus gây ra.
ảnh 3_tiêu chuẩn WHO
Hướng dẫn sử dụng:
ảnh 4_ hướng dẫn sử dụng
Hướng dẫn bảo quản:ảnh 5_ hướng dẫn bảo quản',
	'LSP001', 'TH0001', 1, NULL, 1048000, 2000),
	('SP0000000000003', N'Sữa Nan Optipro 2 900g, HMO (6-12 tháng)', N'Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ
Với hơn 150 năm kinh nghiệm, Nestlé không ngừng tiên phong nghiên cứu & sáng tạo trong lĩnh vực dinh dưỡng dành cho trẻ nhỏ. Ứng dụng những nghiên cứu tiên tiến của Nestlé cho sức khỏe lâu dài của trẻ, Nestlé NAN OPTIPRO tự hào là người bạn đồng hành đáng tin cậy cùng mẹ nuôi dưỡng trọn tiềm năm trong con. 
- Sản phẩm dinh dưỡng công thức Nestlé® NAN® OPTIPRO® 2 900g với công thức từ Thụy Sĩ, nhập khẩu chính hãng bởi Nestlé Việt Nam
- Sản phẩm dinh dưỡng công thức cho trẻ từ 6-12 tháng tuổi
Mô tả sản phẩm Nestlé® NAN® OPTIPRO® 2 là sản phẩm dinh dưỡng công thức từ Thụy Sĩ, bổ sung các dưỡng chất thiết yếu giúp hỗ trợ tiêu hóa, tăng cường sức đề kháng, của trẻ. Công thức dinh dưỡng Nestlé® NAN®OPTIPRO® 2 từ Thụy Sĩ chứa:
• ĐẠM CHẤT LƯỢNG OPTIPRO: Đạm chất lượng Optipro với tỷ lệ đạm whey vượt trội
• Nestle HM-O 2"FL: bổ sung hàm lượng 0.25G/L 2"FL HM-O
• Lợi khuẩn BIFIDUS BL
• DHA và ARA, Omega 3, Omega 6
• Canxi và Vitamin D
Nestlé® NAN® OPTIPRO ® 2 được chứng nhận an toàn cho trẻ bởi FDA (Cục Quản lý Dược phẩm & Thực phẩm Hoa Kỳ) và EFSA (Ủy ban ATTP Châu Âu) 
NAN-2-900g copy copy',
	'LSP001', 'TH0002', 0, NULL, 429000, 3000),
	('SP0000000000004', N'Tã dán Bobby siêu thấm - khô thoáng (S, 4-8kg, 54 miếng)', N'Ưu điểm nổi bật:
LÕI NÉN COTTON-SOFT(1) 3 mm SIÊU MỀM - MỚI: Công nghệ ép đặc biệt chỉ 3 mm cùng bề mặt Cotton-soft(1) cho tã siêu mềm, mỏng mà vẫn thấm hút lượng lớn chất lỏng.
ĐỆM THUN THẤM MỒ HÔI: Lớp đệm siêu mềm với khả năng thấm mồ hôi tức thì, chăm sóc vùng bụng và lưng bé, giảm vết hằn trên da, cho bé luôn êm mềm và khô thoáng
BỀ MẶT 4.000 LỖ THẤM SIÊU TỐC: Cấu tạo bề mặt đột phá với hơn 4.000  lỗ thấm hút siêu nhanh cho tã thoáng khí hơn gấp 2 lần(3), tã mỏng, luôn khô thoáng từ trong ra ngoài.
MIẾNG DÁN MAGIC-TAPE SIÊU MỀM: Miếng dán với chất liệu mềm mại, dán được nhiều lần mà vẫn thoải mái cho bé
HỆ THUN FLEXI-FIT CO GIÃN THOẢI MÁI: Thun lưng co giãn và thun hông mềm mại, ôm vừa vặn nên luôn thoải mái, ngăn tràn
TRÀ XANH NHẬT BẢN: Cho làn da em bé dịu mát.
Thành phầm sản phẩm: Vải không dệt, Hạt siêu thấm, Bông Cellulose, PE, PP, Chun, Polyme kết dính, Trà xanh Matcha.
Hướng dẫn mẹ lựa chọn loại tã phù hợp cho bé yêu
Hướng dẫn sử dụng
Hướng dẫn bảo quản:  Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp, để xa tầm tay trẻ em. 
Lưu ý:
Thay tã sau khoảng thời gian đều đặn và thay ngay sau khi bé tiêu bẩn.
Ngừng sử dụng và hỏi ý kiến bác sĩ nếu xuất hiện bất thường trên da.',
	'LSP002', 'TH0003', 0, NULL, 189000, 800),
	('SP0000000000005', N'QT Bobby - Chậu rửa mặt gấp gọn màu hồng', NULL, NULL, 'TH0003', 0, 'SP0000000000004', NULL, 1000),
	('SP0000000000006', N'QT Bobby - Chậu rửa mặt gấp gọn màu xanh', NULL, NULL, 'TH0003', 0, 'SP0000000000004', NULL, 1000),
	('SP0000000000007', N'Siro giúp bé ngủ ngon, ngủ sâu Fitobimbi Sonno', N'Siro giúp trẻ ngủ ngon Sonno Bimbi giúp hỗ trợ cải thiện chất lượng giấc ngủ, giúp bé dễ dàng chìm vào giấc ngủ, ngủ ngon và sâu hơn. Hạn chế tình trạng trẻ thức giấc, quấy khóc vào ban đêm. Sản phẩm dạng siro hương vị thơm ngon, dễ uống, phù hợp với cả trẻ sơ sinh và trẻ nhỏ. Chiết xuất 100% từ các thảo dược thiên nhiên, không chứa gluten đảm bảo an toàn với sức khỏe của trẻ.
Sản phẩm cung cấp các dưỡng chất giúp tăng sức đề kháng, nhằm giảm các triệu chứng khó chịu gây quấy khóc, cân bằng hệ thần kinh… bằng các hoạt chất thiết yếu cùng thảo dược thiên nhiên để giúp bé có 1 giấc ngủ ngon và trọn vẹn.',
	'LSP004', 'TH0004', 0, 'SP0000000000004', 345000, 1000),
	('SP0000000000008', N'Vitamin và khoáng chất cho phụ nữ cho con bú Pregnacare Breast-Feeding', N'Pregnacare breast-feeding là thực phẩm chức năng đến từ Anh Quốc. Sản phẩm bổ sung vitamin và khoáng chất giúp tăng cường sức khoẻ và mang đến cho mẹ đang cho con bú nguồn sữa dồi dào, đủ dưỡng chất cần thiết cho con. 
Ưu điểm nổi bật
Viên uống Pregnacare breast-feeding được sản xuất tại Anh Quốc và có tem chính hãng trên vỏ hộp. Sản phẩm không chứa màu nhân tạo, chất bảo quản và lactose nên rất an toàn với sức khỏe của các mẹ.
Cung cấp đến 20 loại Vitamin và khoáng chất, sản phẩm giúp hỗ trợ:
Tăng cường sức khỏe, nâng cao sức đề kháng cho mẹ trong thời kỳ cho con bú.
Đảm bảo đủ nguồn sữa dồi dào, đủ dưỡng chất cần thiết cho sự phát triển toàn diện của con.
Hướng dẫn sử dụng
Mẹ nên sử dụng sau sinh và trong suốt thời kỳ cho con bú. 
Mẹ không nên sử dụng sản phẩm lúc đói, chỉ nên uống sau khi ăn với liều lượng 2 viên/ngày (1 viên nén + 1 viên nang)
Lưu ý: 
Thực phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh. 
Hỏi ý kiến bác sĩ trước khi dùng nếu bạn đang trong tình trạng phải theo dõi y tế, bị động kinh, bệnh tuyến giáp, bệnh nhiễm sắc tố sắt, bị dị ứng với thực phẩm. 
Sản phẩm có chứa vitamin K, nên không dùng nếu bạn đang uống thuốc chống đông (như warfarin) trừ khi đã hỏi ý kiến của bác sĩ. 
Thực phẩm không phải để thay thế một chế độ ăn uống cân bằng và đa dạng và lối sống lành mạnh. 
Không sử dụng cho người có mẫn cảm với bất cứ thành phần nào của sản phẩm.
Hướng dẫn bảo quản 
Bảo quản dưới 25°C nơi khô thoáng. 
Để tránh xa tầm tay của trẻ em.
Thông tin sản phẩm
Tên sản phẩm: Pregnacare breast-feeding 
Xuất xứ: Anh Quốc
Thương hiệu: VITABIOTICS
Đối tượng sử dụng:  Phụ nữ đang cho con bú
Quy cách đóng gói: Hộp chứa 4 vỉ viên nén x 14 viên; 2 vỉ viên nang x 14 viên
Hạn sử dụng: 36 tháng kể từ ngày sản xuất (in trên bao bì)
Thành phần chính: Mỗi viên nén có chứa: Calcium 350mg, Magnesium 75mg, Vitamin C 35mg, Vitamin E 10mg, Niacin 10mg, Sắt 8mg, Kẽm 7,5mg, Vitamin B6 5mg, Pantothenic acid 3 mg, Vitamin B1 2,5mg, Vitamin B2 1mg, Beta Carotene 1mg, Đồng 0,5mg, Folic acid 200mcg, Iốt 75 mcg, Biotin 75 mcg, Vitamin K 35mcg, Selen 15 mcg, Vitamin D3 5 mcg,  Vitamin B12 3mcg. Mỗi viên nang có chứa: DHA 300mg, EPA 60mg.',
	'LSP005', 'TH0005', 0, NULL, 725000, 500),
	('SP0000000000009', N'Viên uống bổ sung Vitamin C DHC', N'Viên uống Vitamin C DHC là sản phẩm đến từ thương hiệu uy tín của Nhật. Viên uống phù hợp với người có sức khoẻ yêu hoặc muốn làm đẹp da, giúp tăng sức đề kháng, làm sáng da và ngăn mụn trở lại.  
Ưu điểm nổi bật
Viên uống DHC bổ sung 1000mg lượng vitamin C hằng ngày, có công dụng:
Tăng cường sức đề kháng
Kích thích sản sinh collagen
Làm sáng các vết thâm và ngăn mụn xuất hiện trở lại 
Đối tượng sử dụng 
Người muốn làm đẹp da
Người có sức khoẻ yếu 
Người hay hút thuốc lá, uống rượu bia
Người muốn nâng cao sức khoẻ 
Hướng dẫn sử dụng
Nên uống bằng nước ấm với liều lượng 2 viên/ngày. 
Lưu ý: 
Không dùng cho trẻ dưới 9 tuổi 
Dừng uống khi phát hiện bất thường 
Không dùng cho người mẫn cảm với bất kì thành phần nào của thuốc 
Để xa tầm tay trẻ em 
Tham khảo ý kiến chuyên gia nếu đang dùng sản phẩm khác hoặc đang điều trị tại bệnh viện 
Sử dụng ngay khi mở bao bì
Hướng dẫn bảo quản
Bảo quản ở nơi khô ráo, thoáng mát. 
Tránh ánh nắng mặt trời. 
Thông tin sản phẩm
Tên sản phẩm: Viên uống Vitamin C DHC 
Xuất xứ: Nhật Bản 
Thương hiệu: DHC
Số lượng: 600 viên/gói 
Thành phần: Vitamin C, vitamin B2, gelatin, caramel, titan dioxide', 'LSP003', 'TH0006', 0, NULL, 95000, 1000)
GO

INSERT CHITIETSP(MA_SP, STT, TEN_CT, THONGTIN_CT)
VALUES
	('SP0000000000001', 1, N'Tên sản phẩm', N'Thực phẩm bổ sung sản phẩm dinh dưỡng công thức cho trẻ từ 0 đến 12 tháng tuổi: Meiji 0-1 years old Infant Formula'),
	('SP0000000000001', 2, N'Xuất xứ sản phẩm', N'Nhật Bản'),
	('SP0000000000001', 3, N'Trọng lượng sản phẩm (kg)', N'0.8'),
	('SP0000000000001', 4, N'Độ tuổi phù hợp', N'Cho trẻ từ 0-12 tháng'),
	('SP0000000000001', 5, N'Hướng dẫn sử dụng	', N'- Rửa tay trước khi pha.
- Đảm bảo các đồ dùng và thiết bị sạch sẽ và được tiệt trùng trong nước sôi.
- Sử dụng muỗng kèm trong hộp để lấy chính xác lượng bột cần thiết và đổ vào bình đã được tiệt trùng.
- Đổ nước nóng vào bình khoảng 2/3 tổng khối lượng nước được chỉ định.
- Đóng nắp bình và lắc nhẹ đến khi bột tan hoàn toàn.
- Cho thêm nước sôi cho đủ khối lượng nước được chỉ định rồi lắc nhẹ.
- Để nguội xuống còn tầm 38 độ thì cho bé uống.
- Nếu muốn làm nguội nhanh, bạn có thể cho bình ngâm trong bát nước lạnh.
- Trước khi cho bé dùng, hãy kiểm tra nhiệt độ để tránh bỏng vòm họng của bé, nếu như nhỏ một vài giọt ra cổ tay mà chỉ còn âm ấm là có thể cho bé dùng được.'),
	('SP0000000000001', 6, N'Hướng dẫn bảo quản	', N'- Đậy kín nắp hộp sau khi mở và để ở nơi mát, khô ráo.
- Không nên cho sản phẩm vào tủ lạnh.
- Nên sử dụng trong vòng 4 tuần từ khi mở sản phẩm'),
	('SP0000000000003', 1, N'Xuất xứ sản phẩm', N'Việt Nam'),
	('SP0000000000003', 2, N'Kích cỡ (size)', N'S'),
	('SP0000000000003', 3, N'Độ tuổi phù hợp', N'4-8kg')
GO

INSERT PHIEUGGQT(MA_PHIEU, TEN_PHIEU, GIATRI_PHIEU)
VALUES
	('MP0001', N'Giảm 100000đ', 100000),
	('MP0002', N'Giảm 50%', 0.5)
GO

INSERT DONHANG(MA_DH, SDT, TINHTRANG, MA_PHIEU, TIENHANG, THANHTIEN)
VALUES
	('DH0000000000001', '0938391731', N'Hoàn tất', NULL, 0, 0),
	('DH0000000000002', '0938391731', N'Hoàn tất', 'MP0001', 1436000, 1336000),
	('DH0000000000003', '1234567890', N'Hoàn tất', 'MP0002', 774000, 386000)
GO

INSERT CHITIETDH(MA_DH, MA_SP, SO_LUONG)
VALUES
	('DH0000000000001', 'SP0000000000001', 2),
	('DH0000000000001', 'SP0000000000004', 2),
	('DH0000000000002', 'SP0000000000001', 2),
	('DH0000000000002', 'SP0000000000004', 2),
	('DH0000000000003', 'SP0000000000003', 1),
	('DH0000000000003', 'SP0000000000007', 1)
GO

INSERT SIEUTHI(MA_ST, TEN_ST, DIACHI_ST, TGMOCUA)
VALUES
	('ST0001', N'Chi nhánh 1', N'28-30-32-34 Nguyễn Thị Thập, phường Bình Thuận, quận 7', '08:00-22:00'),
	('ST0002', N'Chi nhánh 2', N'175 Lâm Văn Bền, phường Bình Thuận, quận 7', '08:00-22:00'),
	('ST0003', N'Chi nhánh 3', N'424 Nguyễn Thị Minh Khai, phường 5, quận 3', '08:00-22:00'),
	('ST0004', N'Chi nhánh 4', N'175 Lâm Văn Bền, phường Bình Thuận, quận 7', '08:00-22:00'),
	('ST0005', N'Chi nhánh 5', N'175 Lâm Văn Bền, phường Bình Thuận, quận 7', '08:00-22:00'),
	('ST0006', N'Chi nhánh 6', N'175 Lâm Văn Bền, phường Bình Thuận, quận 7', '08:00-22:00'),
	('ST0007', N'Chi nhánh 7', N'175 Lâm Văn Bền, phường Bình Thuận, quận 7', '08:00-22:00')
GO

INSERT KHO(MA_ST, MA_SP, SOLUONGTON)
VALUES
	('ST0001', 'SP0000000000001', 1000),
	('ST0001', 'SP0000000000002', 800),
	('ST0001', 'SP0000000000003', 1000),
	('ST0001', 'SP0000000000004', 4000),
	('ST0001', 'SP0000000000005', 0),
	('ST0001', 'SP0000000000006', 1000),
	('ST0001', 'SP0000000000007', 0),
	('ST0001', 'SP0000000000008', 0),
	('ST0001', 'SP0000000000009', 1000),
	('ST0002', 'SP0000000000001', 1000),
	('ST0002', 'SP0000000000002', 800),
	('ST0002', 'SP0000000000003', 1000),
	('ST0002', 'SP0000000000004', 0),
	('ST0002', 'SP0000000000005', 1000),
	('ST0002', 'SP0000000000006', 1000),
	('ST0002', 'SP0000000000007', 4000),
	('ST0002', 'SP0000000000008', 1000),
	('ST0002', 'SP0000000000009', 1000)
GO

--SELECT*FROM BOME
--SELECT*FROM CON
--SELECT*FROM DIACHINHANHANG
--SELECT*FROM THUONGHIEU
--SELECT*FROM LOAISP
--SELECT*FROM CHITIETLOAI
--SELECT*FROM SANPHAM
--SELECT*FROM CHITIETSP
--SELECT*FROM PHIEUGGQT
--SELECT*FROM DONHANG
--SELECT*FROM CHITIETDH
--SELECT*FROM SIEUTHI
SELECT*FROM KHO