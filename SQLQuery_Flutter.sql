drop database DB_APP_STORYY;
go
create database DB_APP_STORYY;
go
use DB_APP_STORYY;
go
create table accounts (
    acId int IDENTITY(1,1) primary key,
    userName varchar(255) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    role int NOT NULL,
    create_at Datetime NOT NULL DEFAULT GETDATE(),
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1
);

go

create table authors (
    authorId int IDENTITY(1,1) primary key,
    name nvarchar(255) NOT NULL,
    bio nvarchar(255) NOT NULL,
    create_at Datetime NOT NULL DEFAULT GETDATE(),
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1,
);

go


create table categories (
    categoryId int IDENTITY(1,1) primary key,
    name nvarchar(255) NOT NULL UNIQUE,
    description nvarchar(255) NOT NULL,
    create_at Datetime NOT NULL DEFAULT GETDATE(),
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1
);
go


create table stories (
    storyId int IDENTITY(1,1) primary key,
    title nvarchar(255) NOT NULL UNIQUE ,
    authorId int,
    categoryId int,
    description nvarchar(max) NOT NULL,
    coverImage varchar(255) NOT NULL ,
    create_at Datetime NOT NULL  DEFAULT GETDATE(),
    update_at Datetime NULL ,
    status bit NOT NULL DEFAULT 1,
    FOREIGN KEY (authorId) REFERENCES authors(authorId),
    FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
);
go


create table chapters (
    chapterId int IDENTITY(1,1) primary key,
    storyId int,
    chapterTitle nvarchar(255) NOT NULL,
    content nvarchar(max) NOT NULL,
    chapterNumber int NOT NULL,
    create_at Datetime NOT NULL DEFAULT GETDATE(),
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1,
    FOREIGN KEY (storyId) REFERENCES stories(storyId)
);
go


create table comments (
    commentId int IDENTITY(1,1) primary key,
    acId int,
    storyId int,
    chapterId int,
    content nvarchar(max) NOT NULL,
    create_at Datetime NOT NULL DEFAULT GETDATE(),
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1,
    FOREIGN KEY (acId) REFERENCES accounts(acId),
    FOREIGN KEY (storyId) REFERENCES stories(storyId),
    FOREIGN KEY (chapterId) REFERENCES chapters(chapterId)
);
go


create table favorites (
    favoriteId int IDENTITY(1,1) primary key,
    acId int,
    storyId int,
    create_at Datetime NOT NULL DEFAULT GETDATE(),
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1,
    FOREIGN KEY (acId) REFERENCES accounts(acId),
    FOREIGN KEY (storyId) REFERENCES stories(storyId)
);
go

create table views (
    viewId int IDENTITY(1,1) primary key,
    acId int,
    storyId int,
    chapterId int,
    viewed_at Datetime NULL,
    create_at Datetime NOT NULL,
    update_at Datetime NULL,
    status bit NOT NULL DEFAULT 1,
    FOREIGN KEY (acId) REFERENCES accounts(acId),
    FOREIGN KEY (storyId) REFERENCES stories(storyId),
    FOREIGN KEY (chapterId) REFERENCES chapters(chapterId)
);

INSERT INTO accounts (userName, email, password, role)
VALUES 
('admin', 'admin@example.com', 'password123', 0),
('author1', 'author1@example.com', 'password123', 1),
('author2', 'author2@example.com', 'password123', 1),
('author3', 'author3@example.com', 'password123', 1),
('user1', 'user1@example.com', 'password123', 2),
('user2', 'user2@example.com', 'password123', 2),
('user3', 'user3@example.com', 'password123', 2),
('user4', 'user4@example.com', 'password123', 2),
('user5', 'user5@example.com', 'password123', 2);

INSERT INTO authors ( name, bio) VALUES 
(N'Lam Diệp Thư Sinh', 'Biography of Author A'),
( N'Thanh Vân Các', 'Biography of Author B'),
(N'Phong Kinh Dương', 'Biography of Author A'),
( N'Sĩ Lạp Manh', 'Biography of Author B'),
(N'Đông Phương Mộng Mộng', 'Biography of Author A'),
( N'Thiếu Niên Như Đao', 'Biography of Author B');

INSERT INTO categories ( name, description)
VALUES 
( N'Tiên Hiệp', N'Cổ Điển Tiên Hiệp'),
( N'Huyền Huyễn', N'Đông Phương Huyền Huyễn'),
( N'Đô Thị', N'Đô Thị Dị Năng'),
( N'Kỳ Ảo', N'Tây Phương Kỳ Huyễn'),
( N'Dã Sử', N'Dân Gian Truyền Thuyết'),
( N'Kiếm Hiệp', N'Võ Hiệp Huyễn Tưởng'),
( N'Võng Du', N'Viễn Cổ Hồng Hoang'),
( N'Đồng Nhân', N'Lịch Sử Thần Thoại');

INSERT INTO stories ( title, authorId, categoryId, description, coverImage, create_at)
VALUES 
( N'Tinh Thần Biến', 2, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'ttb.jpg', GETDATE()),
( N'Nghịch Chuyển', 2, 1, N'"Ngươi có thể không chịu thua, nhưng ngươi được đến chịu già!""Có đạo lý, nhưng người nào nói ta già?"Đây là một cái lão gia hỏa tại chức nghiệp kiếp sống tổn thương ngừng bổ lúc hoàn thành nghịch chuyển tuyệt sát cố sự.', 'nc.jpg', GETDATE()),
( N'Tu Tiên Gia Tộc Chi Hóa Linh Oản', 1, 1, N'Lý Huyền Chân ngoài ý muốn q·ua đ·ời, thai xuyên đến Tu Tiên giới Vân Vụ Lý gia, chỉ là Vân Vụ Lý gia chỉ là cái vừa mới thành lập gia tộc mới, người sáng lập là hắn cùng thế hệ. Vì thế, Vân Vụ Lý gia nhiều cái tam thuỷ tổ.Nhìn thiên phú cường đại Gia chủ ca, lại nhìn nhìn thích hạt bận việc, lãng phí tư chất nhị tỷ, cuối cùng nhìn nhìn lại tư chất kém cỏi nhất chính mình, Lý Huyền Chân nhọc lòng a.May mắn người xuyên việt trang bị bàn tay vàng, hắn phát hiện đi theo chính mình xuyên qua mà đến tổ truyền chén ngọc thế nhưng là cái bảo bối, có thể luyện hóa trong linh vật linh khí thành linh dịch.Dùng linh dịch tốc độ tu luyện siêu mau, còn không có đan độc, so đan dược mạnh hơn nhiều.Bằng vào Hóa Linh Oản, Lý Huyền Chân khắp nơi vơ vét linh vật, kiếm lấy linh thạch, cuối cùng lấy cấp thấp tư chất tu luyện ra một đầu thuộc về mình đập linh vật tu tiên đạo lộ.', 'ttgtchlo.jpg', GETDATE()),
( N'Chi Vạn Cổ Đệ Nhất Cương Thi', 3, 2, N'Hồng Hoang, Thượng Cổ, Trung Cổ mỗi một cái thời đại, cường giả hoành hành thiên địa, vĩnh tồn vạn giới. Bất tử bất diệt cương thi tổ, lại vẫn lạc. Một cái nhỏ yếu sinh linh, trở thành cương thi một khắc, giải khai vạn cổ bí mật, cũng theo đó mà đến. Thiên Địa Huyền Hoàng, không phục liền làm!', 'cvcdnct.jpg', GETDATE()),
( N'Toàn Dân Chuyển Chức', 4, 3, N'Toàn cầu dị biến, trò chơi giáng lâm hiện thế, dị giới quái vật tại toàn cầu tứ ngược.Vì mạnh lên, vì chống cự t·ai n·ạn.Mỗi người đều tại chuyển chức, điên cuồng thăng cấp.Có người nhất chuyển trở thành pháp sư, cũng có người nhị chuyển chức nghiệp lôi đình chiến sĩ.Mà Lăng Chiến, lại đi ngược lại con đường cũ.Bắt đầu, lựa chọn không nghề nghiệp tán nhân, điểm thuộc tính toàn bộ thêm lam.“Điên rồi đi, không nghề nghiệp tán nhân, nắm giữ tất cả đều là chuyển chức trước cấp thấp kỹ năng, hậu kỳ đánh như thế nào?”“Thanh mana có làm được cái gì, lại không thể gia tăng sức chiến đấu, thật sự là buồn cười.”……Nhưng mà, làm chiến đấu xảy ra.Nào đó tam chuyển chức nghiệp lôi đình chiến sĩ: “Ta kinh ngạc, không nghề nghiệp tán nhân mạnh như vậy?”Nào đó tam chuyển Tinh Linh vương nữ thần: “Vô hạn thanh mana, đơn đấu vô địch, quần chiến No.1, thế thì còn đánh như thế nào?”', 'tdcc.jpg', GETDATE()),
( N'Pháp Sư Chi Thượng', 5, 4, N'Như thế nào pháp sư?Không gì làm không được tức là pháp sư.Chân chính pháp sư có thể dùng pháp thuật giải quyết vấn đề gì,Nếu như ngay sau đó không giải quyết được,Vậy liền sáng tạo một cái có thể giải quyết pháp thuật.......“Lực p·há h·oại chỉ là pháp thuật sản phẩm phụ, pháp thuật cường đại, ở chỗ sức sáng tạo.”“Tri thức chính là lực lượng!”“Pháp sư phía trên, lại là cái gì?”', 'psct.jpg', GETDATE()),
( N'Ảnh Giới', 6, 4, N'Tôi là Thao, một trạch nam sống tại thủ đô Hà Nội, nước Việt Nam. Một ngày không may tôi hẹo và xuyên không sang một thế giới song song. Ở đây cũng là Trái Đất nhưng lại là không gian sinh sống của ma quỷ. Đó cũng là lí do nó biến hoá theo một chiều hướng khác. Hãy cùng tôi khám phá thế giới này nhaXin chân thành cảm ơn', 'ag.jpg', GETDATE()),
( N'Đế Quốc Bóng Tối', 3, 4, N'Chết mà đứng vẫn là quỳ mà sống từ trước đến nay đều không phải là một cái vấn đề, không nguyện ý quỳ đã sớm đứng lên , không dám đứng lên một mực quỳ lấy, sẽ không có người bởi vì một cái vấn đề liền thay đổi lập trường, từ trước đến nay đều là như thế.Nếu như bây giờ cho ngươi một đoạn nhân sinh mới, khởi đầu mới, ngươi nguyện ý đứng lên, vẫn là quỳ xuống?', 'dqbt.jpg', GETDATE()),
( N'Linh Hồn Lạc Lối', 2, 4, N'Trong một thế giới tàn khốc và lạc hậu, nơi những kẻ thống trị cai trị bằng nắm đấm sắt và phép thuật tàn bạo, con người chỉ là những con cờ vô giá trị. Đế chế bóng tối trải dài, chà đạp lên mọi hy vọng của dân chúng. Xã hội mục nát, sinh mạng con người bị coi rẻ, và chỉ có những kẻ mạnh mới có quyền tồn tại.Giữa khung cảnh u ám đó, một kẻ lạ mặt xuất hiện—không ai biết anh ta đến từ đâu, hay anh ta mang trong mình sức mạnh gì. Nhưng từng bước đi của anh khiến cả thế giới phải chú ý. Lặng lẽ, nhưng mạnh mẽ. Bí ẩn, nhưng quyết đoán. Anh không cam chịu cúi đầu trước những kẻ thống trị tàn bạo, cũng không ngần ngại đối đầu với những quyền lực đen tối nhất.Với sức mạnh chưa từng có, và một quyết tâm sâu thẳm được khơi dậy từ sự bất công, hành trình của anh sẽ thay đổi số phận của cả một thế giới chìm trong bóng tối. Không ai biết liệu anh là cứu tinh hay kẻ hủy diệt, nhưng những gì anh mang đến chắc chắn sẽ viết lại trật tự thế giới.Bước vào cuộc hành trình đầy hiểm nguy, nơi bí mật, quyền lực và sự khát vọng tự do giao thoa. Đây là câu chuyện của một kẻ dị giới, nơi những truyền thuyết mới đang được viết lên từ chính máu và bóng tối.', 'lhll.jpg', GETDATE()),
( N'Liễu Niệm Từ', 1, 4, N'Liễu Niệm Từ cùng Tôn Ngộ Không, Bồ Đề lão tổ, Nữ Oa nương nương, giúp đỡ lẫn nhau, học tập lẫn nhau, trải qua gian nan, khổ luyện, cuối cùng sáng tạo ra loài người và khiến nhân loại ngập tràn tình yêu thương, giúp đỡ lẫn nhau, chung sống hòa bình, khiến nhân loại muôn đời muôn kiếp, sinh sôi nảy nở, trường tồn vĩnh cửu.', 'lnt.jpg', GETDATE()),
( N'Chuyện Lạ Bắc Tề', 5, 5, N'Thiên Bảo mười năm, anh hùng Thiên Tử Cao Dương đàn tấu lên Bễ Cốt tỳ bà, tự đàn tự hát, nhạc đệm khúc vang lên, quái đản, hoang đường, khủng bố, tuyệt vọng lại thống khổ.Một năm này, ở tại Chương Thủy bên cạnh Lưu Đào Tử giữ được chút cá, cố sự liền bắt đầu.', 'clbt.jpg', GETDATE()),
( N'Đao Bất Ngữ', 4, 6, N'Có người hỏi ta, cái gì là giang hồ? Ta nghĩ nghĩ, nghĩ tới là trước bàn một bầu rượu đục, là tà dương bên dưới thân ảnh đi xa, là dưới ánh trăng một ngôi mộ oanh, là giờ này khắc này trong tay thiêu đốt hầu như không còn thuốc lá.Người kia lại hỏi, giang hồ ở đâu? Ta cười cười, ngẩng đầu nhìn về phía ngoài cửa sổ, nơi đó có vô số cái giang hồ. Một người chính là một cái cố sự, hai người chính là một cái giang hồ.', 'dbn.jpg', GETDATE()),
( N'Nhiên Tẫn Chi Long', 6, 7, N'Đầu này Hồng Long theo mênh mông hoang nguyên mà đến, ngấp nghé thế gian hết thảy lực lượng, hắn từng có vô số danh hiệu: Quần Sơn nộ diễm, Luyện Ngục t·hiên t·ai, Hồng hoàng đế, Nhiên Tẫn chi long. . .Thế giới tại cự long dưới bóng tối run rẩy, ma pháp cách mạng công nghiệp triều dâng bị hắn nhấc lên, tại hắn tạo dựng trong đế quốc, Phi Long rít gào, hỏa lực cùng vang lên, sắt thép cự thú xuất hiện ở trên trời cùng đại địa, lại có đến từ dị thế giới t·hiên t·ai bốn phía hoành hành."Thần phục, hoặc là t·ử v·ong."Cassius triển khai cái kia che khuất bầu trời hai cánh, nhìn xuống hắn xuống run lẩy bẩy nhân loại, Tinh Linh cùng người lùn, nói như vậy.. . .Một đầu tự mang người chơi khuôn mẫu Hồng Long tại dị thế giới chinh phục, thống trị cũng cải tạo thế giới cố sự.', 'ntcl.jpg', GETDATE()),
( N'Vạn Cổ Thần Đế', 2, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'vctd.jpg', GETDATE()),
( N'Vô Thượng Thần Đế', 5, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'vttd.jpg', GETDATE()),
( N'Đế Bá', 6, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'db.jpg', GETDATE()),
( N'Vũ Thần Chúa Tể', 3, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'vtct.jpg', GETDATE()),
( N'Yêu Long Cổ Đế', 4, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'ylcd.jpg', GETDATE()),
( N'Vô Thượng Sát Thần', 1, 1, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'vtst.jpg', GETDATE()),
( N'Nguyệt Hàm Ngọc', 2, 8, N'Ngàn năm trước, Tiềm Long Đại Lục Sở Quốc Hạng Thị g·iết c·hết Tần Vương soán đến vương vị, Tần Vương bộ tộc, lấy quốc làm họ, ẩn vào thế. Thẳng đến mấy năm trước Tần gia chủ mẹ bị Sở Vương s·át h·ại, Trấn Đông Vương Tần Đức không thể không tái hiện sa trường, lập thệ muốn báo đất nước này cừu gia hận.Trấn Đông Vương Tam thế tử Tần Vũ, văn không có khả năng quyền mưu, võ không có khả năng tu nội công, trợ giúp phụ thân.Vì báo thù mẹ, mở ra lối riêng, khổ luyện ngoại công, lại dưới cơ duyên xảo hợp, đến trên trời rơi xuống kỳ thạch, từ đây, vận mệnh của hắn phát sinh biến hóa nghiêng trời lệch đất.Nào có thể đoán được một trận đại chiến bên trong, Tần Vũ không địch lại cường thủ, b·ị đ·âm xuyên trái tim......', 'nhn.jpg', GETDATE());



INSERT INTO chapters (storyId, chapterTitle, content, chapterNumber)
VALUES 
( 1, N'Tần Vũ', N'Chương 1: Tần Vũ

Tiết trời đang là mùa đông, tuyết rơi dầy khắp nơi, toàn bộ Viêm Kinh Thành đều phủ thêm một tầng ngân trang. Viêm Kinh Thành cực lớn, có thể dung nạp nhân khẩu mấy trăm vạn, mà khống chế Đông Vực Tam Quận “Trấn Đông Vương” Tần Đức phủ đệ chính là tại cái này Viêm Kinh Thành.

Trấn Đông Vương Phủ Để chiếm diện tích cực lớn, cả ngày lẫn đêm ban đêm đều là thật to rộng mở, phủ đệ cửa chính rộng lớn không gì sánh được, đầy đủ sáu, bảy người song hành đi vào.

Mà tại cửa lớn hai bên đứng đấy hai tên thân cao chừng hai mét ở trần dũng mãnh đại hán, cái này hai tên đại hán giống như bức tượng đá bình thường, lạnh nhạt hai mắt quét mắt qua lại đám người, cái kia khoan hậu trên lưng hổ chính treo cự hình màu đỏ như máu chiến đao. Cái kia màu đỏ như máu chiến đao nhìn một cái chừng một mét năm dài.

Mùa đông thời điểm, hoa tuyết đầy sân, nhiệt độ thấp đủ cho dọa người, trong sông đều đã kết băng, có thể hai đại hán này lại ở trần.

Nhưng mà đó cũng không phải nhất doạ người, càng thêm doạ người chính là tại hai đại hán này bên cạnh vậy mà phân biệt có một cái hung mãnh lão hổ.

Lão hổ toàn thân là hỏa diễm giống như xích hồng sắc, thân dài ước chừng hơn hai mét, cái kia giống như roi sắt một dạng cái đuôi đột nhiên quét qua đều để không khí một trận chấn động, trong mắt hổ phát ra lạnh lẽo hàn mang, con hổ này chính là cái gọi là “Liệt hổ”.

Bỗng nhiên, Trấn Đông Vương trong phủ đệ đi ra hai tên đại hán khác, cái này hai tên đại hán đồng dạng ở trần, phân biệt dẫn dắt một cái hung mãnh liệt hổ, bọn hắn là đến thay ca.

Phủ đệ bên ngoài, Viêm Kinh Thành gia tộc quyền thế quý tộc hoặc là bình dân du dân đều tự giác vòng quanh Trấn Đông Vương phủ đệ đi ra.

Trấn Đông Vương Phủ Để bên trong một trong tiểu viện u tĩnh.

Một trung niên nhân áo xanh đang ngồi ở trên mặt ghế đá, trên đùi của hắn ngồi một cái đáng yêu tiểu nam hài. Mà tại trung niên nhân trước người chính là đứng đấy mười hai người, mười hai người này có thể là lão giả, có thể là mỹ phụ, có thể là thanh niên...... Nhưng là có một điểm chung, mười hai người này đều là một thân áo tím.

“Phụ vương, ngươi để nhiều như vậy lão sư đều tới làm gì đâu?” mới vừa vặn 6 tuổi Tần Vũ ngồi tại cha mình trên đùi, trong tay nhéo loạn một quả cầu tuyết, nghi hoặc nhìn xem phụ thân của mình Tần Đức.

Tần Đức yêu mến phủ mo Tần Vũ đầu, sau đó ngẩng đầu nhìn về phía mười hai người, lạnh nhạt nói: “Các ngươi dạy bảo Vũ Nhi cũng có một đoạn thời gian, tốt, đừng bận tâm cái gì, có cái gì phán đoán nói ngay đi.”

Mười hai người này nhìn nhau, sau đó một tên râu bạc bồng bềnh lão giả tiến lên một bước, cung kính nói: “Bẩm báo vương gia, chúng ta từ từng cái phương diện quan sát, Tam điện hạ chỉ là đối với kỳ môn xảo kỹ thoáng có chút hứng thú, nhưng mà, đối đầu vị giả đạo ngự kẻ dưới chờ chút, lại là căn bản không có mảy may hứng thú. Căn cứ phán đoán của chúng ta, Tam điện hạ không có khả năng trở thành một cái hoàn mỹ thượng vị giả.”

Vẻn vẹn bằng một đoạn thời gian cùng nam hài tiếp xúc, liền hạ xuống như vậy khẳng định, tựa hồ hơi có vẻ võ đoán. Nhưng mà Tần Đức lại là không chút nghi ngờ.

Tần Đức thở dài một tiếng, nhìn một chút u mê không biết Tần Vũ, cười khổ nói: “Ta có thể nhìn ra, Vũ Nhi giống hệt mẹ nó, đối với thế tục quyền thế không có chút nào hứng thú, thế nhưng là hắn đang tu luyện một đường bên trên lại là......”

Tần Đức nói đến đây đột nhiên ngừng lại, sau đó phất phất tay, nói “Trong khoảng thời gian này làm phiền các ngươi, các ngươi hiện tại có thể rời đi vương phủ.”

“Vương gia, chúng ta cáo từ!”

Áo tím mười hai người đồng thời khom người, sau đó lần lượt rời khỏi nho nhỏ u tĩnh trang viện.

Giờ phút này, trong trang viện chỉ có Tần Đức cùng nhi tử Tần Vũ, Tần Đức trầm mặc không nói gì, khi thì còn nhìn xem trên đùi Tần Vũ, trong mắt hàm nghĩa, chí ít 6 tuổi Tần Vũ vẫn là không cách nào minh bạch.

“Phụ vương hắn thế nào, tại sao không nói chuyện đâu?” Tần Vũ trong lòng thầm nghĩ, nhưng là Tần Vũ cũng rất là khéo léo không có đánh quấy phụ thân hắn, từ nhỏ không có mẫu thân, tại Tần Vũ trong lòng, trọng yếu nhất chính là phụ thân, còn có mặt khác hai cái ca ca.

Rất rất lâu, Tần Đức vẫn ngồi như vậy, Tần Vũ vẫn lẳng lặng ngồi tại cha mình trên đùi.

Bỗng nhiên, một tiếng hạc ré vang lên.

Chỉ gặp không trung trắng nhợt sắc Tiên Hạc bay tới, tại Tiên Hạc phía trên đang ngồi lấy một tiên phong đạo cốt tuấn nhã trung niên nhân, một lát Tiên Hạc liền rơi xuống trong sân.

“Phong Huynh, Vũ Nhi Đan Điền vấn đề, ngươi có thể lấy nghĩ biện pháp......” Tần Đức vừa nhìn thấy trung niên nhân này, lúc này vội vàng đứng lên dò hỏi.

Phong Ngọc Tử nhìn thấy Tần Đức như vậy, hắn tự nhiên biết mình hảo hữu Tần Đức sự tình, chỉ có thể thở dài một hơi nói “Vương gia, ta đã nói rồi, Vũ Nhi hắn đang tu luyện một đường bên trong căn bản không có bất cứ hy vọng nào, đan điền của hắn mười phần quái dị, không cách nào tích súc nội lực, tự nhiên không cách nào tu luyện. Như vậy đan điền căn bản chính là trời sinh, ức vạn người bên trong căn bản là không có cách tìm tới như nhau, ta Phong Ngọc Tử cũng là không có chút nào biện pháp.”

Nghe được kết quả này, Tần Đức chầm chậm tọa hạ, trầm tư hồi lâu.

“Phụ vương? Nội lực là cái gì a, đan điền của ta không cách nào tích súc nội lực thì thế nào? Vừa rồi những lão sư kia còn nói cái gì thượng vị giả, đó là cái gì ý tứ a?” 6 tuổi Tần Vũ mở to hai mắt, nghi ngờ dò hỏi.

Lời nói vừa rồi hắn nhưng là nhớ rõ đâu.

Tần Đức thầm cười khổ, ngoài miệng lại là an ủi: “Vũ Nhi, ngươi đừng hỏi nhiều như vậy, ngươi không phải không thích học cái này học cái kia, ưa thích đi “Vân Vụ Sơn Trang” sao?”

Tần Vũ lập tức mắt sáng rực lên, phảng phất bầu trời đêm sáng chói tinh thần: “A, ta có thể không cần học những cái kia khô khan sách a, Vân Vụ Sơn Trang, ta thích suối nước nóng kia, còn thích xem ngôi sao, còn thích xem mặt trời mọc.”

Tần Đức cười nói: “Tốt, tốt, tốt, Vũ Nhi, ngươi nếu ưa thích, ta liền đem Vân Vụ Sơn Trang cho ngươi, còn có 1000 tinh binh về sau cũng về ngươi quản, nếu như ngươi muốn cái gì, trực tiếp cùng ngươi ngay cả gia gia nói.”

“Tốt, quá tốt rồi, oa, Vân Vụ Sơn Trang là của ta rồi, ta có thể mỗi ngày cua suối nước nóng kia, rất thư thái.” Tần Vũ hưng phấn khuôn mặt đỏ rừng rực.

Tần Đức nụ cười trên mặt hoàn toàn là giả vờ, nhưng mà Tần Vũ lại là không phát hiện được.

“Ngươi ưa thích là được rồi, Vũ Nhi, ngươi về trước đi đi ngủ, lúc nào muốn đi Vân Vụ Sơn Trang, liền cùng ngươi ngay cả gia gia nói.” Tần Đức cười vỗ vỗ Tần Vũ đầu.

“Phụ vương gặp lại, Phong Bá Bá gặp lại.” Tần Vũ phất phất tay, bay thẳng đến gian phòng của mình chạy tới.

Tần Đức cười nhìn lấy Tần Vũ tiến nhập gian phòng, sau đó Tần Đức sắc mặt đột nhiên lạnh lùng, trực tiếp thân hình lóe lên hóa thành một đạo khói xanh, biến mất tại trong sân, mà Phong Ngọc Tử cũng là giống như sợi tơ đi theo.......

Vương phủ trong mật thất, giờ phút này chỉ có ba người, Tần Đức, Phong Ngọc Tử cùng một tên tay cầm quạt xếp áo đen thư sinh.

“Vương gia, ngươi thật quyết định a?” áo đen thư sinh nhìn xem Tần Đức, nghi ngờ nói.

Tần Đức gật đầu nói: “Vũ Nhi hắn đã thành không được thủ lĩnh nhân vật, lại không thành được tiên thiên cấp bậc cao thủ, hắn hay là không tham gia đến trong đó cho thỏa đáng. Hắn cái kia quái dị đan điền, ai, ta có thể cho hắn, có lẽ chỉ có vài chục năm khoái hoạt bình tĩnh thời gian, đợi cho chúng ta bắt đầu cuối cùng kế hoạch, Vũ Nhi hắn cũng vô pháp vượt qua cuộc sống an ổn.”

Phong Ngọc Tử suy nghĩ một lát, quyết định hay là nói ra.

“Vương gia, ngươi kế hoạch thật muốn thực hành a, ngươi hẳn phải biết, một khi thực hành kế hoạch kia, sẽ dẫn đến kết quả gì?” Phong Ngọc Tử hỏi lại lần nữa.

Tần Đức sắc mặt lập tức nghiêm túc, trong mắt hàn quang Winky: “Mặc kệ là vì ta Tần gia tổ tiên, vẫn là vì Tĩnh Di, kế hoạch này nhất định phải thực hành. Tĩnh Di lưu lại cho ta ba cái nhi tử, mặc dù Vũ Nhi Đan Điền có vấn đề. Nhưng là Phong Nhi cùng chính nhi lại là một võ một văn, đủ để thành đại sự. Từ Nguyên, thứ nhất lấy “Ám kỳ” bắt đầu thi triển a?”

Áo đen thư sinh Từ Nguyên quạt hai lần, khép lại quạt xếp mỉm cười nói: “Vương gia yên tâm, hết thảy đều là tại trong khống chế.”

“Tốt, rất tốt.” Tần Đức trong mắt tránh phát ra kinh người sát cơ.

******

Trấn Đông Vương Tần Đức chỗ thế giới là Tiềm Long Đại Lục, Tiềm Long Đại Lục diện tích to lớn, đến nay không người có thể biết rõ ràng.

Chủ yếu là Tiềm Long Đại Lục cực đông là vô biên Hồng Hoang, trong Hồng Hoang Sùng Sơn Tuấn Lĩnh, rừng cây trải rộng, trong đó có vô số yêu thú, càng là hướng chỗ sâu, yêu thú thì càng lợi hại, bởi vì chính là Tiềm Long Đại Lục bên trên “Thượng Tiên” bọn họ, cũng vô pháp thăm dò toàn bộ vô biên Hồng Hoang.

Vô biên Hồng Hoang về phía tây, chính là ba đại quốc nhà.

Sở Vương Triều, Minh Vương hướng, Hán Vương Triều, tam đại vương triều nhân khẩu cộng lại gần như chục tỷ, thổ địa diện tích càng là lớn doạ người, tam đại vương triều bên trong Sở Vương Triều là cường đại nhất, mà tại Sở Vương Triều bên trong, có mười phân đến gia tộc —— Tần gia.

Tần gia, chiếm cứ Sở Vương Triều mười hai quận Đông Vực Tam Quận, Đông Vực Tam Quận nương tựa vô biên Hồng Hoang. Cái này Tần gia truyền thừa mấy trăm năm, tại Đông Vực Tam Quận căn cơ cực kỳ thâm hậu, chính là Sở Vương Triều hoàng đế muốn đối phó, đều mười phần gian nan. Mà lại Tần gia có một đặc thù binh chủng “Liệt Hổ quân”.

Liệt hổ, toàn thân xích hồng, thân hình tương đối to lớn, là lão hổ bên trong một cái cành nhánh. Quy mô lớn nuôi dưỡng liệt hổ phương pháp, đây là Tần gia một hạng trọng yếu nhất cơ mật.

Tần gia khống chế 600. 000 đại quân, trong đó có 50, 000 chính là Liệt Hổ quân, toàn bộ Liệt Hổ quân mỗi một cái chiến sĩ đều là cưỡi “Liệt hổ” liệt hổ bản thân lực công kích liền doạ người rất, lại thêm chiến sĩ, đó càng là đánh đâu thắng đó.

Vẻn vẹn năm vạn con liệt hổ “Hổ gầm” liền có thể để địch quân sĩ khí giảm lớn. Năm vạn con Liệt Hổ quân có thể tuỳ tiện tiêu diệt hơn mười vạn phổ thông kỵ binh đại quân.

Tiềm Long Đại Lục võ lực chí cao, ba đại quốc nhà đều có trấn quốc tu tiên giả, mỗi một tu tiên giả tại phàm nhân trong mắt đều là thần tiên giống như tồn tại. Phi kiếm vừa ra, trăm ngàn dặm bên ngoài liền có thể lấy đầu người, ngự kiếm phi hành, bay lượn tại cửu thiên, loại nào không phải thần tiên thủ đoạn?

******

Vân Vụ Sơn Trang, xây dựng vào “Đông Lam Sơn” phía trên, Đông Lam Sơn lớp 12 hơn ngàn mét, cũng coi là là một tòa núi cao.

Hai năm đằng sau.

Giờ phút này Tần Vũ tám tuổi, vóc dáng cũng cao không ít, trong mắt khi thì có cơ trí quang mang lấp lóe, mà ở ánh mắt của hắn chỗ sâu nhưng lại có một tia nhàn nhạt u buồn, giờ phút này Tần Vũ Chính một thân một mình đi tại trên sơn đạo, ở tại trên bờ vai có một cái màu đen chim ưng con.

“Tiểu Hắc, hai năm, ròng rã hai năm phụ vương cũng chỉ đến xem qua ta một lần.” Tần Vũ cắn môi một cái, đối với trên vai chim ưng con nói ra.

Chim ưng con này là Tần Vũ một năm trước du lãm Đông Lam Sơn thời điểm phát hiện, liền đem cái này chim ưng con mang theo trên người, có chim ưng con làm bạn, Tần Vũ cũng sẽ không quá mức cô độc, 6 tuổi trước kia thường xuyên có phụ thân làm bạn, 6 tuổi sau ròng rã hai năm, lại chỉ gặp qua phụ thân một lần.

Hắc Ưng phẩy phẩy cánh, phủ mo Tần Vũ gương mặt non nớt, Tần Vũ lập tức cười.

Đi chỉ chốc lát, Tần Vũ chợt thấy phía trước có người đàn bà chữa phụ lại gánh lấy gỗ vụn tài gian nan đi tới, lúc này đối với Hắc Ưng nói ra: “Tiểu Hắc, chúng ta đi trợ giúp a di này được không?”

Hắc Ưng lập tức phẩy phẩy cánh, tại Tần Vũ trên bờ vai lắc lư hai lần, Tần Vũ lập tức cười phi tốc hướng phụ nữ có thai chạy tới.

“A di, ta tới giúp ngươi cõng vật liệu gỗ đi.” Tần Vũ nhìn xem phụ nữ có thai nói ra.

Phụ nữ có thai nghe được thanh âm, buông xuống trên người bó củi, xoa xoa mồ hôi trên đầu, nhìn xem rõ ràng hay là hài đồng Tần Vũ, cười nói: “Bé con, tạ ơn a, a di chính mình có thể cõng, còn có một dặm đường liền đến chúng ta thôn nhỏ.” nói liền muốn lần nữa cõng lên vật liệu gỗ tiếp tục đi tới.

“Bé con? Ta không nhỏ, ta năm nay đều tám tuổi, cái này vật liệu gỗ ta khẳng định có thể cõng.” Tần Vũ nhìn xem phụ nữ có thai mồ hôi trên mặt, vậy mà đoạt lấy vật liệu gỗ, đột nhiên một thanh cõng lên người.

Bó củi đối với người bình thường tới nói tự nhiên không nặng, thế nhưng là đối với tám tuổi hài đồng lại là rất nặng, bất quá Tần Vũ tại Vân Vụ Sơn Trang này thiên nhiên trong ôn tuyền thường xuyên cua, thân thể so với bình thường tám tuổi hài đồng cường tráng hơn nhiều, vậy mà quả thực là đeo lên.

“A di, ngươi nhìn, ta không phải cõng lên tới? Hừ, ngươi còn nói ta là bé con đâu.” Tần Vũ đắc ý nói, giờ phút này hắn cái kia non nớt khuôn mặt nhỏ lại là dính vào tro bụi, bẩn thỉu.

Phụ nữ có thai ngẩn ngơ, chợt cười nói: “Khí lực thật đúng là không nhỏ, bất quá một dặm đường đâu, oa nhi ngươi khẳng định không kiên trì được, hay là để a di tới đi.”

“Ai nói không kiên trì được.”

Tần Vũ nhìn thấy phụ nữ có thai vươn tay, cuống quít liền hướng về phía trước chạy ra đi, sau đó mới quay đầu lại nói: “A di, cái này Đông Lam Sơn ta cũng chạy rất nhiều lần, biết nơi này bên ngoài một dặm có cái thôn trang nhỏ, khẳng định là các ngươi cái kia, đi, đi mau a. Ngươi còn không có ta nhanh đâu!”

Phụ nữ có thai trên mặt cười nở hoa: “Oa nhi này, không biết là con nhà ai, có hài tử như vậy, cha mẹ hắn khẳng định thật cao hứng.”

Tần Vũ cõng cái này bó củi, ngay từ đầu không tính khó khăn, thế nhưng là đi một đoạn đường sau, Tần Vũ liền cảm thấy mình hai cái chân bắt đầu như nhũn ra, dù sao cũng là lên núi, hơn nữa còn cõng vật liệu gỗ, Tần Vũ dù cho thân thể mạnh, cũng bất quá tám tuổi mà thôi.

Sau một lúc lâu, Tần Vũ hai chân đột nhiên run lên.

“Em bé......” phụ nữ có thai giật mình.

“Không có việc gì, vấn đề này thật đơn giản.” Tần Vũ quay đầu cố gắng gạt ra dáng tươi cười nói ra, giọng nói kia hắn phảng phất là một cái đại lực sĩ một dạng, thế nhưng là đường núi bất bình, Tần Vũ dưới chân đụng phải một hòn đá, không khỏi nhoáng một cái.

“Bồng!” Tần Vũ cả người cũng không khỏi ngã xuống xuống dưới.

Phụ nữ có thai lập tức vội vàng đi lên, lấy qua vật liệu gỗ, đỡ dậy Tần Vũ. Tần Vũ giờ phút này trên mặt hoàn toàn là tro bụi, khuôn mặt nhỏ nhắn đều bẩn thỉu, Tần Vũ rất là biệt khuất nhìn về phía phụ nữ có thai nói “A di, kỳ thật...... Ta còn có thể cõng, mới vừa rồi bị một hòn đá dập đầu một chút.”

“Tốt, a di biết ngươi có thể cõng, bất quá, thôn trang ngay ở phía trước, cám ơn ngươi a.”

Phụ nữ có thai cõng lên vật liệu gỗ, nhìn Tần Vũ không có thụ thương, sau giúp Tần Vũ mặt lau sạch sẽ, liền cẩn thận dặn dò nhắc nhở một phen, đợi đến Tần Vũ đều gật đầu đáp ứng sau, lúc này mới về thôn trang.

Tần Vũ nhìn xem đang ở trước mắt khoảng trăm mét không lớn thôn trang, nhíu lại nhíu mà nói: “Tiểu Hắc, còn kém như vậy điểm đã đến.” chợt Tần Vũ lại là cười, “Bất quá a di bây giờ lại nhẹ nhõm nhiều, lập tức liền đến thôn trang.”

Tần Vũ cười rất là xán lạn, đó là phát ra từ nội tâm dáng tươi cười.

Từ một nơi bí mật gần đó ba bóng người nhìn nhau một chút, bọn hắn là âm thầm bảo hộ Tần Vũ cao thủ.

Tần Vũ thế nhưng là Trấn Đông Vương nhi tử, đường đường Tam điện hạ, làm sao có thể để hắn một người tại trong núi lớn chạy loạn đâu?

“Tam điện hạ hay là một đứa bé a, tâm lại là như thế tốt, vương gia hắn làm sao bỏ được đem Tam điện hạ ném ở Vân Vụ Sơn Trang, hai năm cũng liền đến xem một lần đâu, mỗi lần nhìn thấy Tam điện hạ đêm khuya tại đỉnh núi ngồi xuống chính là một đêm, cái kia nho nhỏ thân thể tại đỉnh núi ban đêm trong gió lạnh, ta liền trong lòng khó chịu.” một bóng người thấp giọng thở dài nói.

Một người khác ảnh cũng gật đầu nói: “Tam điện hạ mỗi lần nhìn lên bầu trời đêm, thần tình kia đều để trong nội tâm của ta mỏi nhừ, vương gia hắn...... Ai!”

“Tính toán, vương gia muốn làm gì, cũng không phải chúng ta có khả năng biết được, chúng ta bảo vệ tốt Tam điện hạ là được.”

Bỗng nhiên ——

Dưới sơn đạo một lưng hùm vai gấu, con mắt giống như như chuông đồng lớn nhỏ hắc đại hán cưỡi một đầu hung mãnh vô cùng xích hồng sắc lão hổ, cực tốc vọt tới, nhìn thấy Tần Vũ, xa xa cao giọng nói: “Tam điện hạ, đại điện hạ cùng Nhị điện hạ tới.”

“Đại ca nhị ca tới!” Tần Vũ hưng phấn hai mắt sáng lên, lập tức phi tốc hướng hắc đại hán chạy tới, leo lên lưng hổ, hưng phấn khuôn mặt đỏ lên, vội vàng thúc giục nói, “Vương Thúc, đi, đi mau a, về Vân Vụ Sơn Trang!”

Đại hán kia ôm tốt Tần Vũ, sau đó khống chế liệt hổ, cực tốc hướng phía dưới núi chạy tới, lưu lại một đạo tro bụi.  chưa xong còn tiếp ', 1),
( 1, N'Quyết Tâm', N'Chương 2: quyết tâm

Vân Vụ Sơn Trang, ở vào Đông Lam Sơn Sơn nơi hông, trên mặt nổi chính là có bên trên từng đội từng đội dũng mãnh binh sĩ tuần tra bảo hộ, vụng trộm cao thủ ngoại nhân căn bản là không có cách biết, mà lại cái này Vân Vụ Sơn Trang lại là Trấn Đông Vương sơn trang, ai chán sống tới phạm.

Vân Vụ Sơn Trang bên ngoài cửa chính, có hai to lớn sư tử đá, mà hai tên người mặc chiến giáp màu đen chiến sĩ thì là tại hai bên đại môn, quét mắt bên ngoài, bọn hắn giống như cô tùng giống như đứng ngạo nghễ, cái kia to con trên thân thể tự nhiên tản ra sát khí, đó là trải qua huyết tinh sa trường chân chính chiến sĩ mới có thể có sát khí.

“Tam điện hạ!”

Hai tên hắc giáp chiến sĩ đột nhiên một chân quỳ xuống, cung kính nói.

Tần Vũ cấp tốc từ trên lưng hổ nhảy xuống, Hắc Ưng tại Tần Vũ trên vai đi rất là ổn định, Tần Vũ giờ phút này hiển nhiên rất hưng phấn thật cao hứng, phi tốc chạy hướng trong đại môn, đồng thời đối với hai tên chiến sĩ cười hì hì nói: “Hai tên thúc thúc, mau mau đứng lên.”

Hai tên hắc giáp chiến sĩ cũng đứng lên, nhìn xem Tần Vũ xông vào trong trang viện thân ảnh nho nhỏ, trong mắt đều có một tia yêu mến.

“Hì hì, đại ca nhị ca hai người bọn họ khẳng định là tại tắm suối nước nóng.” Tần Vũ căn bản không cần suy nghĩ nhiều, bay thẳng đến Vân Vụ Sơn Trang Tây Uyển suối nước nóng chỗ chạy tới, trong miệng còn nói thầm lấy, “Hừ hừ, hai tên này không thông qua ta đường đường Vân Vụ Sơn Trang trang chủ cho phép, liền dám đến tùy ý tiến vào suối nước nóng......”

Một lát, Tần Vũ đã vọt tới Sơn Trang Tây Uyển.

Tần Vũ hai tay chống nạnh, đột nhiên tay phải một chỉ, hăng hái nộ trừng trong ôn tuyền hai người, nói “Này, hai người các ngươi thật can đảm, không thông qua bổn trang chủ cho phép, liền một mình tiến vào suối nước nóng trọng địa, a......” Tần Vũ chỉ tới kịp cao giọng thét lên một tiếng, liền bị đột nhiên đưa tay ra bỗng nhiên kéo một phát, lập tức thân hình bất ổn, hướng trong ôn tuyền ngã đi.

“Y phục của ta còn không có thoát a!” theo Tần Vũ cao giọng thét lên âm thanh, người liền đã “Bồng” một tiếng lọt vào trong ôn tuyền, tóe lên bọt nước vô số. Tần Vũ trên vai Hắc Ưng cuống quít liên tục vỗ cánh, mới may mắn không có rơi vào trong ôn tuyền, nếu không nó tương lai này hùng ưng liền muốn biến thành ướt sũng.

“Hắc hắc, Tiểu Vũ, ngươi vậy mà cùng cùng ngươi nhị ca đại ca còn phách lối, thật sự là quá phận, ngươi nhị ca cùng đại ca mỗi ngày khổ chết, Tiểu Vũ ngươi lại là mỗi ngày có suối nước nóng này cua, hơn nữa còn là Vân Vụ Sơn Trang suối nước nóng!” một tên thiếu niên rất là tức giận bất bình nói ra, bất quá trong mắt chỗ sâu lại là có mỉm cười.

“Phốc!”

Tần Vũ bỗng nhiên đem nước trong miệng phun ra, cả người đều hoàn toàn ướt đẫm, Tần Vũ tức giận nhìn trước mắt thiếu niên.

“Nhị ca, quả nhiên là ngươi, ta liền biết là ngươi, liền ngươi mới có thể kéo ta xuống nước, đại ca hắn liền không.” Tần Vũ hai ba lần thoát áo cùng quần, chỉ mặc quần cộc liền ngâm mình ở trong ôn tuyền, bất mãn nhìn xem chính mình nhị ca Tần Chính.

Tần Chính giờ phút này vẫn chỉ là một cái 12 tuổi thiếu niên, nhưng là trên mặt lại thời khắc có một cỗ nụ cười thân thiết, đối xử mọi người luôn luôn để cho người ta cảm thấy như gió xuân ấm áp, chỉ có đối mặt chính mình thân huynh đệ thời điểm, Tần Chính mới có thiếu niên vui đùa ầm ĩ.

“Ngươi nói đại ca? Ha ha, hắn đều nhanh ngủ thiếp đi.” Tần Chính cười ha ha nói ra.

“Nhị đệ, ngươi cho rằng đại ca ngươi là heo a, nhanh như vậy liền ngủ mất?” tại suối nước nóng một bên khác chính an tĩnh nhắm mắt nằm thanh niên lạnh lùng mở mắt, đối với Tần Chính nói ra, sau đó cười nhìn về phía Tần Vũ Đạo: “Tiểu Vũ, cái này Vân Vụ Sơn Trang suối nước nóng quả nhiên thần hiệu a, lần trước ta tại cái này cua một lần, trên thân vết sẹo vậy mà cạn rất nhiều, chỉ có thể nhìn thấy dấu vết mờ mờ, nếu như nhiều pha được mấy ngày, đoán chừng ta toàn thân liền giống như ngươi.”

Đây chính là Tần Vũ đại ca Tần Phong, năm nay đã 16 tuổi, bởi vì tu luyện Võ Đạo, phảng phất 18~19 tuổi bộ dáng. Đại ca Tần Phong là Tần Vũ cực kỳ sùng bái người, lần trước nhìn thấy đại ca, hắn nhưng là tận mắt thấy đại ca một quyền đem một gốc lớn bằng bắp đùi cọc gỗ đánh thành nát bấy, Tần Vũ thế nhưng là rất hâm mộ.

Nghe đại ca nói suối nước nóng thần hiệu, Tần Vũ rất là rắm thúi đứng lên, nâng cao nhỏ ngực, ngẩng lên đầu nhỏ sọ, đắc ý nói ra: “Đó là, cái này Vân Vụ Sơn Trang suối nước nóng thần hiệu còn cần nhiều lời sao, hừ, cũng không nhìn một chút Vân Vụ Sơn Trang trang chủ là ai? Thế nhưng là đệ đệ của các ngươi ta à!”

“Tiểu tử ngươi!”

Đại ca Tần Phong cùng nhị ca Tần Chính đều nở nụ cười.

Tần Vũ cùng mình đại ca nhị ca đã lâu không gặp, lẫn nhau vui đùa ầm ĩ đứng lên, bất quá Tần Phong cùng Tần Chính lại là hơi để cho điểm Tần Vũ, đợi chính mình cái này đệ đệ, Tần Phong cùng Tần Chính đều mười phần sủng ái, bọn hắn đều không có mẫu thân, tự nhiên càng thêm quan tâm đệ đệ.

Vui đùa hồi lâu, Tần Vũ cũng thoải mái trong suối nước nóng an tĩnh nằm xuống, Tần Phong cùng Tần Chính cũng nằm xuống.

“Đại ca nhị ca, các ngươi không phải đều bề bộn nhiều việc sao, làm sao có cơ hội đến ta cái này đâu?” Tần Vũ dò hỏi.

“Phụ vương hắn......” Tần Phong tựa hồ phát hiện mình nói sai lời gì, liền nói ngay, “Kỳ thật cũng không có chuyện gì, chỉ là quân đội bên kia tạm thời không có chuyện gì, ta liền trở về, phụ vương cũng cho phép, ta tìm được Nhị đệ, liền dẫn hắn cùng đi.”

Tần Chính cũng gật đầu, đối với Tần Vũ cười nói: “Đúng vậy a, ngươi nhưng không biết, ta lần này tới cũng là cố gắng mới dồn xuống thời gian, bất quá ngay cả như vậy, cũng chỉ có nửa ngày thời gian nghỉ ngơi, các loại nửa ngày sau, ta còn muốn chạy trở về.”

“Ta cũng là, nửa ngày sau, cũng phải cùng Nhị đệ cùng đi.” Tần Phong thật có lỗi nói ra.

“A, liền nửa ngày a.” Tần Vũ ứng tiếng, lộ ra có chút cô đơn, vừa mới hưng phấn nghịch ngợm hoàn toàn biến mất.

Tần Vũ liền ba cái thân nhân, phụ thân của hắn, còn có hai cái thân ca ca, phụ thân bận rộn rất, hai năm bất quá mới đến một lần, thật vất vả nhìn thấy hai cái ca ca, thế nhưng là nửa ngày sau, hắn lại phải một thân một mình, có lẽ còn có cái kia tại cạnh suối nước nóng “Tiểu Hắc”.

Tần Phong cùng Tần Chính lẫn nhau nhìn một chút, trong lòng đều là rất bất đắt dĩ.

“Đại ca, phụ vương hắn đi vô biên Hồng Hoang bên kia, có phải hay không dạy bảo ngươi rất nhiều mang binh chi pháp a?” Tần Vũ bỗng nhiên lại nở nụ cười, lập tức hỏi, “Ta biết phụ vương mang binh rất lợi hại, ngay cả gia gia thường xuyên cùng nói.”

“Đối với, phụ vương tại mang binh bên trên hoàn toàn chính xác rất lợi hại, cùng phụ vương tiến hành cờ Luzhanqi diễn luyện, ta trọn vẹn diễn luyện nửa năm, mới miễn cưỡng đạt tới phụ vương yêu cầu.” Tần Phong tựa hồ nhớ lại lúc trước thời gian, không tự giác địa đạo, “Phụ vương mang binh thật phi thường lợi hại!”

“Đại ca!” Tần Chính nhìn Tần Phong một chút, Tần Phong đột nhiên trong lòng máy động, trong lòng không khỏi cười khổ, hắn biết mình lỡ lời.

Tần Vũ tựa hồ một chút không thèm để ý, biểu hiện trên mặt lại rất hưng phấn, bắt đầu cùng Tần Chính, Tần Phong không ngừng đàm luận lẫn nhau những ngày này sự tình, ba huynh đệ liền trong suối nước nóng nói chuyện hồi lâu, sau đó nếm qua tiệc tối đằng sau, Tần Phong cùng Tần Chính lúc này mới muốn rời khỏi.

Vân Vụ Sơn Trang bên ngoài.

Tần Vũ người mặc một hắc sắc cẩm bào, nhìn phía xa Tần Phong cùng Tần Chính hai người, liên tục phất tay.

“Đại ca nhị ca gặp lại.” Tần Vũ trong mắt lóe ra không bỏ.

Tần Phong cùng Tần Chính quay đầu hướng Tần Vũ cười một tiếng, sau đó hai người liền cưỡi lên hai cái liệt hổ, sau lưng gần trăm tinh binh cũng cưỡi liệt hổ, một lát cũng đã biến mất tại trên sơn đạo, không có bóng dáng.......

Dưới sơn đạo, Tần Phong cùng Tần Chính chính cưỡi liệt hổ, sánh vai mà đi.

“Đại ca, lần này ngươi nói sai, Tiểu Vũ hắn không thích âm mưu các loại quyền mưu chi thuật, mà lại bởi vì Đan Điền vấn đề, cũng vô pháp tu luyện thành võ tướng. Như vậy, văn võ cũng không được. Phụ vương hắn đem tinh lực đều dùng tại trên người chúng ta, Tiểu Vũ lại quanh năm khó được gặp phụ vương một lần, chính mình cô độc một người, ngươi nói phụ vương cùng ngươi cờ Luzhanqi diễn luyện nửa năm, Tiểu Vũ hắn sẽ có cái gì cảm thụ?” Tần Chính đối với Tần Phong nói ra, lộ ra rất là tức giận.

Tần Phong cười khổ, nói “Nhị đệ, ta nhất thời không có chú ý, nói ra ta cũng hối hận a.”

Đột nhiên, Tần Phong sắc mặt lạnh lùng: “Nhị đệ, Tiểu Vũ hắn trời sinh Đan Điền có vấn đề, văn võ đều là không thành, không có bao nhiêu sức tự vệ, chúng ta nhất định phải bảo vệ tốt Tiểu Vũ, tuyệt đối không thể để cho hắn nhận bất luận kẻ nào khi dễ.”

“Ai dám khi dễ Tiểu Vũ, ta nhất định phải để hắn hối hận đi đến thế này!” Tần Chính trong mắt lóe lên một tia hàn quang.

Hai huynh đệ này mang theo sau lưng hộ vệ, một lát cũng đã ra Đông Lam Sơn, hướng Viêm Kinh Thành tiến đến.......

Đêm khuya, Đông Lam Sơn Sơn đỉnh phía trên.

Từng tia từng tia trong gió lạnh, một cái thân thể gầy ốm đang ngồi ở trên đỉnh núi, tại trên bả vai hắn một cái màu đen chim ưng con an tĩnh ở lại. Tần Vũ cứ như vậy nhìn xem đầy trời tinh thần, trong ánh mắt có lại là viễn siêu người đồng lứa thành thục.

Mỗi ngày một thân một mình trong thư phòng đọc sách, hoặc là một thân một mình suy nghĩ, cái này khiến Tần Vũ vượt xa tám tuổi hài đồng tư duy.

“Tiểu Hắc.” Tần Vũ bỗng nhiên lên tiếng, thế nhưng là ánh mắt lại vẫn như cũ nhìn xem ngôi sao đầy trời, Tần Vũ trên bờ vai Hắc Ưng giật giật, cặp kia con mắt đen như mực đen lúng liếng vòng vo hai lần, nhưng lại không biết nó tiểu chủ nhân vì cái gì gọi hắn.

Tần Vũ trên mặt bỗng nhiên có vẻ tươi cười, xán lạn nụ cười hạnh phúc: “Tiểu Hắc, ngươi biết không? Tại ta rất rất nhỏ thời điểm, phụ vương hắn thường xuyên ở bên cạnh ta, đối với ta cũng phi thường yêu mến, về sau cái kia mười hai cái lão sư tới, phụ thân để cho ta đi theo mười hai cái lão sư học tập, mặc dù những vật kia ta không thích học, thế nhưng là hay là cố gắng để cho mình học, để cho phụ vương hắn cao hứng. Những văn tự kia ta rất nhanh liền học xong, phụ thân còn khen ta thần đồng đâu, thế nhưng là về sau......”

Tần Vũ trầm mặc xuống.

“6 tuổi năm đó, ta nhớ được rõ ràng, tại vương phủ trong tiểu viện u tĩnh, cái kia mười hai cái lão sư nói ta cái gì không thể trở thành thượng vị giả, về sau Phong Bá Bá còn nói đan điền ta vấn đề, không cách nào tích súc nội lực, không cách nào tu luyện. Sau đó ta liền đi tới Vân Vụ Sơn Trang. Lại về sau...... Phụ vương liền không lại coi trọng ta, quan tâm ta. Lúc trước ta không biết Đan Điền ý tứ, không biết thượng vị giả ý tứ. Còn tưởng rằng phụ vương là thật để cho ta tới cái này chơi, nhưng là......”

Tần Vũ cúi đầu cắn môi một cái, trong mắt đều là u buồn: “Trong hai năm qua, ta cũng tò mò hỏi qua những cái kia Vương Thúc bọn hắn, Đan Điền cùng thượng vị giả ý tứ, ta muốn, ta hẳn là minh bạch phụ vương không còn coi trọng ta nguyên nhân.”

Tần Vũ lần nữa trầm mặc, ngửa đầu nhìn xem đầy trời tinh thần.

“Ta thật không thích những cái kia quyền mưu âm mưu sách, thật, ta đã ép buộc chính mình. Ta thật, thật rất muốn gặp đến phụ vương dáng tươi cười, muốn nghe đến phụ vương đối ta khẳng định khích lệ, thế nhưng là những cái kia âm mưu những cái kia độc ác những cái kia tâm cơ sách...... Ta, ta ép buộc chính mình, cưỡng chế chính mình nhìn, ta đều biết những cái kia tâm cơ mưu kế quyền mưu, thế nhưng là ta làm không được a! Ta làm không được, phụ vương, ta thật làm không được a!”

Tần Vũ thấp giọng khóc ồ lên, thân thể gầy yếu run rẩy lên. Một bên Tiểu Hắc đen lúng liếng con mắt nhìn chằm chằm Tần Vũ, dùng cái kia cánh nhỏ lau sạch lấy Tần Vũ mặt.

Tần Vũ nghiêng đầu nhìn về phía trên bờ vai Hắc Ưng, bỗng nhiên ôm chặt lấy Hắc Ưng, đem Hắc Ưng ôm vào trong ngực, Hắc Ưng rất an tĩnh tại Tần Vũ Hoài bên trong, tựa hồ biết tiểu chủ nhân tâm tình vào giờ khắc này: “Tiểu Hắc, ta thật muốn nghe được phụ vương khích lệ, muốn xem đến phụ vương nụ cười vui vẻ, thật rất muốn......” Tần Vũ thấp giọng lẩm bẩm lấy.......

Tại đỉnh núi chỗ tối, ba cái âm thầm bảo hộ Tần Vũ cao thủ lại là thổn thức không thôi.

Đột nhiên ——

Một đạo lưu tinh vạch phá tinh không, quang mang loá mắt, trong lúc nhất thời trong tinh không, lưu tinh quang mang siêu việt mặt khác bất luận cái gì một vì sao.

“Lưu tinh!”

Tần Vũ con mắt đột nhiên sáng lên, lúc này thả trong ngực Tiểu Hắc, đứng lên chăm chú nhắm mắt lại, hai tay hợp trước người: “Liền để phụ vương hắn quan tâm ta, liền cùng đối đãi đại ca nhị ca một dạng đi, đánh ta, trừng phạt ta, ta không sợ, chỉ cần không cần không để ý tới ta như vậy đủ rồi.”

Tần Vũ chậm rãi mở mắt, nhìn về phía viên kia đã đến thiên địa cuối lưu tinh.

“Phụ vương năm đó nói qua, tại lưu tinh trước cầu nguyện liền sẽ thực hiện, phụ vương sẽ không gạt ta, nhất định sẽ thực hiện.” nhìn xem ngôi sao đầy trời, Tần Vũ trên gương mặt non nớt có lại là kiên định.

Bỗng nhiên, Tần Vũ trong lòng một đạo linh quang sáng lên.

Tần Vũ con mắt đột nhiên phát sáng lên, bỗng nhiên vỗ đầu một cái: “A, ta thật sự là quá ngu, văn võ, văn võ, văn không thành, ta võ cũng không được a? Vương Thúc nói qua thiên hạ nội công tâm pháp vô số nhiều, nói không chừng liền có thích hợp đan điền của ta, coi như không có, chẳng lẽ luyện võ công liền nhất định cần nội công a?”

Tần Vũ dù sao vẫn chỉ là tám tuổi hài tử, mặc dù bởi vì một thân một mình nhìn rất nhiều sách, tâm trí thành thục rất nhiều, nhưng như cũ chỉ là hài tử mà thôi. Đi qua bởi vì Phong Ngọc Tử từng nói qua, Đan Điền có vấn đề, không cách nào tu luyện, cái này khiến Tần Vũ hình thành tư duy xu hướng tâm lý bình thường, giờ phút này hắn mới tỉnh ngộ tới.

Đan Điền quái dị, liền thật không cách nào tu luyện a?

“Ân, chỉ cần gắng sức, sắt mài thành kim, đạo lý này hay là phụ vương nói, chỉ cần ta cố gắng, nhất định sẽ thành công.” Tần Vũ trọng trọng gật đầu tự nhủ, trong mắt có đều là không gì sánh được tự tin, cùng vô cùng kiên định quyết tâm.

“Tiểu Hắc, chúng ta đi, trở về sơn trang đi!” Tần Vũ nói làm liền làm, trong lòng có mục tiêu, hết thảy trở nên khác biệt.

Hắc Ưng giờ khắc này ở Tần Vũ trên bờ vai tựa hồ cũng lộ ra rất là cao hứng, liên tục vẫy cánh, Tần Vũ nhảy cà tưng Triều Vân Vụ Sơn Trang chạy tới, một lát, ba đạo thân ảnh màu đen lóe lên, giống như ba đạo như khói xanh hướng Tần Vũ đuổi theo.', 2),
( 1, N'Dạ Đàm', N'Chương 3: dạ đàm

“Là ai?” Vân Vụ Sơn Trang tối sầm giáp chiến sĩ một tiếng quát lạnh, mặt khác tối sầm giáp chiến sĩ cũng nhìn về phía người ở ngoài xa ảnh, một lát cái này hai hắc giáp chiến sĩ mới nhìn rõ người tới lại là Tam điện hạ Tần Vũ, trong lòng không khỏi giật nảy cả mình, nhưng là vẫn như cũ một chân quỳ xuống, cung kính nói, “Tam điện hạ!”

Tần Vũ chạy cái trán bốc lên từng tia từng tia mồ hôi, ánh mắt lại là sáng lấp lánh, trên mặt đỏ rừng rực: “Các ngươi mau mau đứng lên đi.” nói xong đối với cái này hai hắc giáp chiến sĩ cười cười, sau đó liền nhảy nhót xông vào Vân Vụ Sơn Trang bên trong.

Cái này hai hắc giáp chiến sĩ nghi hoặc nhìn xem Tần Vũ bóng lưng.

“Tam điện hạ đi đỉnh núi nhìn tinh không, bình thường phải chờ tới ngày thứ hai hừng đông mới trở về a, lần này làm sao sớm như vậy liền trở lại?” bên trái hắc giáp chiến sĩ nghi hoặc nói.

Bên phải hắc giáp chiến sĩ cũng mê hoặc lắc đầu, hiển nhiên không biết nguyên nhân.

******

Ngay cả nói, cũng chính là Tần Vũ cái gọi là “Ngay cả gia gia” ngay cả nói là Tần gia lão nhân, bây giờ Trấn Đông Vương Tần Đức chính là ngay cả nói nuôi lớn, ngay cả nói tại Tần gia nói chuyện vẫn rất có lực ảnh hưởng. Hai năm trước, Tần Đức liền để cho ngay cả nói đến Vân Vụ Sơn Trang chiếu cố Tần Vũ.

Tần Vũ giống như một trận gió, vọt thẳng đến ngay cả nói gian phòng bên ngoài, sau đó liền lập tức vung lên nắm tay nhỏ bỗng nhiên gõ lên cửa phòng.

“Phanh!”“Phanh!”“Phanh!”“Phanh!”“Phanh!”“Phanh!”......

“Ngay cả gia gia, mở cửa nhanh, ta là Tiểu Vũ, ta có chuyện muốn cùng ngươi nói, mở cửa nhanh a.” Tần Vũ vội vàng hô hào, một lát, trong phòng đèn liền phát sáng lên, “Tiểu Vũ a, gia gia vừa mới ngủ không lâu liền bị ngươi đánh thức.” theo thân thiết thanh âm, cửa phòng mở ra.

Nhất Từ Tường sáu mươi lão nhân hất lên áo khoác xuất hiện tại Tần Vũ trước mặt.

“Ai nha, Tiểu Vũ, thế nào? Đầu đầy mồ hôi.” ngay cả nói giật mình nhìn xem Tần Vũ, Tần Vũ Cương muốn nói gì, thế nhưng là vừa rồi kịch liệt chạy để hắn một trận thở dốc, nhìn thấy Tần Vũ thở dốc như vậy gấp rút, ngay cả nói vội nói, “Đến, tới trước trong phòng, có chuyện gì vào nói.” nói liền nắm Tần Vũ nói đi vào trong phòng.

Hai người liền tại bàn vuông bên cạnh tọa hạ.

“Nghỉ ngơi một chút, đừng có gấp, các loại khí bình lại nói.” ngay cả nói nhìn thấy Tần Vũ muốn nói điều gì, nói gấp. Tần Vũ bỗng nhiên hô hấp một chút, sau đó nhìn chằm chằm ngay cả nói, mười phần kiên định nói: “Ngay cả gia gia, ta muốn tu luyện,”

“Tu luyện?” ngay cả nói nao nao, sau đó cười hỏi ngược lại, “Tiểu Vũ a, ngươi nghĩ như thế nào đến muốn tu luyện a?”

Tần Vũ có chút dừng lại, sau đó lại cười đùa đứng lên: “Không có cái gì, chỉ là nhìn sơn trang những cái kia các thúc thúc từng cái cái rất lợi hại, liền muốn tu luyện võ công. Ngay cả gia gia, ta có thể tu luyện võ công đi?”

Đối với tình thương của cha khát vọng, đây là chôn ở Tần Vũ tâm linh chỗ sâu nhất, hắn chỉ muốn chôn ở trong lòng, sau đó không ngừng cố gắng, hướng mục tiêu phấn đấu cố gắng.

“Tiểu Vũ, ngươi biết cái gì gọi là võ công a?” ngay cả nói lại là không đáp, trái lại dò hỏi.

Tần Vũ lắc đầu nói: “Ta chỉ biết là luyện võ công liền rất lợi hại, khác liền không lớn xem rõ ràng, còn giống như có nội công cái gì.” một cái tám tuổi hài tử, mặc dù nhìn không ít sách, thế nhưng là rất nhiều thứ vẫn còn không biết rõ.

“Vậy ta trước hết cẩn thận giảng giải cho ngươi một chút.” ngay cả nói cười đạo.

Tần Vũ lập tức nhãn tình sáng lên, lúc này nhìn chằm chằm ngay cả nói, tụ tinh hội thần bắt đầu nghe.

“Trước tiên nói một chút cao thủ, cao thủ chia làm ngày kia cao thủ, Tiên Thiên cao thủ cùng...... Siêu việt Tiên Thiên cao thủ các thượng tiên.” ngay cả nói cười lấy nói, “Cái này ngày kia cao thủ, Tiềm Long Đại Lục như cá diếc sang sông, vô số kể, nhưng mà Tiên Thiên cao thủ, toàn bộ Sở Vương Triều đoán chừng cũng liền không sai biệt lắm trăm người mà thôi.”

“Trăm người?” Tần Vũ giật nảy cả mình, “Sở Vương Triều không phải có kém không nhiều 4 tỷ người a, làm sao Tiên Thiên cao thủ ít như vậy, mấy chục triệu mới ra một cái?”

Ngay cả nói thở dài nói: “Ngày kia cao thủ, chỉ cần có phương pháp tu luyện liền có thể trở thành, thế nhưng là muốn trở thành tiên thiên cao thủ cấp bậc, lại gian nan rất. Muốn trở thành tiên thiên cao thủ cấp bậc, có hai cái yêu cầu: một, nhất định phải đạt tới ngày kia cảnh giới đại viên mãn. Hai, muốn đối với Thiên Đạo tự nhiên có cảm giác ngộ.”

Tần Vũ lập tức nghi ngờ: “Thiên Đạo tự nhiên, đó là vật gì a?”

Ngay cả nói lập tức nở nụ cười: “Thiên Đạo tự nhiên, đây không phải là đồ vật, mà là một loại chỉ có thể chính mình lĩnh ngộ, lại khó mà truyền miệng ý cảnh. Có người đạt tới ngày kia đại viên mãn mấy chục năm, tuy nhiên lại không cách nào cảm ngộ, đột phá một bước cuối cùng, cả đời không cách nào trở thành Tiên Thiên cao thủ, một khi trở thành Tiên Thiên cao thủ, liền đem có 500 tuổi khoảng chừng chính là tuổi thọ.”

“500 tuổi a!” Tần Vũ miệng nhỏ dáng dấp thật to.

Ngay cả nói nhìn thấy Tần Vũ đáng yêu biểu lộ, nở nụ cười: “Muốn trở thành Tiên Thiên cao thủ, như vậy gian nan, một khi trở thành Tiên Thiên cao thủ, đương nhiên tốt chỗ nhiều đi, 500 tuổi chỉ là tuổi thọ. Tiên Thiên cao thủ bản thân tiên thiên chân khí trên bản chất cũng khác biệt ở phía sau trời cao tay, hoàn toàn là hai cái cấp độ.”......

“A, ngay cả gia gia, Tiên Thiên cao thủ phía trên không phải còn có “Thượng Tiên” a, bọn hắn có bao nhiêu lợi hại?” Tần Vũ con mắt tỏa sáng.

Ngay cả Tiên Thiên cao thủ đều lợi hại như vậy, cái kia Thượng Tiên còn cao đến đâu?

“Thượng Tiên, há lại dễ dàng như vậy liền có thể thành?” ngay cả nói thở dài nói, “Thượng Tiên, chính là các quốc gia hoàng đế nhìn thấy Thượng Tiên đều phải hành lễ, xưng hô một tiếng “Thượng Tiên” lễ kính rất. Những hoàng đế này thế nhưng là sợ sệt Thượng Tiên giết bọn hắn đâu, Thượng Tiên có thể khống chế phi kiếm, chao liệng cửu thiên, căn bản không tính là phàm nhân rồi!”

“Chao liệng cửu thiên?”

Tần Vũ trong lòng tự nhiên xuất hiện một hình ảnh, chân đạp phi kiếm, bay lượn tại trên chín tầng trời, loại kia thoải mái, loại kia tuỳ tiện, không khỏi làm Tiểu Tần Vũ trong lòng rất là hướng về, không tự giác Tần Vũ trong lòng liền muốn muốn trở thành một tên Thượng Tiên.

“Toàn bộ Sở Vương Triều có gần trăm cái Tiên Thiên cao thủ, thế nhưng là...... Toàn bộ Sở Vương Triều trăm năm đều khó mà ra một cái Thượng Tiên. Mà bây giờ toàn bộ Sở Vương Triều cũng bất quá ba cái Thượng Tiên. Tam đại Thượng Tiên trong đó hai người hay là hơn ba trăm năm trước liền đã trở thành Thượng Tiên, cái này hơn 300 năm đến, cũng liền ngươi Phong Bá Bá trở thành Thượng Tiên.”

“Phong Bá Bá?” Tần Vũ nhớ lại chính mình Phong Bá Bá, cái kia toàn thân áo trắng thường ngồi tại bạch hạc phía trên Phong Bá Bá lại là Thượng Tiên?

Ngay cả nói tiếp tục nói: “Bất quá muốn trở thành Thượng Tiên, biện pháp tốt nhất là tiến về hải ngoại Tiên Đảo, bái sư học nghệ. Nhưng mà hải ngoại Tiên Đảo trừ các quốc gia Thượng Tiên, ai biết? Người bình thường có thể nhìn thấy Thượng Tiên mặt a, bọn hắn có tư cách đến hỏi Thượng Tiên tiến về hải ngoại Tiên Đảo lộ tuyến a?”

“Dù cho biết, thế nhưng là hải ngoại Tiên Đảo khoảng cách Tiềm Long Đại Lục thực sự quá xa, hàng năm Tiềm Long Đại Lục có hơn vạn người đi tìm kiếm hải ngoại Tiên Đảo muốn bái sư học nghệ. Trở nên nổi bật, nhưng mà, trong biển rộng nguy cơ ẩn núp, 1000 cái mới có thể có một cái còn sống đến hải ngoại Tiên Đảo.” ngay cả nói cảm thán nói.

Tần Vũ lập tức ánh mắt sáng lên nói: “Ngay cả gia gia, một năm không phải có mười cái đến hải ngoại Tiên Đảo, vậy làm sao Tiềm Long Đại Lục Thượng Tiên còn như thế thiếu đâu?”

Dựa theo Tần Vũ lý giải, một năm liền có mười cái Thượng Tiên, cái kia Tiềm Long Đại Lục không phải có rất nhiều Thượng Tiên?

Thế nhưng là toàn bộ Tiềm Long Đại Lục Thượng Tiên cũng rất ít, mấy trăm năm hơn ngàn năm tích lũy, vẫn chưa tới mười cái.

“Đến hải ngoại Tiên Đảo liền có thể trở thành Thượng Tiên a?” ngay cả nói lắc đầu nói, “Thượng Tiên đó là cỡ nào khó lường, lại thế nào khả năng người người đều có thể tu luyện thành đâu? Chính là nói cho ngươi phương pháp tu luyện, trong ngàn người mới vừa có một người có cái kia tư chất tu luyện.”

“A, vậy không phải nói, những cái kia đi hải ngoại Tiên Đảo người, một năm mới có mười cái còn sống đến, không sai biệt lắm trăm năm mới có thể ra một cái có thể tu luyện thành Thượng Tiên?” Tần Vũ lập tức cảm thấy trở thành Thượng Tiên độ khó to lớn.

Ngay cả nói bỗng nhiên đứng lên, nhìn về phía ngoài cửa sổ.

“Thượng Tiên? Cỡ nào chói mắt danh tự a. Toàn bộ đại lục vô số cao thủ đều đang vì nó điên cuồng, vô số cao thủ đều muốn trở thành Thượng Tiên. Phi kiếm vừa ra, giết người ở ngoài ngàn dặm, đây là thần thông bực nào?” ngay cả nói trong mắt có một tia khát vọng, sau đó thì cảm thán nói, “Chính là phụ vương của ngươi, cũng thời khắc muốn có được một cái Thượng Tiên trợ giúp, nếu như lại có một cái Thượng Tiên trợ giúp phụ vương của ngươi, phụ vương của ngươi mục tiêu có lẽ liền có thể thực hiện.”

Tần Vũ đột nhiên run lên trong lòng.

“Phụ vương mục tiêu?” đồng thời một dòng nước ấm chảy khắp Tần Vũ toàn thân, Tần Vũ lập tức toàn thân tràn đầy nhiệt tình, “Nếu như ta tu luyện, trở thành một tên Thượng Tiên, đoán chừng phụ vương sẽ rất cao hứng đi, đến lúc đó, ta cũng có thể trợ giúp cho phụ vương.”

Nghĩ đến chính mình trở thành Thượng Tiên, có thể giúp chính mình phụ vương, còn có thể đạt được phụ vương cái kia khen ngợi cùng coi trọng, Tần Vũ viên kia cô độc, khát vọng tình thương của cha tâm liền nóng lên.

“Vì phụ vương, ta nhất định phải trở thành Thượng Tiên.” Tần Vũ cắn môi một cái, trong mắt lóe lên kiên định quang mang.', 3),
( 1, N'phụ tử', N'Chương 4: phụ tử

Đêm đã khuya, ngoài phòng hàn phong gào thét, mà trong phòng Tần Vũ kích động toàn thân nóng bỏng.

“Ngay cả gia gia, nói cho ta biết tu luyện như thế nào, ta muốn tu luyện, ta nhất định tu luyện thành Thượng Tiên, dù cho không thành được Thượng Tiên, cũng muốn tu luyện thành Tiên Thiên cao thủ!” Tần Vũ trong mắt phát ra kiên định cực kỳ quang mang.

Tần Vũ trong lòng đã bắt đầu vẽ phác thảo tương lai tràng cảnh, hắn thậm chí có thể tưởng tượng hắn phụ vương nhìn hắn khen ngợi ánh mắt.

Hắn cần không phải mặt khác, chỉ là tình thương của cha mà thôi. Phụ thân khen ngợi, phụ thân mỉm cười, thậm chí phụ thân phê bình hoặc là trừng phạt, đều sẽ để Tần Vũ trong lòng cảm thấy tình thương của cha tồn tại, hắn cần vẻn vẹn tình thương của cha mà thôi.

Hiện tại, hắn tìm được phương pháp, một lần nữa tìm về tình thương của cha biện pháp. Đó chính là cố gắng tu luyện, cùng đại ca Tần Phong một dạng, trở thành một cái dũng mãnh gan dạ võ giả, một cái thực lực cường hãn võ giả, thậm chí...... Siêu việt phàm nhân tồn tại Thượng Tiên.

Tần Vũ chờ mong nhìn xem Liên Ngôn.

“Tiểu Vũ.” Liên Ngôn trong lòng bất đắc dĩ, nhưng lại không thể không nói, đành phải như nói thật đạo, “Muốn trở thành Tiên Thiên cao thủ, nhất định phải tu luyện nội công, nội công từ Hậu Thiên cảnh giới đột phá đến tiên thiên cảnh giới. Thế nhưng là ngươi trời sinh đan điền không cách nào tích súc nội lực, tu luyện như thế nào nội công? Thì như thế nào trở thành Tiên Thiên cao thủ đâu?”

“Đan điền ta là có vấn đề, thế nhưng là Vương Thúc bọn hắn đã từng nói thiên hạ nội công tâm pháp nhiều dọa người, nói không chừng liền có một loại ta có thể tu luyện a. Dù cho ta không có khả năng tu luyện nội công, không phải còn có ngoại công sao, ta làm theo có thể trở thành Tiên Thiên cao thủ a!” Tần Vũ vội vàng nói.

Hắn tuyệt đối không thể chịu đựng chính mình không trở thành cao thủ.

Bởi vì...... Tại hắn cái này tám tuổi hài đồng thuần khiết trong lòng, đây là duy nhất có thể tìm về tình thương của cha biện pháp.

“Ngoại công? Ngoại công chỉ là không ngừng dùng các loại phương pháp đến rèn luyện thân thể mà thôi, để lực lượng của thân thể càng mạnh, thân thể tốc độ càng tăng nhanh hơn mà thôi, đây bất quá là tiểu đạo, từ cổ chí kim, dù cho trời sinh thần lực nhân vật, dù cho thân thể rèn luyện lợi hại hơn nữa, cũng chưa từng có một người có thể dựa vào ngoại công đạt tới tiên thiên cảnh giới, tu luyện ngoại công rèn luyện thân thể, căn bản không có khả năng trở thành Tiên Thiên cao thủ.” Liên Ngôn không muốn để cho Tần Vũ làm chuyện vô ích, nói thẳng.

“Một cái cũng không có sao? Không có chút nào hi vọng sao?” Tần Vũ trong lòng khẽ giật mình, sắc mặt lập tức trắng bệch.

Hy vọng cuối cùng đều biến mất, Tần Vũ trong lòng cảm thấy từng đợt lạnh buốt.

Nhìn xem sắc mặt trắng bệch Tần Vũ, Liên Ngôn cảm thấy mình một trận đau lòng: “Hắn hay là hài tử a!”

Liên Ngôn lúc này vội vàng nói, “Tiểu Vũ, kỳ thật ngoại công cũng rất lợi hại, ngoại công thứ nhất là bắp thịt lực lượng, lực bền bỉ rất dài. Không giống nội lực nhanh như vậy tiêu hao sạch. Còn có......” Liên Ngôn vì an ủi Tần Vũ, trong não không ngừng nghĩ đến ngoại công chỗ tốt, nghe được Liên Ngôn nói tới, Tần Vũ trong mắt lại có một chút ánh sáng.

“Còn có, ngoại công mặc dù khó mà rèn luyện, nhưng là thân thể dù sao cũng là một người căn bản nhất. Liệt Hổ quân bên trong có một trời sinh thần lực đại hán, chỉ dựa vào ngoại công khổ luyện công pháp, liền có thể một tay giơ lên 800 cân ụ đá.”

“800 cân? Một tay?” Tần Vũ trong lòng hi vọng lần nữa dấy lên, hắn có thể tưởng tượng mạnh như thế khí lực, giơ một lưỡi búa lớn chém người, còn không phải gặt lúa mạch một dạng đơn giản.

“Đối với, 800 cân, một bàn tay liền có thể giơ lên 800 cân ụ đá, vũ khí của hắn chính là một cái độc cước đồng nhân, ở trên chiến trường, chính là Tiên Thiên tiền kỳ cao thủ, cũng không có hắn dũng mãnh, cái kia độc cước đồng nhân vung lên, liền nện địch nhân ngã xuống một mảng lớn a.” Liên Ngôn không ngừng nói ngoại công chỗ tốt.

Rốt cục, Liên Ngôn làm ra tổng kết: “Cái này ngoại công mặc dù không người có thể tu luyện thành Tiên Thiên cao thủ, nhưng là tu luyện tới ngày kia cực hạn, thân thể đạt tới cực hạn, uy lực cũng rất kinh khủng, không kém gì Tiên Thiên tiền kỳ cao thủ.”

Liên Ngôn nhìn thấy Tần Vũ sắc mặt lại tốt nhìn, lúc này mới tối xuỵt một hơi, hắn nhưng là nhìn xem Tần Vũ lớn lên, biết Tần Vũ tính nết.

“Ngoại công tu luyện tới ngày kia cực hạn, liền có thể cùng Tiên Thiên tiền kỳ cao thủ so sánh a?” Tần Vũ hỏi lại lần nữa.

Liên Ngôn liên tục gật đầu, lúc này, hắn làm sao dám phủ nhận đâu? Đoán chừng hắn lay động đầu, Tần Vũ trong lòng sẽ càng thêm khổ sở đi.

“Ngay cả gia gia, ngươi nói, đi qua từ xưa tới nay chưa từng có ai đem ngoại công tu luyện tới tiên thiên cảnh giới?” Tần Vũ dò hỏi, Liên Ngôn tâm thần bất định nhẹ gật đầu, mà Tần Vũ lại là hưng phấn lên, vung quyền đầu đạo, “Tốt, đi qua từ xưa tới nay chưa từng có ai tu luyện tới tiên thiên cảnh giới, vậy ta liền nhất định phải!”

Liên Ngôn lập tức ngạc nhiên.

“Đi qua không có người có thể, không có nghĩa là liền nhất định không có khả năng. Ta tin tưởng ta chính mình!” Tần Vũ ánh mắt tản mát ra sáng rực quang mang.

Liên Ngôn cười khổ.

Ngoại công?

Vậy tu luyện đứng lên, thế nhưng là so tu luyện nội công cần phải khổ bên trên vô số lần, ngoại công chính là rèn luyện thân thể, muốn đạt tới thân thể cực hạn, các loại rèn luyện phương pháp, tuyệt đối để thân thể kinh lịch vô số lần thuế biến, loại đau khổ này cũng không phải người bình thường có khả năng tiếp nhận.

Liên Ngôn làm sao bỏ được Tần Vũ thụ loại kia khổ.

“Tiểu Vũ, ngoại công khổ luyện công phu, thế nhưng là khổ nhiều, so mỗi ngày đánh lên 100 roi đều muốn thống khổ chứ. Ngươi cũng là Trấn Đông Vương nhi tử, có người bảo hộ ngươi, không cần ăn lớn như vậy khổ.” Liên Ngôn khuyên, hắn thật không đành lòng nhìn xem nhỏ như vậy hài tử chịu khổ.

Tần Vũ chậm rãi lắc đầu.

“Không!” trong miệng nói ra một chữ, lại là không có chút nào thương thảo chỗ trống.

Liên Ngôn trong lòng bất đắc dĩ: “Cái này người Tần gia làm sao đều như vậy đâu, mặc kệ bên ngoài như thế nào, căn bản nhất tâm tính đều là kiên định không thôi, cả đám đều quyết định mục tiêu tuyệt không quay đầu, phụ thân hắn là như thế này, hiện tại hắn cũng là dạng này.”

Tần Vũ bỗng nhiên nhoẻn miệng cười, hắn biết hắn ngay cả gia gia là quan tâm hắn.

“Ngay cả gia gia, đừng lo lắng, nói không chừng còn có nội công tâm pháp ta có thể tu luyện, ngươi tìm thêm một chút nội công tâm pháp để cho ta thử một chút, nếu quả như thật không cách nào tu luyện nội công, ta lại tu luyện ngoại công không muộn a.” Tần Vũ đi đến Liên Ngôn bên cạnh, ôm Liên Ngôn bả vai nói, “Ngay cả gia gia, không nên lo lắng, trong sơn trang thế nhưng là có thầy thuốc giỏi nhất, các loại cao thủ, còn có thần kỳ suối nước nóng, ngươi lo lắng làm gì chứ?”

Liên Ngôn sờ lên Tần Vũ đầu, trên mặt có một tia nụ cười hiền lành.

Hắn tự nhiên biết Tần Vũ là không muốn để cho hắn lo lắng.

“Tốt, Tiểu Vũ, trở về ngủ đi, vấn đề này giao qua ta.” Liên Ngôn Thuyết Đạo.

Tần Vũ chợt ngẩng đầu lên nói: “Ngay cả gia gia, còn có ngươi giúp ta tìm thêm một chút tu luyện ngoại công cao thủ đến, có người chỉ đạo hẳn là tương đối tốt.”

“Yên tâm, gia này gia biết.” Liên Ngôn cười nói, Tần Vũ lập tức cười, “Đi” một tiếng thân mật hôn một chút Liên Ngôn mặt, sau đó liền nhảy cà tưng chạy ra ngoài cửa, còn gọi một tiếng, “Ngay cả gia gia ngủ đi, ta cũng trở về đi ngủ!”

Vừa dứt lời, người đã ra gian phòng.

Liên Ngôn lúc này lấy ra bút lông cùng giấy, viết lên thư......

******

Viêm Kinh Thành, vương phủ Tần Đức trong thư phòng.

Tần Đức Chính đứng trong thư phòng, ngửa đầu nhìn ngoài cửa sổ, giờ phút này đã Lê Minh.

Toàn thân áo đen thư sinh Từ Nguyên đi đến, trong tay chính cầm một phong thư, đi đến Tần Đức bên cạnh, cười nói: “Vương gia, đây là Liên Bá hắn chim bồ câu truyền đến là thư, là có liên quan tại Tiểu Vũ đứa nhỏ này, ngươi xem một chút đi.”

Tần Đức tiếp nhận thư, cứ như vậy một mực nhìn lấy nội dung trong đó, trong mắt tản ra phức tạp quang mang, hồi lâu vậy mà không để xuống sách trong tay tin.

“Vương gia......” Từ Nguyên nhỏ giọng hô, Tần Đức Đốn lúc tỉnh táo lại, lúc này một đạo hỏa diễm khí kình từ trong tay toát ra, vậy mà trực tiếp đem thư cho thiêu đốt thành tro tàn, sau đó hay là lãnh khốc bộ dáng, bình tĩnh nói: “Từ Nguyên, đem trong vương phủ các loại nội công bí tàng cùng ngoại công bí tịch, đều lấy một dành riêng, đưa đến Vân Vụ Sơn Trang đi.”

Từ Nguyên lấy làm kinh hãi, hắn nhưng là biết Tần Vũ không cách nào tu luyện nội công, hắn cũng biết những này nội công bí tàng là như thế nào trân quý, dù cho cùng Sở Vương hướng trong hoàng cung bí tàng so sánh, Trấn Đông Vương nội công bí tàng còn muốn trân quý nhiều.

Đem nhiều như vậy bí tàng cho một cái không cách nào tu luyện nội công Tần Vũ, không phải lãng phí sao?

“Vương gia, toàn bộ? Ngay cả « Tổ Long Quyết » cùng một chỗ sao? Tiểu Vũ hắn lại không cách nào tu luyện nội công......” Từ Nguyên hỏi lại lần nữa.

“Không có nghe được lời của ta mới vừa rồi sao?” Tần Đức lãnh đạm nói, Từ Nguyên liền gật đầu, không nói thêm lời, hắn có thể phát hiện giờ phút này Tần Đức có tâm sự, cũng có thể đoán ra giờ phút này Tần Đức tâm tình.

“Còn có......” Tần Đức có chút hô một hơi, “Vũ Nhi hắn không phải muốn tu luyện ngoại công cao thủ sao, đem Liệt Hổ quân bên trong tam đại ngoại công cao thủ đều dẫn đi, còn có, tại Đông Vực Tam Quận tìm kiếm ngoại công cao thủ, đều dẫn đi.”

“Là!” Từ Nguyên tuân mệnh đạo.

Tần Đức Đốn bỗng nhiên, bỗng nhiên nói ra: “Từ Nguyên, truyền lệnh cho vô biên Hồng Hoang, để Triệu Vân Hưng tướng quân cũng đi Vân Vụ Sơn Trang đi, nếu như Vũ Nhi tuyển hắn làm lão sư, hắn liền ở tại Vân Vụ Sơn Trang một năm đi.”

“Triệu Vân Hưng tướng quân?” Từ Nguyên lấy làm kinh hãi.

Tần Đức nhẹ gật đầu, sau đó liền muốn đi ra thư phòng, Từ Nguyên bỗng nhiên lên tiếng nói: “Vương gia, lần này về Viêm Kinh Thành, liền không đi Vân Vụ Sơn Trang nhìn xem Tiểu Vũ sao, lần trước nhìn Tiểu Vũ, hay là hơn một năm trước, chúng ta là không phải gạt ra một ngày thời gian đi một chuyến đâu?”

Tần Đức thân thể dừng lại, bình tĩnh nói: “Không cần.” sau đó liền trực tiếp ra thư phòng, Từ Nguyên nhìn xem Tần Đức bóng lưng, lắc đầu thở dài một tiếng: “Chẳng lẽ người Tần gia đều là như vậy sao? Mỗi một cái đều là như vậy cố chấp. Vì lúc trước lời thề, ngay cả tình phụ tử cũng không để ý sao?”

Từ Nguyên thở dài một tiếng, cũng theo đó ra thư phòng, chỉ để thư lại phòng dưới mặt đất đã bị thiêu đốt thư tro tàn. ', 4),
( 1, N'công pháp tu luyện bí tàng', N'Chương 5: công pháp tu luyện bí tàng

Trời sáng khí trong, Vân Vụ Sơn Trang Tây Uyển Ôn Tuyền chỗ.

“A, thật sự là dễ chịu a!”

Tần Vũ mặc một cái quần cộc liền nằm trong suối nước nóng, mặc kệ là mùa đông hay là mùa hè, trong suối nước nóng đều không cần lo lắng nhiệt độ, Vân Vụ Sơn Trang suối nước nóng không giống với mặt khác suối nước nóng, có thần kỳ công hiệu, theo một chút Y Đạo cao thủ nghiên cứu nói, suối nước nóng này bên trong có không ít đối với thân thể có chỗ tốt vật chất.

“Tiểu Hắc, ngươi thì xuống đây đi!” Tần Vũ đột nhiên đưa tay, bắt lại “Tiểu Hắc” đem vào trong ôn tuyền.

Lập tức “Tiểu Hắc” một trận dồn dập vỗ cánh, đáng tiếc đợi đến nó trốn tới, nó đã lông vũ đều ướt, chân chính biến thành một cái ướt sũng, “Tiểu Hắc” trên thân chảy xuống nước, “U oán” nhìn xem Tần Vũ, tựa hồ đang trách cứ tiểu chủ nhân trêu đùa nó.

Nhìn thấy “Tiểu Hắc” bộ dáng, Tần Vũ lập tức ngửa đầu phá lên cười: “Ha ha, Tiểu Hắc, ngươi thật đáng yêu a, đến, cùng ta cùng một chỗ tắm suối nước nóng đi, rất thoải mái. Ngươi về sau thế nhưng là chao liệng cửu thiên hùng ưng, ngươi có thể lên trời, cũng muốn có thể xuống nước a, nếu không quá vô dụng đi.”

Tần Vũ mở ra Tiểu Hắc trò đùa, Tiểu Hắc lại là phe phẩy cánh, đem giọt nước trên người cho phiến rơi, còn nhìn chằm chằm Tần Vũ, tựa hồ rất là bất mãn.

“Tiểu Vũ a.” ngay cả nói cười mị mị từ Tây Uyển hành lang đi tới, vòng qua núi giả xuất hiện tại Tần Vũ trước mắt, Tần Vũ rơi quay đầu lại, lúc này xán lạn nở nụ cười: “Ngay cả gia gia.”

“Ta phải nói cho ngươi một tin tức tốt.” ngay cả nói thần thần bí bí nói, Tần Vũ lập tức trong lòng một trận kinh hỉ, “Tin tức tốt? Chẳng lẽ phụ vương hắn đã đến rồi sao?” trong lòng nghĩ như vậy, nhưng là Tần Vũ nhưng không có nói ra, hắn khát vọng nhìn xem ngay cả nói.

Ngay cả Ngôn Tiếu Đạo: “Ngươi muốn các loại bí tịch đã đến.”

Tần Vũ trong lòng thoáng có chút thất vọng, nhưng là tâm tình từ thất vọng bên trong khôi phục như cũ thời điểm, Tần Vũ liền đột nhiên từ trong ôn tuyền nhảy ra ngoài, hai ba lần chỉ mặc quần áo, trong mắt tràn ngập hưng phấn: “Ngay cả gia gia, mau dẫn ta đi đến, bí tịch ở nơi nào?”

Không có người có thể giúp chính mình, chỉ có chính mình khắc khổ cố gắng.

“Đi theo ta.” ngay cả nói cười lấy phía trước dẫn đường, Tần Vũ trong lòng kích động đi theo ngay cả nói sau lưng, nhưng trong lòng thì hạ quyết tâm. Đi qua Tần Vũ qua ngơ ngơ ngác ngác, vô sự chính là trong thư phòng đọc sách, hoặc là đêm khuya nhìn tinh không, hoặc là tắm suối nước nóng, cùng Tiểu Hắc chơi đùa.

Nhưng là thời khắc này Tần Vũ trong lòng có mục tiêu, cả người đều có nhiệt tình, ngay cả khí chất đều trở nên không giống với.

Vân Vụ Sơn Trang, Bắc Uyển mật thất dưới đất trong đám.

Mật thất dưới đất bầy có vài chục cái mật thất, ngay cả nói mang theo Tần Vũ đi vào bên trong một cái mật thất, trong mật thất này, chỉ có một cái giường, một bàn dài, một cái ghế cùng với khác sinh hoạt hàng ngày vật dụng mà thôi, lộ ra rất là giới thiệu vắn tắt.

Giờ phút này bàn dài phía trên, chính để đó một tinh trí cái rương màu đen.

“Tiểu Vũ, những bí tịch kia ngay tại trong cái rương này.” ngay cả nói chỉ vào cái rương màu đen nói ra, Tần Vũ nghe chút, lập tức nhãn tình sáng lên, liền xông lên phía trước muốn mở ra cái này cái rương màu đen. Hành động này lại là dọa ngay cả nói nhảy một cái.

“Tiểu Vũ, mở ra cái khác!” ngay cả nói tay phải đột nhiên như là như ảo ảnh lóe lên, vậy mà một phát bắt được Tần Vũ xách lên, sau đó phóng tới phía sau hắn, hết sức nghiêm túc đạo, “Tiểu Vũ, cái rương này không phải bình thường cái rương, cũng không thể lái như vậy!”

Tần Vũ nghi ngờ nhìn xem ngay cả nói.

“Tiểu Vũ ngươi quá nhỏ, còn không hiểu được những bí tịch này trân quý a.” ngay cả nói lắc đầu cười nói, “Ngươi cũng đã biết, những bí tịch này trình độ trân quý thậm chí vượt qua Sở Vương hướng hoàng cung bí tàng. Cho nên cái rương này cấu tạo cũng kỳ lạ rất, cưỡng ép mở ra hoặc là tùy ý mở ra, đều sẽ hủy đi trong đó bí tịch.”

Nói, ngay cả nói tay như là huyễn ảnh, trong nháy mắt liên tiếp điểm cái rương mười hai lần, mỗi một lần đều là khác biệt vị trí.

“Bồng!” một tiếng, trên cái rương vậy mà xuất hiện một lỗ đút chìa khóa.

Tần Vũ mở to hai mắt nhìn, hắn có thể nhớ tinh tường, vừa rồi cái rương nhưng không có lỗ đút chìa khóa, hắn còn tưởng rằng cái rương này cùng mặt ngoài một dạng, chỉ là phổ thông cái rương là hợp đóng loại hình mà thôi, không nghĩ tới trong đó cấu tạo kỳ lạ phi thường.

“Dù cho người khác đoạt đi, cũng vô pháp tìm tới lỗ đút chìa khóa, mà lại cũng không có chìa khoá.” ngay cả nói lời lấy lấy ra một thanh chìa khoá màu vàng, vươn vào lỗ đút chìa khóa bên trong, theo “Răng rắc” một tiếng, cái rương tự động mở ra.

Tần Vũ lúc này đưa qua đầu nhìn lại.

Nhìn một cái, cái rương màu đen bên trong có từng quyển từng quyển cực mỏng thư tịch, mỗi một bản thư tịch không sai biệt lắm chỉ có mười mấy trang, thiếu chỉ có vài trang, dầy nhất cũng chỉ có hơn 20 trang mà thôi, nhưng là như vậy mỏng sách, toàn bộ cái rương vậy mà đổ đầy.

“Trong này nội công bí pháp đều là đỉnh cấp, có 68 bản bí tịch, còn có 28 chủng ngoại công bí tịch. Tiểu Vũ, về sau ngươi muốn nhìn những bí tịch này, nhất định phải đến mật thất đến, quyết không thể xuất ra đi. Biết không?” ngay cả nói sắc mặt nghiêm túc, đối với Tần Vũ nói ra.

Tần Vũ khẳng định nhẹ gật đầu.

“Tốt, ngươi 6 tuổi trước đó liền nhận biết chữ, hai năm qua cũng nhìn rất nhiều thư tịch, những bí tịch này chính ngươi cũng có thể xem hiểu, ngươi từ từ xem đi, gia gia liền đi trước.” ngay cả nói cười nói đạo, sau đó liền rời đi mật thất.

Đợi đến trong đêm rời đi, Tần Vũ một người thì là đem từng quyển từng quyển bí tịch đều mang tới, đều đặt ở trên mặt bàn, tổng cộng 96 bản bí tịch, đem bàn dài đều đổ đầy.

Nhìn trước mắt bí tịch, Tần Vũ trong mắt tản mát ra trước nay chưa có quang mang.

« Hoàng Hạc Phú » « Bách Cú Chương » « Kim Đỉnh Ca » « Thải Kim Ca » « Thủy Nguyên Chú »......

Từng quyển từng quyển nội công bí tịch, mỗi một bản xuất ra đi đều là để đám võ giả điên cuồng bí tịch, Tần gia bắt nguồn xa, dòng chảy dài, chính là tam đại vương triều bí tịch đều lấy ra, cũng vô pháp cùng Tần gia so sánh, Tần gia những bí tịch này có không ít đều thất truyền mấy trăm năm sao.

“« Tổ Long Quyết » giống như khi còn bé phụ thân để cho ta nhìn qua a?” Tần Vũ nhìn xem cuối cùng nguyên bản mỏng nhất bí tịch, đồng dạng vật liệu lại là trân quý nhất, « Tổ Long Quyết » dùng giấy vàng viết, thậm chí “Tổ Long Quyết” ba chữ to này đều cho người ta một loại cảm giác áp bách.

Nhìn qua 68 bản đỉnh cấp nội công công pháp, Tần Vũ vừa nhìn về phía 28 chủng ngoại công bí tịch.

« Thiết Sa Chưởng » « Đại Lực Kim Cương Chưởng » « Long Trảo Thủ » « Thiết Bố Sam » « Kim Cương Tráo » « Thập Tam Thái Bảo khổ luyện » « Bá Vương Thần Quyền »......

28 chủng ngoại công bí pháp, từng cái bày ra tại Tần Vũ trước mắt.

Đi đầu, Tần Vũ liền tùy ý cầm lấy một bản bắt đầu từ từ lật nhìn đứng lên, ở trong mật thất, Tần Vũ hết sức chăm chú bắt đầu lật xem Tần gia trải qua không biết bao nhiêu thay mặt thu thập các loại trân quý tu luyện bí tịch......', 5),
( 1, N'lựa chọn duy nhất', N'Chương 6: lựa chọn duy nhất

Trong mật thất, Tần Vũ cưỡi ngựa xem hoa đọc nhanh như gió tùy ý xem lấy, 28 bản ngoại công bí tịch Tần Vũ vẻn vẹn một canh giờ liền hoàn toàn xem mấy lần.

“Ngay cả gia gia nói không sai, cái này ngoại công tu luyện giống như thật rất khổ.” Tần Vũ trên khuôn mặt nhỏ kia cau mày.

Nhìn 28 bản bí tịch, Tần Vũ hắn đối với ngoại công tu luyện có nhất định hiểu rõ, ngoại công tu luyện, chính là dùng các loại phương pháp cố gắng để lực lượng cơ thể càng mạnh, đó là không ngừng rèn luyện, vượt qua mệt nhọc cực điểm, không ngừng siêu việt cực hạn.

Nội công tu luyện, bất quá là hấp thu thiên địa linh khí mà thôi, lúc tu luyện không có cái gì đau xót, ngược lại tu luyện sau thần thanh khí sảng. Mà ngoại công lại là đào móc thân thể cực hạn, để thân thể chịu đựng trình độ lớn nhất ma luyện, thống khổ gian nan cực kỳ. Đó căn bản là tương phản hai cái phương pháp tu luyện.

Ngoại công, khổ, mệt mỏi, hơn nữa còn không cách nào trở thành Tiên Thiên cao thủ. Bình thường chỉ có bình dân, không có bất kỳ cái gì bối cảnh người nghèo mới có thể lựa chọn tu luyện ngoại công, chân chính con em thế gia bình thường đều là tu luyện nội công, thế nhưng là Tần Vũ đâu?

Có 68 bản đỉnh cấp nội công công pháp, mỗi một bản đều là cực kỳ khó lường, thế nhưng là hắn có thể luyện sao?

“Xem trước một chút nội công tâm pháp, mặc dù đan điền của ta hơi đặc biệt, nhưng là nói không chừng có cái gì nội công tâm pháp có thể tu luyện.” Tần Vũ mang một tia may mắn, liền đầy cõi lòng hi vọng mở ra bí tịch, xem xét hắn liền ngây người.

Huyệt Thần Đình, huyệt Bách Hội, huyệt Phong Trì, huyệt Kỳ Môn...... Tam tiêu thủ thiếu dương chi mạch, thủ thái âm, thận túc thiếu dương chi mạch......

“Cái này......” Tần Vũ trợn tròn mắt.

Hắn là nhìn qua không ít sách, cũng nghe qua những danh từ này, thế nhưng là mấu chốt là...... Hắn biết huyệt Phong Trì, nhưng là không biết huyệt Phong Trì trên cơ thể người vị trí nào a. Những sách vở kia bên trên mặc dù có hình ảnh, thế nhưng là cũng chỉ là sơ lược hình ảnh, chỉ có mấy đầu đường cong mà thôi.

Nội công này cũng không thể luyện chơi, khí nhập lộn đường, có thể ảnh hưởng đến tính mạng.

“Xem ra trước muốn tìm đi thư phòng cẩn thận học tập một chút có quan hệ kinh mạch thư tịch, chí ít tìm hiểu được kinh mạch huyệt vị.” Tần Vũ Tiểu trên mặt có chỉ là bất đắc dĩ, sau đó liền đem những thư tịch này cất kỹ, liền ra mật thất.

Sau sáu ngày.

Tần Vũ lần nữa tiến nhập mật thất.

“Hắc hắc, lần này ta thế nhưng là lòng tin mười phần, 68 bản trước từng quyển từng quyển tới thử nghiệm, nhìn bản nào có thể tu luyện.” Tần Vũ khắp khuôn mặt là hưng phấn, dù sao Tần Vũ cũng chỉ là một cái tám tuổi hài đồng, thường xuyên sẽ làm cao thủ mộng.

Nghiên cứu kinh mạch huyệt vị sáu ngày, vì hoàn toàn tìm hiểu được hiểu rõ, Tần Vũ còn để Vân vụ sơn trang hạ nhân đặc biệt làm một cái mộc nhân, còn để Vân vụ sơn trang chuyên môn phối hữu một tên Y Đạo cao thủ Ông Nhàn lão tiên sinh, đem kinh mạch huyệt vị chờ chút đều ghi rõ xem rõ ràng.

Kết hợp thư tịch, mộc nhân, lại trải qua thường hỏi thăm Ông Nhàn lão tiên sinh, Tần Vũ rốt cục lòng tin mười phần mà chuẩn bị bắt đầu tu luyện nội công.

“Bản thứ nhất tu luyện cái nào đâu? Liền cái này đi, « Thủy Kinh Chú ».” Tần Vũ tự nhủ tùy ý lựa chọn một bản bí tịch, cái này « Thủy Kinh Chú » mấy trăm năm trước rất là nổi danh, bất quá bây giờ đã không có bao nhiêu người biết bộ này đỉnh cấp công pháp tu luyện.

Tần Vũ dựa theo phương pháp tu luyện, khoanh chân ngồi xuống, bắt đầu tu luyện.

Tu luyện nội công bước đầu tiên là muốn có khí cảm, có thể cảm thấy mình hấp thu cái kia một tia cực ít cực ít thiên địa linh khí, trên thực tế người sống trên đời vẫn vô ý thức hấp thu thiên địa linh khí, thế nhưng là bởi vì số lượng quá ít, căn bản không cảm giác được.

Tu luyện, chính là có ý thức hấp thu, tận lực hấp thu càng nhiều hơn.

Một lúc lâu sau, Tần Vũ Tâm cũng loạn, không tiếp tục kiên trì được.

“Khí cảm, khí cảm, ngay cả gia gia nói thiên tư tốt, vừa tu luyện liền có khí cảm, ta đều tu luyện một canh giờ, làm sao đều không có một chút khí cảm?” Tần Vũ khắp khuôn mặt là bất đắc dĩ, khoanh chân ngồi lâu như thế, chân đều tê.

Đứng dậy hoạt động một hồi, Tần Vũ lại lần nữa tĩnh tọa tu luyện « Thủy Kinh Chú ».......

Hai ngày sau đó.

Tần Vũ ăn xong điểm tâm, lại tiếp tục tới tu luyện, Tần Vũ rất cố chấp, hắn một mực tu luyện « Thủy Kinh Chú » thiên thứ nhất, trên thực tế vẻn vẹn cảm thụ khí cảm, dùng bản nào nội công bí tịch căn bản không có bao lớn khác biệt.

Cố chấp.

Tần Vũ lần nữa khoanh chân ngồi xuống, trong não bắt đầu huyễn tưởng khí lưu tại kinh mạch lưu chuyển, sau đó Tần Vũ liền hết thảy đều không muốn, trong não một mảnh không minh, liền như thế tiếp tục nữa......

Đột nhiên ——

Tần Vũ cảm thấy một cỗ cực kỳ yếu ớt khí lưu tại thể nội chầm chậm lưu động, hơn hai ngày qua kiên trì, giờ phút này cuối cùng thành công, trong nháy mắt Tần Vũ Tâm bên trong trở nên kích động, lập tức loại kia trong lòng yên tĩnh, trong não không minh trạng thái biến mất, đồng thời Tần Vũ cũng không cảm giác được khí lưu.

“Bình tĩnh, bình tĩnh.” Tần Vũ đối với mình tự nhủ, sau đó lần nữa dựa theo « Thủy Kinh Chú » miêu tả phương pháp tiến nhập vừa rồi trạng thái, sau một lúc lâu, Tần Vũ quả nhiên lần nữa cảm nhận được thể nội một cỗ yếu ớt khí lưu.

Lúc này, Tần Vũ dựa theo « Thủy Kinh Chú » phương pháp, bắt đầu để khí lưu ở trong kinh mạch vận hành một cái Tiểu Chu Thiên, theo lưu chuyển, Tần Vũ càng thêm rõ ràng cảm nhận được khí lưu này, đợi đến vận chuyển một cái Tiểu Chu Thiên sau, Tần Vũ liền muốn khống chế cỗ linh khí này dung nhập trong đan điền.

Dựa theo trong bí tịch giảng thuật, khí lưu tiến vào đan điền, sẽ an tĩnh ở trong đan điền tích súc xuống tới.

Thế nhưng là......

“Chuyện gì xảy ra? Đan điền của ta thật không cách nào tích súc nội lực sao?” Tần Vũ choáng váng, hắn phát hiện cái kia trải qua Tiểu Chu Thiên vận chuyển linh khí ở trong đan điền vậy mà tiêu tán đi, từ thể nội lần nữa trở về tự nhiên, đan điền vẫn như cũ trống rỗng.

“Xem ra Phong Bá Bá lúc trước nói đúng, đan điền của ta không giống bình thường, căn bản là không có cách tích súc nội lực. Tu luyện nội công, nội lực đều là chứa đựng ở trong đan điền, đan điền ta không cách nào tồn trữ, lại tu luyện thì có ích lợi gì đâu?” Tần Vũ giờ khắc này rốt cuộc hiểu rõ.

Thiên hạ mặc dù nội công phương pháp tu luyện vô số, riêng phần mình khác biệt. Nhưng là có một chút là cùng.

Cái này tu luyện hấp thu chuyển hóa nội lực đều là tồn trữ tại khí hải huyệt, cũng chính là trong đan điền. Ngay cả đan điền đều không thể tích súc nội lực, lại tu luyện còn có cái gì sử dụng đây?

Bỗng nhiên, Tần Vũ vô tình phát hiện quyển kia màu vàng « Tổ Long Quyết » tại những này nội công trong thư tịch, duy nhất một quyển sách viết tại trên giấy vàng bí tịch lộ ra rất là dễ thấy, Tần Vũ liền đưa tay với tay cầm cái này « Tổ Long Quyết ».

« Tổ Long Quyết » rất mỏng, chỉ có ba trang, bất quá giấy vàng phía trên chữ viết rất nhỏ, ba trang trên giấy vàng lại có không ít nội dung.

Tần Vũ thử nghiệm dựa theo « Tổ Long Quyết » khẩu quyết tu luyện, một lát, Tần Vũ liền cảm thấy một cỗ khí lưu tại thể nội, cái này « Tổ Long Quyết » quả nhiên lợi hại, hấp thu thiên địa linh khí so vừa rồi nhiều hơn nhiều, mà lại Chu Thiên vận chuyển tốc độ cực nhanh, đợi đến Tần Vũ đem nội lực muốn tồn trữ đến đan điền thời điểm, tình huống giống nhau phát sinh.

Đan điền thật giống như một cái cái phễu, có bao nhiêu nội lực liền lọt mất bao nhiêu, căn bản là không có cách súc tích.

Tần Vũ trên mặt giống như cười khổ, giống như bất đắc dĩ.

Nhưng sau đó nở nụ cười: “Ai, xem ra ta lười biếng không thành, ta còn muốn không cần khổ, muốn tìm đến một cái biện pháp tu luyện nội công đâu, cái này đan điền liền cùng cái phễu một dạng, có bao nhiêu nội lực liền tản mất bao nhiêu, tu luyện thế nào nội công đâu?”

Có thể Tần Vũ trên mặt lại tựa hồ như không thèm để ý chút nào.

Trên thực tế, Tần Vũ Tâm bên trong sớm có thất bại chuẩn bị, dù sao lúc trước nói hắn không cách nào tu luyện nội công người là Phong Ngọc Tử, Sở Vương hướng tam đại Thượng Tiên một trong a, nhân vật như vậy đã nói vậy, sai khả năng quá thấp.

“Ngoại công, ân, từ hôm nay trở đi, ta liền toàn lực tu luyện ngoại công đi.” Tần Vũ trong mắt lấp lóe từng tia từng tia quang mang, nhìn một chút cái kia 28 bản ngoại công bí tịch, Tần Vũ nở nụ cười, “Tiềm Long Đại Lục đi qua từ xưa tới nay chưa từng có ai ngoại công đạt tới tiên thiên cảnh giới, liền để ta trở thành ngoại công đạt tới tiên thiên người thứ nhất đi!”

Tần Vũ dù sao chỉ là tám tuổi hài đồng, vẫn như cũ có hài đồng tâm tính.

Dựa vào ngoại công đạt tới tiên thiên cảnh giới, đích thật là xưa nay chưa từng có, cái kia tiên thiên cảnh giới ngoại công cao thủ, đến cùng có bao nhiêu lợi hại đâu? Đây là một điều bí ẩn.......

Hai ngày sau buổi sáng, Tần Vũ trong thư phòng.

Tần Vũ bưng lấy một quyển sách, chính an tĩnh nhìn xem, tại Tần Vũ bên cạnh, có hai cái to lớn giá sách, nhìn một cái, cái này hai đại trên giá sách có ít nhất hơn ngàn bản các loại thư tịch, mà “Tiểu Hắc” cũng trong thư phòng tới lui, không đã quấy rầy nó tiểu chủ nhân.

“Tam điện hạ, có tám cái ngoại công cao thủ tới, dẫn đội là vương phủ phó tổng quản đại nhân, nói là đưa tới cho Tam điện hạ chọn ngoại công lão sư.” một người hầu đi đến ngoài cửa thư phòng, cung kính nói ra.

Tần Vũ lập tức nhãn tình sáng lên, liền lập tức buông xuống ở trong tay sách, trong lòng một trận hưng phấn, lúc trước hắn liền cùng ngay cả nói lời việc này, ngay cả nói cũng truyền tin nói cho người trong vương phủ, Trấn Đông Vương Tần Đức biết việc này, đặc biệt an bài trong quân doanh mấy đại cao thủ cùng Đông Vực Tam Quận mấy đại ngoại công cao thủ cùng đi đến.

“Đợi hai ngày rốt cục chờ đến, Khang An, nhanh, phía trước dẫn đường!” Tần Vũ hưng phấn mà lúc này đối với người hầu ra lệnh.

“Là.” Khang An Lập tức cung kính ở phía trước dẫn đường, mà Tần Vũ thì là ra thư phòng, về phía tây uyển đi đến.', 6),
( 1, N'chọn thầy', N'Chương 7: chọn thầy

Tây Uyển suối nước nóng bên cạnh cách đó không xa có một sân luyện công, giờ phút này đang có không ít người tụ tập ở này.

“Liên Bá, lần này tám đại ngoại công cao thủ từng cái đều là nhất đẳng, quân đội liền có bốn cái, mặt khác bốn cái cũng là Đông Vực Tam Quận Đặc lợi hại ngoại công cao thủ, ngươi nhìn, lão giả tóc bạc kia, chính là ưng trảo vương, còn có......” lần này dẫn đội vương phủ Lý Phó Tổng Quản đối với Liên Ngôn, hơi có chút lấy lòng nói ra.

Liên Ngôn vô tình nhẹ gật đầu, hướng tám đại ngoại công cao thủ một chút quét tới, kia cái gọi là ưng trảo vương mấy người, Liên Bá ánh mắt đều không có dừng lại một giây.

Luyện ngoại công, hoặc luyện tập chỉ luyện trảo, hoặc là luyện chân ngay cả chân, luyện địa phương nào bộ vị kia liền cùng thường nhân có chỗ khác biệt, tỉ như tu luyện trảo công người, ngón tay liền tương đối thô to, mà lại vết chai tương đối nhiều, Liên Bá đối với những người này là mảy may không để vào mắt.

“A?” Liên Bá đột nhiên nhãn tình sáng lên, nhìn chằm chằm trong tám người cái cuối cùng, đó là một cái áo đen nam tử lạnh lùng.

Nam tử này không tính là cường tráng, cơ bắp cũng không giống những người khác phát đạt như vậy, trên tay cũng không có cái gì vết chai chờ chút, nhìn qua căn bản không giống ngoại công cao thủ, nhưng là Liên Bá ánh mắt đem nam tử mặc áo đen này trên thân trọn vẹn dừng lại 3 giây.

Cái kia áo đen nam tử lạnh lùng đột nhiên ngẩng đầu cùng Liên Bá nhìn nhau, nam tử kia trong mắt ánh mắt đột nhiên giống như bộc phát ra một đạo như thiểm điện.

“Triệu Vân Hưng! Nguyên lai là Triệu Tương Quân, vương gia hắn vậy mà bỏ được đem Triệu Tương Quân ngươi mời tới, Tiểu Vũ nếu như có thể bái ngươi làm thầy, về sau trở thành một cao thủ cũng không phải việc khó.” Liên Bá mỉm cười nói, đối với cái này Triệu Vân Hưng, Liên Bá vô cùng rõ ràng.

Triệu Vân Hưng trên mặt vẫn như cũ lạnh lùng: “Vương gia nói qua, Tam điện hạ tuyển ai là lão sư liền tuyển ai, liền nhìn điện hạ ánh mắt, ngay cả tiền bối hay là đừng âm thầm nhắc nhở điện hạ, nếu không...... Dù cho lựa chọn Vân Hưng, Vân Hưng cũng sẽ không thu hắn làm đệ tử.”

“Ta đây tự nhiên biết. Hết thảy nhìn Tiểu Vũ lựa chọn của mình.” Liên Ngôn cười gật đầu nói.

Lần này tám đại ngoại công cao thủ, đều là cực kỳ lợi hại, có thể đem ngoại công tu luyện tám người này cảnh giới, cũng coi là ngoại công tông sư. Tần Vũ lựa chọn cái nào đều là không sai, bất quá ngay cả nói nhưng trong lòng trong bóng tối chờ mong, chờ mong Tần Vũ có thể lựa chọn Triệu Vân Hưng, bởi vì Liên Ngôn biết cái này Triệu Vân Hưng lợi hại.

Một lát, bên ngoài tiếng bước chân liền vang lên, trên mặt có vẻ hưng phấn Tần Vũ lập tức vọt vào, vừa nhìn thấy trước mắt tám đại cao thủ, Tần Vũ lập tức con mắt tỏa ánh sáng.

“Tiểu Vũ, cái này tám đại ngoại công cao thủ ngươi tuyển thứ nhất coi ngươi lão sư đi.” Liên Ngôn vừa cười vừa nói.

Tần Vũ lại là từng cái nhìn kỹ đi, tám đại cao thủ, bắt mắt nhất hẳn là cái kia giống như gấu một dạng đại hán, cánh tay to lớn kia đủ để so ra mà vượt Tần Vũ eo thô, một quyền kia xuống dưới, Tần Vũ không chút nghi ngờ cái kia uy lực.

Lập tức, Tần Vũ trong lòng càng thêm hưng phấn.

“Chọn một? Chẳng lẽ không có khả năng tám cái toàn tuyển a?” Tần Vũ nhìn về phía Liên Ngôn, nhướng mày lên nghi hoặc hỏi.

Liên Ngôn một trận ngạc nhiên, tám đại cao thủ đều sững sờ, bao quát cái kia lạnh lùng Triệu Vân Hưng cũng là trố mắt nhìn, khóe miệng không nhịn được có mỉm cười.

“Khục.” Liên Ngôn ho khan một tiếng, sau đó mới đối Tần Vũ Ngữ trọng tâm dài nói ra, “Tiểu Vũ a, cái này luyện công không phải đọc sách, ngươi đọc sách có thể xin mời mấy cái lão sư, nhưng là ngươi học võ công lại không được, tỉ như đồng thời học mấy loại nội công, vậy liền sẽ tẩu hỏa nhập ma.”

“Thế nhưng là ta học chính là ngoại công a?” Tần Vũ hỏi ngược lại.

“Ngoại công liền càng thêm không được, ngoại công là rèn luyện thân thể, để thân thể không ngừng đột phá cực hạn, mỗi cái ngoại công cao thủ đều có chính mình một bộ biện pháp, đó là trải qua vô số người thực tiễn, có thể cam đoan ngươi sẽ không bởi vậy thân thể luyện sụp đổ. Thế nhưng là...... Nếu như ngươi đồng thời cùng mấy cái lão sư học, mấy loại kia phương pháp hỗn hợp với nhau, cái kia......” Liên Ngôn lắc đầu thở dài nói, ý kia hiển nhiên rất rõ ràng.

Mà lại trừ nguyên nhân này, còn có một cái càng trọng yếu hơn nguyên nhân.

“Chúng ta tám người đoán chừng không có người sẽ nguyện ý cùng người khác chung đệ tử.” một cái cường tráng nam tử đầu trọc cười nói, những người khác mỉm cười gật đầu.

Tám người này đều là ngoại công cấp bậc tông sư cao thủ, từng cái trong lòng cực kỳ cao ngạo, lại thế nào nguyện ý cùng người khác chung một người đệ tử đâu? Bất quá nghe được Tần Vũ nói như thế, tám người này không có người để ý, dù sao chỉ là một cái tám tuổi hài tử thôi.

“Ta hiểu được.” Tần Vũ nhẹ gật đầu.

Bỗng nhiên, Tần Vũ trong mắt lóe lên một tia giảo hoạt, Liên Ngôn lập tức trong lòng máy động, hắn nhưng là biết Tần Vũ mặc dù tâm tính thiện lương, thế nhưng là cũng ưa thích nói đùa trò đùa quái đản, Vân vụ sơn trang những hộ vệ kia những người hầu kia nhưng không có thiếu nhận qua chọc ghẹo.

“Tám vị thúc thúc bá bá, nghe ngay cả gia gia nói các ngươi là ngoại công cao thủ, để cho ta tuyển các ngươi làm lão sư, thế nhưng là các ngươi cũng hẳn là biểu diễn một chút, để cho ta lựa chọn đi?” Tần Vũ chớp mắt to, nhìn xem tám đại ngoại công cao thủ.

Không phải sao? Không biểu diễn một lượt, lựa chọn như thế nào đâu?

“Ha ha, nói có lý, ta trước hết biểu diễn một chút đi, nên biểu diễn cái gì đâu? Ta Man Đống tuyệt kỹ có thể nhiều nữa đâu.” trong tám người khổ người lớn nhất cái kia gấu bình thường tráng đại hán đi ra, trên tay của hắn đang có một độc cước đồng nhân, cái này Man Đống suy nghĩ một lát, cả cười đứng lên, “Tốt, liền biểu diễn khí lực đi.”

Man Đống đem độc cước đồng nhân để dưới đất, một chút liền nhìn trúng Tây Uyển dùng để trang trí to lớn đá xanh, đá xanh kia có gần như cao cỡ nửa người, nhìn qua nặng tới ngàn cân. Cái kia Man Đống cứ như vậy đi qua, hai tay bắt lại hai bên.

“Hừ!”

Man Đống hừ lạnh một tiếng, Tần Vũ vậy mà nhìn thấy cái này Man Đống trong lỗ mũi toát ra một đạo có thể thấy được khí tức, chỉ gặp Man Đống hai tay kia cơ bắp gồ lên, từng đầu phảng phất con giun một dạng rầu rĩ, cái kia cơ bắp đường cong thật giống như bức tượng đá, ẩn chứa trong đó thần lực để cho người ta cảm thấy khủng bố.

“Lên!”

Man Đống hét lớn một tiếng, khối kia to lớn đá xanh lại bị hai tay của hắn ném đi, bay lên.

Tần Vũ trợn mắt hốc mồm, cự thạch ngàn cân, vẻn vẹn giơ lên liền khó khăn dọa người rồi, cái này Man Đống vậy mà đem cự thạch này ném đi, giữa hai tay khí lực tuyệt đối quá ngàn cân, cự thạch kia bay hơn hai thước cao, sau đó trùng điệp rơi xuống.

Man Đống trầm ổn trung bình tấn, duỗi ra hai tay, một thanh liền hai tay kéo lại đá xanh.

Đá xanh này rơi xuống, tác dụng tại Man Đống trên tay lực lượng thế nhưng là vượt qua bản thân trọng lượng, thế nhưng là Man Đống vẫn như cũ vững vàng kéo lại, lực lượng mạnh mẽ không phải bàn cãi.

“Thật là lợi hại.” Tần Vũ mở to hai mắt nhìn.

Man Đống cười ha ha, không quan tâm nói: “Ta Man Đống một tay liền có 800 cân khí lực, hai tay cộng lại, quá ngàn cân còn không phải cùng làm chơi giống như.” Man Đống trời sinh thần lực, chính là Liệt Hổ quân tam đại ngoại công cao thủ một trong, ngoại hiệu “Rất gấu”.

“Lợi hại, lợi hại, còn có ai?” Tần Vũ giờ phút này hưng phấn lên, nhìn thấy như vậy biểu diễn, hắn làm sao lại không hưng phấn đâu, vừa nghĩ tới sau này mình có thực lực như thế, hắn liền càng thêm hưng phấn, thế nhưng là Tần Vũ nhưng lại không biết, Man Đống trời sinh thần lực, Tần Vũ muốn rèn luyện thành trình độ kia, khó.

Một cái gầy gò nam tử mũi ưng đi ra, nói “Ta tu luyện chính là Thiết Sa chưởng.” Tần Vũ xem xét nam tử kia bàn tay, quả nhiên khác hẳn với thường nhân, thô ráp nhiều, thậm chí xanh biếc. Nam tử mũi ưng kia nói trực tiếp đi đến tảng đá gần đó, đột nhiên một chưởng vỗ đánh xuống đi.

Đá xanh đột nhiên chấn động, sau đó vậy mà ầm vang vỡ vụn ra, vỡ thành mấy chục khối lớn, như vậy chưởng lực đơn giản doạ người muốn chết.

Tần Vũ miệng nhỏ dáng dấp lão đại, khiếp sợ nhìn xem cái kia lãnh khốc nam tử mũi ưng, như vậy chưởng lực, nếu như đánh vào trên thân người, ai chịu nổi?', 7),
( 1, N'Triệu Vân Hưng', N'Chương 8: Triệu Vân Hưng

Tần Vũ nhưng lại không biết.

Lần này tới tám người, mỗi một cái đều là đạt đến riêng phần mình ngoại công lưu phái cấp bậc tông sư, bọn hắn mỗi một cái thực lực đều cường hãn muốn mạng, đối với bình thường ngày kia đỉnh phong cao thủ đều có thể thủ thắng. Có lẽ chỉ có Tiên Thiên cao thủ có thể ngăn chặn bọn hắn.

Ngoại công đến trình độ như vậy, tay chân đã vững như sắt thép, thậm chí vượt qua binh khí chi lợi, đập nát đá xanh cũng rất bình thường. Bất quá ngoại công muốn tu luyện tới tình trạng như thế, chẳng những cần cố gắng, mà lại cần thiên tư. Dù sao Đông Vực Tam Quận hơn mười ức người, có thể ngoại công tu luyện tới cảnh giới như thế, chỉ có chút ít hơn mười người mà thôi.

Tần Vũ con mắt trừng lớn nhìn kỹ, từng cái ngoại công cao thủ đều lên trước biểu diễn tuyệt chiêu của chính mình.......

“Bồng!”

Lão giả tóc bạc một tay bắt lấy một giống như tấm gạch lớn nhỏ đá xanh khối vụn, chỉ gặp năm ngón tay kia dùng sức, lập tức khối đá xanh kia liền bị bóp thành nát bấy, sau đó lão giả tóc bạc liền lãnh ngạo đi trở về vị trí của mình, nhàn nhạt một giọng nói: “Ưng Trảo công.”

Đây là vị thứ sáu ngoại công cao thủ biểu diễn.

Đầu trọc nam tử cường tráng đi ra, trần trụi nửa người trên tựa hồ có từng tia từng tia kim quang bình thường.

“Thiết thối công.” nam tử đầu trọc mỉm cười nói ra, Nhưng sau đó nhẹ nhõm vung lên chân.

“Hô!” không khí trong nháy mắt bị vạch phá, phát ra gấp rút chói tai tiếng rít, một cỗ có thể thấy được khí lưu hiện lên thẳng tắp đánh sâu vào mở đi ra, vừa vặn trùng kích tại vừa vỡ nứt trên tảng đá, đá xanh kia lập tức bị xung kích lăn thật xa.

Vẻn vẹn bằng vào khủng bố chân nhanh sinh ra khí lưu liền đem vừa vỡ nứt đá xanh trùng kích lăn thật xa, vậy nếu như chân kia thực thực nện ở trên thân người, lại là cái gì kết quả đây?

“Lợi hại.” Tần Vũ trong lòng thầm than, sau đó đưa ánh mắt về phía vị cuối cùng ngoại công cao thủ, lạnh lùng nam tử áo đen, từ đầu tới đuôi vị này lạnh lùng nam tử áo đen liền lạnh nhạt nhìn xem mấy vị khác ngoại công cao thủ biểu diễn, trong mắt một mực rất bình tĩnh.

“Ngươi làm sao không biểu diễn đâu?” Tần Vũ chờ giây lát cũng không thấy nam tử lạnh lùng này xuất thủ, không khỏi tò mò dò hỏi.

Triệu Vân Hưng lắc đầu lạnh nhạt nói: “Ta trảo công không bằng ưng trảo vương, khí lực không bằng Man Đống, thối công không bằng vị huynh đệ kia, vậy tại sao còn mất mặt đâu?”

Tần Vũ ngẩn ngơ.

“Vậy ngươi dù sao cũng nên có cái gì tuyệt chiêu đi.” Tần Vũ nhìn kỹ trước mắt áo đen nam tử lạnh lùng, muốn từ trên người hắn đánh giá ra tuyệt chiêu của hắn, thế nhưng là Tần Vũ thất bại, hắn căn bản tìm không thấy nam tử mặc áo đen này có cái gì chỗ đặc thù.

“Tuyệt chiêu?” Triệu Vân Hưng cười một tiếng, sau đó nghiêm mặt nhìn xem Tần Vũ, trong mắt lóe lên một tia lãnh ý, lạnh như băng nói: “Tuyệt chiêu của ta chỉ có lúc giết người mới có thể bày ra, thế nhưng là...... Dù cho ta coi ngươi lão sư, cũng không biết dạy ngươi giết người tuyệt chiêu.”

Tần Vũ nhưng không có bị cái này Triệu Vân Hưng khí thế hù ngã, ngược lại nghi ngờ nói: “Ngươi tuyệt chiêu lại không dạy ta, vậy ngươi dạy ta cái gì?”

“Rèn luyện thân thể.” Triệu Vân Hưng bình thản nói.

Tần Vũ đột nhiên nở nụ cười: “Tốt, ta liền tuyển ngươi.”

Triệu Vân Hưng một mực trên khuôn mặt lạnh lùng giờ phút này lại là xuất hiện một tia kinh ngạc, ngay cả mặt khác bảy đại ngoại công cao thủ đều từng cái giật mình nhìn xem Tần Vũ, bọn hắn đều không thể minh bạch, Tần Vũ vì cái gì không chọn bọn hắn, ngược lại lựa chọn một cái chỉ truyền “Rèn luyện thân thể” người.

“Tốt, Tam điện hạ đã lựa chọn, từ hôm nay trở đi Triệu Vân Hưng chính là Tam điện hạ lão sư.” Lý phó tổng quản lúc này cao giọng tuyên bố.

Mặt khác bảy đại ngoại công cao thủ từng cái kinh dị đi hướng Tần Vũ, Man Đống cái kia thô to giọng vang lên: “Tam điện hạ, ngươi làm sao không chọn ta đây? Ta nhất định có thể đem ngươi dạy khí lực của ngươi lớn như trâu, cầm đem lưỡi búa lớn, đó là một chặt một mảnh a.”

Nhìn trước mắt hiếu kỳ bảy đại ngoại công cao thủ, Tần Vũ trên mặt xuất hiện tặc tặc dáng tươi cười: “Hắc hắc, cái này một cái bí mật.”

Lúc này Triệu Vân Hưng cũng đi tới, nhìn xem Tần Vũ, trên mặt có một tia nụ cười thản nhiên, cũng hỏi: “Ta cũng rất tò mò, ngươi làm sao tuyển ta làm lão sư đâu? Tam điện hạ, ngươi có thể hay không nói một chút nguyên nhân?”

Tần Vũ có chút ngóc đầu lên, đắc ý nói: “Đần a, cái này còn phải nói sao? Thật sự là một đám đồ đần.” nói liền quay người muốn đi, một bên ngay cả nói cũng đi tới, liền đi theo Tần Vũ bên cạnh, liền hỏi, “Tiểu Vũ, ngươi làm sao tuyển cái này Triệu Vân Hưng đâu?”

Tần Vũ lúc này thần bí nhỏ giọng tại ngay cả lời nói: “Ngay cả gia gia, còn phải nói sao? Xem bọn hắn thần thái liền biết thôi, tám người, cái kia Triệu Vân Hưng đứng tại cuối cùng, không người nào dám tới gần hắn. Còn có, cái kia Triệu Vân Hưng nhìn thấy những người khác biểu diễn, tựa hồ không thèm quan tâm. Cái này còn không thể phán định a? Còn có...... Ngay cả gia gia ngươi nhìn cái kia Triệu Vân Hưng ánh mắt cũng cùng những người khác khác biệt a ~~~ hì hì!”

Nói, Tần Vũ liền đi ra Tây Uyển, mà tám đại ngoại công cao thủ từng cái trong mắt kinh dị, bọn hắn đều là cao thủ, thính lực cũng là bén nhạy nhiều, đều nghe được Tần Vũ lời nói.

“Tam điện hạ tâm tư quả nhiên tinh mịn, nói không chừng thật đúng là có thể thu đến một cái không sai đệ tử, bất quá...... Không biết hắn nghị lực thế nào.” Triệu Vân Hưng trong mắt từng có mỉm cười.

Mặt khác bảy đại cao thủ đều là trong lòng hiểu nhưng, cũng than thở cái này Tam điện hạ thông minh.

“Triệu Tương Quân, chúng ta về trước quân doanh.” Man Đống các loại Liệt Hổ quân bên trong tam đại ngoại công cao thủ lúc này chắp tay nói, thần thái rất là tôn kính, đó là phát ra từ nội tâm. Đối với cái này Triệu Tương Quân, cho dù là Tiên Thiên cao thủ, tại những quân đội này cao thủ xem ra cũng là không bằng Triệu Tương Quân.

“Triệu Huynh, chúc mừng thu được cao như thế đồ, chúng ta cũng cáo từ.” ưng trảo vương mấy người cũng là chắp tay hơi có vẻ cung kính nói ra.

Nội công cao thủ đó là một vòng, mà ngoại công cao thủ cũng có một vòng, toàn bộ Tiềm Long Đại Lục, nhiều như vậy ngoại công cao thủ, trong hội này, Triệu Vân Hưng là thuộc về đế vương cấp bậc nhân vật, thụ tất cả ngoại công cao thủ tôn kính, mà lại Triệu Vân Hưng tại mang phương diện cũng là rất lợi hại. Trấn Đông Vương Tần Đức Xá Đắc để Triệu Vân Hưng đến dạy bảo một năm, lúc trước cũng là để Từ Nguyên kinh dị hồi lâu.......

Ngày thứ hai, Vân Vụ Sơn Trang to lớn sân luyện võ, Triệu Vân Hưng toàn thân áo đen quần áo luyện công cao ngạo đứng ở nơi đó, không nhúc nhích.

“Lão sư!” người mặc một thân quần áo luyện công Tần Vũ Hưng Phấn chạy tới Triệu Vân Hưng trước, cung kính nói.

Triệu Vân Hưng hơi gật đầu, sau đó nói: “Về sau sáu giờ sáng nhất định phải đuổi tới sân luyện công, giờ phút này đã là buổi sáng tám điểm, ngươi ròng rã đã chậm một canh giờ, trước phạt ngươi từ Vân Vụ Sơn Trang chạy đến chân núi, lại từ chân núi chạy đến Vân Vụ Sơn Trang.”（ vì để cho mọi người thấy rõ, đem Tiềm Long Đại Lục thời gian định là một ngày hai mươi bốn tiếng, ngày ba mươi tháng một, một năm 360 ngày. Kỳ thật cũng là cà chua lười biếng. ）

Tần Vũ nao nao, lúc này tức giận nói: “Lão sư, đây là lần thứ nhất a, trước đó không có nói cho ta biết sáu điểm muốn tới a.”

“Đối với mệnh lệnh của ta, đừng có bất luận cái gì hoài nghi, ngươi cần làm chính là...... Chấp hành.” Triệu Vân Hưng lạnh lùng con mắt nhìn chằm chằm Tần Vũ, không có chút nào thỏa hiệp, Tần Vũ cắn môi một cái, liền nói ngay: “Là, lão sư!” nói xong, liền bắt đầu chạy xuống đi.

Vân Vụ Sơn Trang tại Đông Lam Sơn sườn núi, từ Vân Vụ Sơn Trang đến chân núi có khoảng hai ngàn mét, vừa đi vừa về chính là 4000 mét, mà lại trở về thời điểm hay là leo lên trên núi, độ khó to lớn, căn bản không phải một cái tám tuổi hài đồng có khả năng tiếp nhận.

Triệu Vân Hưng nhìn xem Tần Vũ bắt đầu chạy, khóe miệng có mỉm cười, khẽ gật đầu. Sau đó lại khôi phục lạnh lùng bộ dáng. Triệu Vân Hưng cũng đi theo Tần Vũ sau lưng chạy, Triệu Vân Hưng chạy bộ phảng phất tản bộ một dạng nhẹ nhõm, cả người như là như gió một bước chính là mấy mét, Triệu Vân Hưng liền đi theo Tần Vũ sau lưng.

Tần Vũ trong mắt lóe ra điểm điểm quang mang, ngậm miệng bắt đầu chạy.

Đi qua hắn thường xuyên leo núi, từ Vân Vụ Sơn Trang đến đỉnh núi cũng thường xuyên chạy, mỗi một lần đều là hơn một ngàn mét, cái này khiến Tần Vũ sức chịu đựng rất không tệ, tăng thêm tại Vân Vụ Sơn Trang trong ôn tuyền cua, thân thể xa xa so người đồng lứa mạnh.

Chạy đến chân núi 2000 mét, bởi vì là xuống núi, Tần Vũ cũng không có quá cố hết sức, chạy xong 2000 mét, chỉ là thở hổn hển mà thôi, rơi quay đầu lại, Tần Vũ liền hướng lên chạy.

Xuống núi nhẹ nhõm, lên núi khó.

Vẻn vẹn chạy vài trăm mét, Tần Vũ liền cảm thấy liền hô hấp thống khổ cực kỳ, mỗi một bước đều cố hết sức cực kỳ, Tần Vũ cảm thấy chân cơ bắp mỏi nhừ, mỗi một bước đều là cật lực rất, nhưng là Tần Vũ có thể cảm thấy Triệu Vân Hưng ngay tại bên cạnh mình.

Tần Vũ trong lòng cũng là cố chấp cao ngạo, lúc này cắn răng một cái, tiếp tục kiên trì.

Cực hạn...... Hô hấp khó khăn, toàn bộ lồng ngực phảng phất ống bễ một dạng cực tốc hút lấy dưỡng khí.

“Ta không được sao?”

Đạt tới sinh lý cực hạn, Tần Vũ cảm thấy cực kỳ thống khổ: “Phụ vương.” vừa nghĩ tới phụ thân của mình, Tần Vũ liền cắn răng tiếp tục kiên trì, càng ngày càng thống khổ, thậm chí Tần Vũ cảm thấy mình phải chết, thế nhưng là bỗng nhiên...... Phảng phất bay qua một cái cao phong một dạng, Tần Vũ hô hấp lại hơi dễ dàng hơn.

Vượt qua lần này sinh lý cực hạn, Tần Vũ chạy bộ liền duy trì tại loại này tiếp cận với cực hạn trạng thái.

Đợi đến chạy hơn một ngàn mét nhìn thấy Vân Vụ Sơn Trang cửa lớn thời điểm, Tần Vũ đạt đến lần thứ hai sinh lý cực hạn.

“Đến Vân Vụ Sơn Trang.” Tần Vũ trong lòng thư thái một hồi, liền muốn dừng lại nghỉ ngơi. Thế nhưng là ——

“Chạy đến sân luyện công.” sau lưng Triệu Vân Hưng thanh âm băng lãnh vang lên, Triệu Vân Hưng không có chút nào thở hổn hển, thậm chí liền âm thanh đều không có mảy may chập trùng, thường nhân vẻn vẹn đi đường leo núi, đều là thở hồng hộc, hắn lại là ngay cả khí tức đều không có một chút xíu biến hóa.

“Hô hô ~~~~” Tần Vũ không nói gì thêm, mà là từng đợt thở hổn hển, Tần Vũ cắn răng một hơi rốt cục chạy tới sân luyện công, vừa đến sân luyện công, Tần Vũ liền cảm thấy hai chân như nhũn ra, mệt khó chịu, liền muốn tọa hạ.

“Đứng đấy, không cho ngồi xuống.” Triệu Vân Hưng thân hình lóe lên, đã đến Tần Vũ trước người, nhàn nhạt nhìn xem Tần Vũ, biểu hiện trên mặt cùng lên xuống núi trước đó không có chút nào khác nhau.

Tần Vũ dựa vào trong lòng cỗ ngạo khí kia, quả thực là để cho mình đứng đấy, cứ như vậy nhìn xem Triệu Vân Hưng.

Triệu Vân Hưng nhẹ gật đầu, nói “Có thể chạy xuống tới, ngươi cũng có thể cảm thấy sinh lý cực hạn, rất tốt, duy nhất một lần chạy xuống tới, từ hôm nay trở đi, ngươi chính là ta Triệu Vân Hưng đệ tử.” Triệu Vân Hưng lời nói ý tứ rất rõ ràng, nếu như Tần Vũ chạy không hết, đoán chừng Triệu Vân Hưng sẽ trực tiếp rời đi, không còn dạy bảo Tần Vũ.

Tần Vũ chỉ là nhìn xem Triệu Vân Hưng, không phải hắn không muốn nói chuyện, thế nhưng là giờ phút này hắn căn bản nói không ra lời, lần thứ nhất chạy kịch liệt như thế a.

“Hết thảy ngoại công, hoặc Thiết Sa chưởng, hoặc thiết thối công, hoặc mặt khác, đều là rèn luyện thân thể bộ vị nào đó, để nó cứng như sắt thép, lực công kích kinh người, đều thuộc về công kích phương pháp mà thôi. Mặc kệ cái gì ngoại công, thân thể mới là căn bản, thân thể mới là cơ sở. Một cái tốc độ nhanh như thiểm điện, lực nâng ngàn cân người tu luyện bất luận cái gì ngoại công, hoặc Bá Vương thần quyền, hoặc thiết thối công, khẳng định so một cái quỷ bị lao lợi hại hơn nhiều.” Triệu Vân Hưng chậm rãi mà nói.

Tần Vũ giờ phút này khí cũng thở chậm, nghe được Triệu Vân Hưng nói như thế, liền nói ngay: “Lão sư, ta đây minh bạch, thân thể là căn bản, tốt thân thể chính là một khối ngọc thô, điêu khắc đi ra cũng tốt nhiều, mà yếu thân thể thì là một khối tạp chất ngọc, dù cho tay nghề cao siêu, cũng thành không được tốt chạm ngọc.”

Triệu Vân Hưng trên mặt khó được có vẻ tươi cười: “Rất tốt, minh bạch liền tốt. Ta dạy cho ngươi thời gian chỉ có một năm, trong một năm này, ta sẽ từ thân thể từng cái phương diện huấn luyện ngươi, lực lượng, tốc độ, tính dẻo dai, tính dễ nổ, năng lực kháng đòn chờ chút, để cho ngươi thân thể không ngừng thuế biến, về phần công kích chi pháp, ta sẽ không dạy ngươi. Ta sẽ chỉ dạy ngươi đem thân thể huấn luyện đến hoàn mỹ trạng thái phương pháp, về phần như thế nào sử dụng thân thể này công kích người, giết người, chính ngươi thể ngộ đi.”

“Của ta huấn luyện phương pháp chính là...... Cực hạn phương pháp huấn luyện, vừa rồi chạy bộ thời điểm chắc hẳn ngươi cảm nhận được sinh lý cực hạn tồn tại, bất quá cùng huấn luyện của ta so sánh, đây chẳng qua là trò trẻ con. Đương nhiên, ngươi có thể lựa chọn từ bỏ, ngươi lựa chọn từ bỏ, ta cũng dễ dàng, ta đám lính kia nhưng so sánh ngươi hài đồng này kiên cường nhiều.” Triệu Vân Hưng nhìn xem Tần Vũ lạnh nhạt nói ra.

Tần Vũ trong mắt kiên định.

Cực hạn?

Tần Vũ lại là cảm thấy mình thích loại kia siêu việt cực hạn cảm giác, đúng vậy, ưa thích.

“Lão sư, bắt đầu đi.” Tần Vũ ngang nhiên nhìn xem Triệu Vân Hưng, Triệu Vân Hưng nhướng mày một cái, kinh dị tại tên đệ tử này tâm tính chi kiên, trên mặt có vẻ hài lòng ý cười.

Thế nhưng là Tần Vũ bỗng nhiên vẻ mặt đau khổ, nháy mắt nhìn xem Triệu Vân Hưng, đáng thương phân khối đạo, “Lão sư a, có thể hay không để cho ta nghỉ ngơi một chút a, vừa rồi chạy thật rất mệt mỏi a, trước uống ngụm nước, sau đó lại ngâm một chút suối nước nóng, lại để cho Ông Gia Gia giúp ấn ma một chút, cơ bắp rất mệt mỏi.”

Triệu Vân Hưng khẽ giật mình, biểu hiện trên mặt đọng lại, lúc này Triệu Vân Hưng biểu lộ rất đặc sắc, có thể dùng một cái từ để hình dung, đó chính là...... Dở khóc dở cười.', 8),
( 1, N'tinh túy', N'Chương 9: tinh túy

“Đang huấn luyện trước ngươi, ta nhất định phải để cho ngươi minh bạch huấn luyện của ta pháp tinh túy chỗ. Một năm sau, dù cho ta trở về, ngươi cũng muốn dựa theo huấn luyện của ta công pháp tinh túy tiếp tục huấn luyện.” Triệu Vân Hưng lạnh lùng nghiêm mặt, nhìn chằm chằm Tần Vũ nói ra.

Nghe được “Tinh túy” hai chữ, Tần Vũ con mắt lập tức tỏa sáng, tập trung tinh thần cẩn thận nghe giảng.

“Phóng nhãn thiên hạ ngoại công chi đạo vô số, nhưng mà phần lớn huấn luyện chi pháp lại là đi lên đường lệch.” Triệu Vân Hưng lạnh nhạt nói ra, hắn giờ phút này phảng phất một cái đế vương bình thường chỉ điểm giang sơn, đem mặt khác ngoại công phương pháp tu luyện phê bình không đáng một đồng.

“Tần Vũ, ngươi nhớ kỹ một điểm, tu luyện ngoại công, nhất định phải nghiên cứu triệt để Y Đạo!” Triệu Vân Hưng nhìn chằm chằm Tần Vũ, cường điệu đạo.

“Y Đạo?” Tần Vũ trong lòng mặc dù kỳ quái, nhưng là vẫn như cũ ghi tạc đáy lòng.

Triệu Vân Hưng tiếp tục nói: “Người vì cái gì tu luyện? Thứ nhất chính là vì khỏe mạnh trường thọ, thứ hai chính là để cho mình lực công kích càng tăng mạnh hơn. Tu luyện ngoại công người, muốn cho nắm đấm của mình chân cứng như kim cương, hoàn toàn chính xác, bọn hắn làm được. Thế nhưng là...... Bọn hắn nắm đấm là cứng rắn, thế nhưng là so ra mà vượt một thanh huyền thiết luyện chế ra tới chiến đao cứng rắn a?”

Tần Vũ nghe được nhíu chặt lông mày.

Huyền thiết, tương đối trân quý, luyện chế ra tới vũ khí cũng so với bình thường làm bằng sắt binh khí sắc bén cứng rắn nhiều, huyền thiết chiến đao sắc bén, tuyệt đối là vượt qua ngoại gia cao thủ quyền cước.

“Tỉ như cái kia rất dãy, đã đạt đến rèn luyện lực lượng đỉnh phong, khí lực của hắn là lớn, cơ bắp là mạnh, thế nhưng là...... Tốc độ của hắn đối với cao thủ mà nói lại là chậm. Ta chỉ cần một cây chủy thủ, có thể tại chốc lát cắt đứt cổ họng của hắn!” Triệu Vân Hưng lãnh đạm nói, trên thân tự nhiên tản mát ra sát khí.

Tần Vũ giờ phút này căn bản không nghi ngờ Triệu Vân Hưng lời nói, ngược lại con mắt càng sáng thêm hơn, nhìn chằm chằm Triệu Vân Hưng, nghe mỗi một câu nói.

“Nghiên cứu Y Đạo, nhưng biết nhân thể cơ bắp hơn trăm khối, riêng phần mình có riêng phần mình công dụng, mà nếu như vẻn vẹn huấn luyện một chỗ, sẽ tạo thành không tốt kết quả, lực lượng lớn, tốc độ thong thả. Hoặc là tay chân là mạnh, thế nhưng là thân thể không đủ linh mẫn. Tốc độ là nhanh, thế nhưng là thân thể cường hãn trình độ lại là không đủ......” Triệu Vân Hưng chậm rãi mà nói.

Tần Vũ giờ phút này hoàn toàn minh bạch Triệu Vân Hưng ý tứ, lúc này hưng phấn nói: “Lão sư, ta hiểu được, có phải hay không muốn rèn luyện tất cả cơ bắp?”

“Không.” Triệu Vân Hưng lắc đầu nói, “Dù cho ngươi muốn rèn luyện tất cả cơ bắp, ngươi biết như thế nào rèn luyện sao?”

Tần Vũ ngạc nhiên.

Bắp thịt toàn thân nhiều như vậy, muốn rèn luyện đến mỗi một khối cơ bắp đó cũng không phải là vẻn vẹn thực tiễn liền có thể làm được, đó là cần kinh nghiệm qua không biết bao nhiêu thế hệ nghiên cứu mới có thể đạt tới.

“Huống chi, dù cho có biện pháp này, cũng là không thể làm, tất cả cương nhu cùng tồn tại, ngoại công một đạo cũng là như thế, không thể luyện một mình một chỗ, đồng dạng, cũng không thể ăn tươi nuốt sống, cái gì đều luyện, cuối cùng ngược lại bởi vì tinh lực phân phối không đủ, dẫn đến chẳng làm nên trò trống gì.” Triệu Vân Hưng lắc đầu nói.

Tần Vũ mơ hồ.

Vẻn vẹn luyện một chỗ không đối, toàn bộ địa phương đều rèn luyện cũng không đúng, cái kia luyện cái gì đâu?

“Một cái thân thể hoàn mỹ, lực lượng mạnh hơn, tính dẻo dai nhất định phải tốt, lực bộc phát nhất định phải mạnh, tốc độ phải nhanh, phản ứng muốn linh mẫn, năng lực kháng đòn mạnh hơn.” Triệu Vân Hưng liên tiếp nói nhiều như vậy yêu cầu, Tần Vũ trong lúc nhất thời choáng tại chỗ, nhiều như vậy yêu cầu, thật là tu luyện thế nào?

Triệu Vân Hưng nhìn thấy Tần Vũ cái kia mắt trợn tròn dáng vẻ, khó được cười cười: “Đừng lo lắng, ta tự có biện pháp huấn luyện ngươi.”

Tần Vũ trong não chợt nhớ tới ưng trảo kia vương hoặc là thiết thối cao thủ, một trảo kia liền có thể tuỳ tiện bóp nát đá xanh, đó là kinh khủng bực nào chỉ lực, thế nhưng là cái này Triệu Vân Hưng vì cái gì chưa hề nói muốn huấn luyện cục bộ rèn luyện đâu?

“Lão sư, vì cái gì không giống Ưng Trảo công cái gì rèn luyện tay chân đâu?” Tần Vũ hỏi ngược lại.

Triệu Vân Hưng nghe được Tần Vũ đặt câu hỏi, ngược lại thật cao hứng, nói “Tần Vũ, nói có lý, tỉ như Ưng Trảo công Thiết Sa chưởng công phu, muốn tu luyện, nhất định phải rèn luyện chỉ lực, ngoại trừ, còn cần thường xuyên xoa thuốc rượu, để bàn tay hấp thu rượu thuốc dược lực, tăng thêm không ngừng rèn luyện, để bàn tay giống như như sắt thép.”

Tần Vũ nghe nhẹ gật đầu.

Hắn cũng nhìn qua ngoại công phương pháp tu luyện, đích thật là không ngừng rèn luyện lực lượng, đồng thời bên ngoài xoa thuốc rượu để cho bàn tay cực kỳ cứng rắn chờ chút.

“Như vậy rèn luyện, quả thực là...... Đồ đần cách làm!” Triệu Vân Hưng đột nhiên mắng, đối với cái này huấn luyện chi pháp rất là khinh thường.

“Lão sư, Ưng Trảo công rất lợi hại a, tại sao là đồ đần cách làm đâu?” Tần Vũ mặc dù so người đồng lứa thành thục rất nhiều, nhưng như cũ chỉ là hài đồng, hắn nhưng là nhìn thấy Ưng Trảo công cùng Thiết Sa chưởng lợi hại, không cách nào minh bạch Triệu Vân Hưng ý tứ.

Triệu Vân Hưng ngạo nghễ nói: “Ưng Trảo công? Thiết Sa chưởng? Dùng những cái kia thậm chí mang theo độc tính rượu thuốc bôi lên, cuối cùng để làn da hoàn toàn xơ cứng, ngay cả đau đớn đều cảm giác không thấy, đơn giản thành một kiện bao tay mà thôi. Tần Vũ, ngươi nhìn ta.”

Triệu Vân Hưng đưa tay phải ra, Triệu Vân Hưng tay phải trơn nhẵn, thậm chí có...... Non cảm giác.

Chỉ gặp bạch quang lóe lên, một gần như trong suốt bao tay liền xuất hiện ở Triệu Vân Hưng trên tay phía trên, Triệu Vân Hưng lạnh nhạt nói: “Thiên Tằm Ti bộ, mặc dù cũng coi là tương đối trân quý, nhưng là cũng thuộc về phàm vật, cùng huyền thiết một cái cấp bậc, chỉ cần bỏ được dùng tiền, liền có thể đạt được.”

Tần Vũ sinh ở vương phủ, tự nhiên biết.

Rất nhiều vật phẩm, tương đối tục chính là sắt thép các loại thường gặp, mà Thiên Tằm Ti cùng huyền thiết các loại mặc dù không nhiều, nhưng là vẫn như cũ không tính là bảo vật.

Bảo vật. Bình thường đều là chưa từng bên cạnh trong Hồng Hoang lấy được.

Tỉ như vô biên trong Hồng Hoang một chút cực kỳ lợi hại yêu thú, những yêu thú kia có so Tiên Thiên cao thủ còn lợi hại hơn, thậm chí vượt qua Thượng Tiên, những yêu thú kia da lông hoặc là móng vuốt sừng nhọn chờ chút, đó mới là đỉnh cấp bảo vật.

“Thiên Tằm Ti mặc dù tính bền dẻo bình thường, thế nhưng là cũng muốn so ưng trảo vương đám người bàn tay cứng cỏi.” Triệu Vân Hưng lấy một tảng đá xanh, tay phải dùng sức, liền tuỳ tiện đem đá xanh bóp thành nát bấy, thậm chí so ưng trảo vương bóp nát càng thêm triệt để.

Triệu Vân Hưng nhìn xem Tần Vũ Đạo: “Tần Vũ, chỉ lực bên trên ta không thể so với ưng trảo vương yếu, chỉ lực muốn rèn luyện, tuy nhiên lại không thể để cho trên tay làn da trở nên xơ cứng, ngươi minh bạch ý của ta a?”

Tần Vũ nhẹ gật đầu, nhưng là trái lại nghi ngờ nói: “Lão sư, ý của ngươi là bảo vệ tốt bàn tay, không để cho bàn tay giống những cái kia luyện Thiết Sa chưởng Ưng Trảo công người một dạng luyện thành như thế, thế nhưng là...... Như thế đã luyện chỗ tốt gì a. Còn có, thân thể đâu? Chẳng lẽ ta muốn mặc lấy áo giáp cùng người chém giết?”

Triệu Vân Hưng con mắt tỏa ánh sáng, khen ngợi nhẹ gật đầu, dạy một cái thông tuệ đệ tử, chính là nhẹ nhõm nhiều, rất nhiều chuyện một chút liền minh.

“Bảo vệ tốt bàn tay, không để cho bàn tay hoàn toàn xơ cứng, là vì công kích, bàn tay có thể cầm đao, cầm kiếm, dùng các loại vũ khí, đưa bàn tay bảo vệ tốt. Để bàn tay xúc giác bảo trì tại hoàn mỹ trạng thái là một cao thủ nhất định. Thậm chí rất nhiều cao thủ mỗi ngày đều dùng sữa bò đến cua tay.” Triệu Vân Hưng hồi đáp.

Tần Vũ lập tức giật mình.

Công kích, vẫn là phải dùng vũ khí, đao kiếm các loại cũng phải cần tay, một cái xúc giác đạt tới hoàn mỹ trạng thái tay, cùng một cái hoàn toàn xơ cứng đều không có cảm giác đau không có xúc giác tướng tay so, tự nhiên khống chế lên đao kiếm càng thêm chính xác.

Giết người, có lẽ ngay tại một chút ở giữa, không cho phép mảy may qua loa.

“Về phần chân, lực bộc phát nhất định phải mạnh, tốc độ phải nhanh, mà lại muốn linh mẫn. Vô luận là cao thủ chiến đấu, hay là tại trong thiên quân vạn mã, nếu như ngươi hai chân tốc độ nhanh cực hạn, linh mẫn đạt tới một mức độ khủng bố, thậm chí tại trong thiên quân vạn mã, không nhận mảy may thương.” Triệu Vân Hưng đạo.

Chân, quyết định một người thân pháp, tốc độ, lực bộc phát, phản ứng linh mẫn đương nhiên trọng yếu.

Tần Vũ giờ phút này càng thêm hưng phấn, hắn tựa hồ thấy được chính mình như là huyễn ảnh một dạng lấp lóe tại thiên quân vạn mã ở giữa, giết người chỉ là phất tay, địch nhân lại là không đụng tới chính mình mảy may. Cái này liền thân pháp, đây cũng là tốc độ, chân trọng yếu không gì sánh được.

“Tay, linh hoạt mà tốc độ nhanh, trên lực lượng không bằng chân, lại có thể cầm vũ khí tùy ý công kích. Mà chân, bản thân cơ bắp lực lượng liền lớn hơn cánh tay, lực công kích cực mạnh, mà lại quyết định thân pháp di động. Cả hai đều là quan trọng nhất, mà thân thể thân thể, chính là hạch tâm chủ thể......”

Lần thứ nhất ngày huấn luyện, Triệu Vân Hưng lại là tại hướng Tần Vũ quán thâu nàng Triệu Vân Hưng huấn luyện của mình phương pháp cơ bản nhất tinh túy, nguyên thủy nhất nguyên lý.

Tần Vũ tử tế nghe lấy, đem Triệu Vân Hưng mỗi một câu nói đều thật sâu khắc vào chỗ sâu trong óc......', 9),
( 1, N'cực hạn huấn luyện （ bên trên ）', N'Chương 10: cực hạn huấn luyện （ bên trên ）

Nói chuyện gần như một canh giờ, Tần Vũ hoàn toàn minh bạch lão sư của mình phương pháp huấn luyện nguyên lý, đồng thời Tần Vũ trong lòng cũng càng thêm bội phục Triệu Vân Hưng, hắn hoàn toàn có thể phán định ra, nếu như dựa theo Triệu Vân Hưng rèn luyện phương pháp, tuyệt đối là rèn luyện ra một cái thân thể hoàn mỹ.

Lực lượng, tốc độ, linh mẫn, tính dẻo dai chờ chút hoàn mỹ cân đối.

Công dục thiện kỳ sự, trước phải lợi nó khí.

Rèn luyện ra một cái thân thể hoàn mỹ, sau đó lại huấn luyện công kích, giết người cùng với khác thủ đoạn. Có thép tốt còn lo lắng không luyện được hảo đao a?

Sau đó, huấn luyện liền bắt đầu............

Đông Lam Sơn Vân Vụ Sơn Trang vài trăm mét bên ngoài một mỹ lệ Viên Hồ bên cạnh, Triệu Vân Hưng đứng tại bên hồ, ở bên cạnh hắn có một máy móc đồng hồ quả lắc, cái này máy móc đồng hồ quả lắc là tinh thông cơ quan chi đạo cao thủ tạo nên, bởi vì chế tạo quá rườm rà, chỉ có quý tộc người ta mới có.

Đồng hồ quả lắc phân hai mươi bốn tiếng, mười hai canh giờ, mỗi cái giờ 60 phút.

“Nhanh, du lịch nhanh lên!” Triệu Vân Hưng lạnh lùng nói ra.

Tại Viên Hồ công chính có một đạo thân hình không ngừng mà bơi lên, chính là Tần Vũ, dựa theo Triệu Vân Hưng thuyết pháp, bơi lội mặc dù phổ thông, lại là bồi dưỡng thân thể tính cân đối cùng tính dẻo dai cực kỳ tốt một loại phương pháp, cho nên Tần Vũ bị mệnh lệnh tại Viên Hồ bên trong không ngừng mà bơi lên.

“Rất muốn dừng lại a.” Tần Vũ cắn răng, không ngừng vẫy tay cánh tay, hai chân cũng cân đối đánh ra lấy nước, hắn đã bơi mười cái vừa đi vừa về, cái này Viên Hồ một cái vừa đi vừa về khoảng chừng 200 mét, mười cái vừa đi vừa về chính là 2000 mét.

Tần Vũ quá khứ thường xuyên tại Tây Uyển bên trong tắm suối nước nóng, trong ôn tuyền cũng rất sâu, Tần Vũ thường xuyên ở trong đó bơi lội, kỹ thuật bơi lội rất cao, thế nhưng là như vậy càng không ngừng du lịch, mà lại tại trong vòng thời gian quy định du lịch xong, đối với Tần Vũ tới nói, lại là quá thống khổ.

Chân đau xót, cánh tay ê ẩm, đầu óc phình to.

“Phụ vương!” vừa nghĩ tới chính mình phụ vương dáng tươi cười, Tần Vũ liền cắn răng tiếp tục kiên trì, dù cho đã đến cực hạn, thế nhưng là hắn vẫn như cũ kiên trì.

“Nhanh, nhanh hơn chút nữa.” Triệu Vân Hưng không có chút nào tình cảm lạnh nhạt thúc giục nói.

Tần Vũ trong mắt có một tia tàn nhẫn, gắt gao nhìn chằm chằm phía trước, nghe được Triệu Vân Hưng thanh âm, Tần Vũ trong lòng không ngừng yêu cầu mình tăng tốc, ngay lúc này, Tần Vũ nở đầu đột nhiên hơi một trận nhẹ nhõm, hai tay cùng hai chân tựa hồ lần nữa có khí lực.

Tần Vũ rõ ràng cảm nhận được, từ trong thân thể vậy mà lại sinh ra một cỗ khí lực, cỗ này khí lực không biết từ nơi nào đến, lại tự nhiên sinh ra. Tần Vũ trong mắt có tia này hưng phấn.

Siêu việt cực hạn.

Hắn hưởng thụ cảm giác như vậy, mỗi một lần siêu việt sinh lý cực hạn, đã không có khí lực thân thể nhưng từ sâu trong thân thể lần nữa sinh ra một đạo lực lượng, hắn thậm chí cảm nhận được thân thể biến hóa, đó là thân thể thâm tàng tại chỗ sâu tiềm năng.

“Tốt, chậm ba phút.” Triệu Vân Hưng nhìn cái kia máy móc đồng hồ quả lắc, lạnh nhạt nói ra.

Tần Vũ gian nan lên bờ bên cạnh, giờ phút này hắn đã động không được, đặc biệt là hai tay căn bản là không có cách động, chân cũng là chua lợi hại, Tần Vũ cứ như vậy thở hào hển, hết sức hô hấp lấy không khí mát mẻ, cố gắng để cho mình nhanh lên khôi phục.

“Ngươi chậm ba phút, hiện tại liền phạt ngươi từ cái này chạy về Tây Uyển, sau đó tại Tây Uyển sân luyện công tay không ngồi xổm sâu 100 cái.” Triệu Vân Hưng nói thẳng ra mệnh lệnh.

“Từ cái này chạy về Tây Uyển? Còn......” Tần Vũ thở hổn hển nói không ra lời, khó có thể tin nhìn xem Triệu Vân Hưng, giờ phút này hắn chân tính toán căn bản đều đi không được đường, cái này Triệu Vân Hưng lại còn để hắn chạy về đi, trả lại 100 cái ngồi xổm sâu.

“Ngươi có ý kiến?” Triệu Vân Hưng bình thản hỏi ngược lại.

“Ta có ý kiến, siêu việt nhân thể cực hạn là có thể rèn luyện thân thể, thế nhưng là, nếu như vượt qua quá nhiều, thân thể của ta sẽ vượt qua, ta cảm giác đã đến cực hạn, hiện tại không có khả năng lại tiếp tục rèn luyện, lão sư, vừa rồi bơi lội thời điểm, ta đã liên tục hai lần cảm nhận được loại kia cực hạn, ta cảm thấy mình chính mình không cách nào lại kinh lịch một lần cực hạn.” Tần Vũ Trực thẳng nhìn xem Triệu Vân Hưng, nói thẳng.

Triệu Vân Hưng lạnh nhạt nói: “Ta là lão sư, mệnh lệnh của ta ngươi nhất định phải phục tùng, nếu như ngươi cảm thấy huấn luyện của ta có vấn đề, không muốn vào đi huấn luyện, ta có thể lập tức rời đi. Ngươi dạng này lười biếng đệ tử, ta cũng không quan tâm.”

Tần Vũ sắc mặt hơi đổi một chút.

Sau đó Tần Vũ nhìn Triệu Vân Hưng một chút, hít sâu một hơi, cố gắng thúc giục hai chân chạy, bước đầu tiên chạy thời điểm chân trướng đến muốn mạng, chua lợi hại, thế nhưng là chạy một hồi, chân ngược lại có có sức lực.

“A, chuyện gì xảy ra?” Tần Vũ trong lòng chấn kinh.

Phía sau nhìn Triệu Vân Hưng nhếch mép cười: “Tiểu tử này, chẳng lẽ ta còn phán đoán không ra ngươi chân chính cực hạn? Bơi lội thời điểm cánh tay ngươi dùng sức thế nhưng là so chân lớn hơn, chân cơ bắp bản thân so cánh tay phát đạt, cánh tay đều kiên trì nổi, chân chí ít còn có thể tiến hành một tổ huấn luyện.”

Vừa nghĩ tới vừa rồi Tần Vũ chất vấn hình dạng của mình, Triệu Vân Hưng trong lòng cả cười đứng lên.

“Tiểu tử này.” cười lắc đầu, Triệu Vân Hưng đi theo Tần Vũ sau lưng.......

Chạng vạng tối, Tây Uyển trong ôn tuyền.

Đã trải qua một ngày cực hạn huấn luyện, giờ phút này Tần Vũ nằm trong suối nước nóng, cảm thụ được bắp thịt trận trận nhức mỏi, thậm chí có thể cảm giác được bắp thịt chậm rãi biến hóa. Tần Vũ một mặt hưởng thụ biểu lộ, rất có thâm tình hai tay triển khai cao giọng hô: “A, trời ạ, đây mới thật sự là hưởng thụ a!!!”

Tiểu Hắc cũng vung cánh ở một bên không ngừng quạt, tựa hồ rất là cao hứng.

Lạnh lùng nghiêm mặt Triệu Vân Hưng đi tới, đứng tại suối nước nóng bên cạnh, nói “Cái này Vân Vụ Sơn Trang suối nước nóng vô cùng có hiệu quả trị liệu, đối với thân thể ngươi rất có chỗ tốt. Còn có, chờ ngươi ngâm sau ba canh giờ, ngươi liền đi Ông Lão tiên sinh cái kia, tại cái kia bôi lên một chút rượu thuốc, hấp thu chút thuốc men hiệu, đối với thân thể ngươi rất có chỗ tốt.”

“Ân, biết rồi......” Tần Vũ giờ phút này rất sung sướng, tùy ý khua tay nói.

Triệu Vân Hưng cũng không thèm để ý, quay đầu rời đi.......

Sân luyện võ, Triệu Vân Hưng trực tiếp đứng tại đó, Tần Vũ cũng là sớm đã đến, lần này Tần Vũ nhưng không có đến trễ, nói đến kỳ quái, mặc dù hôm qua huấn luyện đạt đến cực hạn, thế nhưng là trải qua suối nước nóng hiệu quả trị liệu, lại thêm rượu thuốc công hiệu, hôm nay vậy mà sinh long hoạt hổ.

“Ngoại công có thể tu luyện tới cực hạn, trách không được phần lớn là gia đình giàu có nhà giàu con em quyền quý.” Triệu Vân Hưng trong lòng cảm thán nói.

Tu luyện ngoại công, không ngừng siêu việt nhục thể cực hạn, thế nhưng là thân thể cũng không chỉ là vẻn vẹn sinh ra lực lượng, nó đồng dạng còn cần hấp thu năng lượng, con em nhà giàu, có thể ăn đại bổ, ăn chuyên môn dược thiện, phối trân quý rượu thuốc, hơn nữa còn có thể xin mời Y Đạo cao thủ giúp ấn ma giải trừ thân thể mệt nhọc.

Có như thế điều kiện, rèn luyện lên ngoại công tự nhiên khác biệt.

“Hiện tại, chúng ta tiến hành lực lượng huấn luyện, cầm trong tay gậy sắt, tiến hành ngồi xổm sâu, trước 100 cái.” Triệu Vân Hưng tùy ý chỉ một cây gậy sắt, gậy sắt kia không tính quá thô, đoán chừng cũng liền mười cân tả hữu, đối với người trưởng thành tự nhiên nhẹ nhõm, thế nhưng là đối với mới tám tuổi Tần Vũ, lại khác biệt.

“Hừ!”

Tần Vũ hai tay vừa dùng lực, một hơi đem gậy sắt giơ lên chỗ ngực, còn hì hì cười nói: “Lão sư, rất nhẹ nhàng thôi.”

“Làm xong 100 cái lại nói.” Triệu Vân Hưng lạnh lùng nói.

Lúc này Tần Vũ bắt đầu ngồi xổm sâu, ngay từ đầu rất dễ dàng, không phải liền là trực tiếp đứng lên, lại ngồi xuống a? Thế nhưng là liên tiếp làm ba mươi về sau, Tần Vũ liền cảm thấy hai chân ê ẩm, lại kiên trì mười cái, bàn chân một chút liền cơ bắp căng gân.

100 cái?

Mới bốn mươi Tần Vũ liền khó chịu.

“Hô!” hít thở sâu một hơi, hơi ngừng chốc lát, bàn chân cơ bắp khôi phục xuống dưới, Tần Vũ lần nữa tiếp tục ngồi xổm sâu, thế nhưng là càng đi về phía sau càng là thống khổ, Tần Vũ trong mắt lóe ra hung ác ánh sáng, không ngừng cắn răng kiên trì lấy.

Một hơi kiên trì đến bảy mươi cái, Tần Vũ thậm chí cảm thấy chân cũng đứng lên không nổi nữa.

“Uống!”

Đột nhiên quát khẽ một tiếng, sống lưng vừa dùng lực, vậy mà quả thực là đứng lên, Tần Vũ trong mắt lại có một chút ánh sáng đang thiêu đốt, đó là vẻ hưng phấn.

“Uống!”

Lại là hét lớn một tiếng, Tần Vũ lần nữa đứng lên.

Lần lượt hét lớn, lần lượt cố gắng gạt ra chân thâm tàng mỗi một phần lực lượng, chân dần dần phát nhiệt, từng luồng từng luồng lực lượng từ cơ bắp chỗ sâu hiện ra đến, cứ như vậy, cơ hồ kỳ tích, theo Tần Vũ cuối cùng hét lớn một tiếng, hắn vậy mà hoàn thành cái thứ một trăm ngồi xổm sâu!

Tần Vũ mặc dù chân phù phiếm, phảng phất thời khắc phải ngã bên dưới, thế nhưng là trong mắt của hắn có lại là hưng phấn cùng thiêu đốt điên cuồng.

Một bên Triệu Vân Hưng âm thầm gật đầu.

“Hiện tại tiến hành chỉ lực huấn luyện.” Triệu Vân Hưng vẫn như cũ biểu lộ lạnh lùng, căn bản không cho Tần Vũ mảy may thời gian nghỉ ngơi, trực tiếp ra lệnh. Cái này Triệu Vân Hưng kỳ thật kế hoạch huấn luyện cũng là thiết kế tốt, giờ phút này Tần Vũ mệt nhất chính là chân, trên tay vẫn còn không có đến cực hạn, Triệu Vân Hưng liền tiến hành chỉ lực huấn luyện.

“Lão sư, chỉ lực huấn luyện như thế nào a?” Tần Vũ mặc dù chân cũng không dùng tới khí lực, thế nhưng là vẫn như cũ đối với Triệu Vân Hưng cười hì hì hỏi.

Tần Vũ càng ngày càng ưa thích loại kia siêu việt cực hạn cảm giác tuyệt vời, tại siêu việt cực hạn chốc lát, hắn cảm thụ một loại sinh mệnh kích tình, đối với, chính là kích tình, kích tình thiêu đốt, cực hạn điên cuồng. Loại cảm giác này rất mỹ diệu. ', 10),
( 1, N'cực hạn huấn luyện （ bên dưới ）', N'Chương 11: cực hạn huấn luyện （ bên dưới ）

“Chỉ lực, biện pháp tốt nhất là dựng ngược một tay luyện nhất chỉ thiền, bất quá ngươi bây giờ chỉ lực còn quá yếu, trước dựa theo Thiết Sa chưởng biện pháp ngay cả rèn luyện, đây là Thiên Tằm Ti Sáo, ngươi trước mang lên, rèn luyện chỉ lực tuyệt đối đừng phá hủy trên tay cơ bắp làn da.” Triệu Vân Hưng đem đã sớm chuẩn bị xong Thiên Tằm Ti Sáo ném cho Tần Vũ.

Tần Vũ lập tức mừng khấp khởi tiếp nhận Thiên Tằm Ti Sáo mang trên tay.

“Đây là bãi cát Bạch Sa, ngươi hai tay dùng toàn lực đi xúc, càng không ngừng xúc, đợi ta kêu dừng ngươi mới có thể dừng lại.” Triệu Vân Hưng chỉ vào bên cạnh cách đó không xa một trong nồi sắt Bạch Sa nói ra.

“Là, lão sư!”

Tần Vũ ngược lại đem cái này huấn luyện trở thành trò chơi, bất quá chân đích thật là đau nhức lợi hại, chịu đựng đau nhức kịch liệt, cắn răng mới đi đến mười mét bên ngoài nồi sắt bên cạnh, Tần Vũ mang theo Thiên Tằm Ti Sáo, liền càng không ngừng xúc xuống, mỗi một xẻng đều là cố gắng đến cùng.

“A!”

Tần Vũ trong miệng kìm lòng không được rên rỉ một tiếng, mặc dù có Thiên Tằm Ti Sáo có thể bảo hộ ngón tay, thế nhưng là Thiên Tằm Ti Sáo vẻn vẹn để hạt cát đụng chạm không tới tay chỉ mà thôi, thế nhưng là một tay xúc xuống, cái kia tác dụng lực thế nhưng là thực thực tác dụng trên tay.

Cái kia cực tốc xúc, Bạch Sa mang đến lực lượng để Tần Vũ ngón tay dần dần đau đớn muốn mạng. Tần Vũ kìm lòng không được vụng trộm giảm xuống xúc chiều sâu, nguyên bản xúc rốt cuộc bộ, nhưng là bây giờ xúc đến bình thường liền vươn ra, dạng này liền nhẹ nhõm nhiều.

“Xúc đến cùng, không cần lười biếng.”

Triệu Vân Hưng lạnh lùng nói.

Tần Vũ trong lòng máy động, chỉ có thể cắn răng lần nữa cắn răng kiên trì xuống dưới.

Mặc dù Tần Vũ ưa thích siêu việt cực hạn cảm giác, thế nhưng là tay đứt ruột xót, mười ngón từng đợt đau đớn để hắn thật rất thống khổ, dù sao hắn mới là một cái tám tuổi hài đồng, hơn nữa còn là Trấn Đông Vương tam nhi tử, địa vị tôn quý, đi qua chưa bao giờ từng ăn như vậy khổ.

“Phốc!”

Tay đột nhiên xúc rốt cuộc, kịch liệt đau đớn để Tần Vũ nước mắt đều kìm lòng không được chảy ra.

Triệu Vân Hưng lạnh nhạt nhìn xem, nhìn trước mắt mới tám tuổi hài đồng chảy nước mắt loá mắt trừng mắt không ngừng xúc cát bộ dáng, Triệu Vân Hưng tựa hồ không có chút nào lòng thương hại, còn không ngừng yêu cầu lấy......

Chảy nước mắt, nhưng như cũ muốn xúc.......

Rèn luyện cũng đã nửa năm, mỗi ngày rèn luyện, tăng thêm mỗi ngày lượng cơm ăn tăng vọt, để Tần Vũ thân thể so với quá khứ tráng lên rất nhiều.

Đông Lam Sơn một dưới thác nước.

“Uống!”

Triệu Vân Hưng một cái đá bay, vậy mà đem mấy khối nham thạch to lớn đá đến dưới thác nước, một lát, dưới thác nước liền xuất hiện do mấy khối nham thạch hình thành có thể trạm nhân địa phương, thác nước từ chỗ cao trút xuống, nện ở nham thạch mặt ngoài, tóe lên màu trắng bọt nước vô số.

“Hai chân định như núi, động như điện, thác nước này cũng không tính là gì lớn thác nước, ngồi xổm sâu lâu như thế, lấy chân của ngươi lực lượng hẳn là có thể tại dưới thác nước này trầm ổn trung bình tấn.” Triệu Vân Hưng chỉ vào đá xanh đạo, “Đứng ở phía trên đi, nhất định phải đứng vững.”

“Không tính là gì lớn thác nước?” Tần Vũ nhìn xem cái kia từ cực cao chỗ đáp xuống thác nước, lực trùng kích to lớn kia nện ở trên mặt đá, phát ra ngập trời tiếng ầm ầm, như vậy thác nước cũng không tính là thác nước, kia cái gì thác nước tính thác nước lớn đâu?

Trải qua nửa năm ngồi xổm sâu huấn luyện, giờ phút này Tần Vũ chân cơ bắp đã so với quá khứ không biết mạnh bao nhiêu.

“Là!” Tần Vũ lúc này chậm rãi đứng ở đá xanh bên cạnh, thác nước đáp xuống, đá xanh bên cạnh nhận áp lực cũng không lớn, Tần Vũ tại đá xanh bên cạnh, đâm trung bình tấn, còn có thể tương đối buông lỏng chống cự áp lực kia.

“Đứng ở trung ương đi.” Triệu Vân Hưng âm thanh lạnh lùng nói.

Tần Vũ trong lòng bất đắc dĩ, chỉ có thể chậm rãi di động tới bước chân, hướng trung ương di động đi qua, càng là hướng trung ương, dòng nước lực trùng kích liền càng lúc càng lớn, Tần Vũ đã cảm thấy thân thể tại lắc lư, thế nhưng là hắn ngài nhất định phải đến vị trí trung ương.

“Không tốt!”

Tần Vũ cảm thấy thân thể nhoáng một cái, dưới chân duy trì không được, liền lập tức bị xông vào trong hồ.

“Tiếp tục!” Triệu Vân Hưng lạnh nhạt nói.......

Trời tối, Tần Vũ nằm trong suối nước nóng, thoải mái hai mắt đều híp lại, mỗi một ngày trong suối nước nóng chính là Tần Vũ lớn nhất hưởng thụ lấy, đi qua còn không có cảm giác như vậy, nhưng là bây giờ mỗi ngày rèn luyện đến cực hạn, lại tiến vào trong ôn tuyền, bắp thịt toàn thân đều có từng đợt nhức mỏi cảm giác, rất thoải mái.

Tiểu Hắc nửa năm mới lâu một chút, chỉ là trên đỉnh đầu của nó vậy mà xuất hiện lông vũ màu vàng, những bộ vị khác vẫn như cũ là màu đen. Tiểu Hắc tốc độ sinh trưởng lại là so với bình thường ưng muốn chậm hơn nhiều, giờ phút này Tiểu Hắc cũng tại suối nước nóng bên cạnh, lung tung đung đưa.

Tần Vũ ngủ thiếp đi, trong suối nước nóng ngủ thiếp đi.

Mỗi một ngày ban ngày hắn đều đang huấn luyện, ban đêm muốn cua sáu giờ suối nước nóng, hắn đặc biệt trong suối nước nóng cố định một nằm ghế dựa, tắm suối nước nóng thời điểm ngay tại trong đó đi ngủ, mà đợi đến sau nửa đêm, để Y Đạo cao thủ Ông Nhàn giúp hắn xoa bóp cùng bôi lên rượu thuốc, khi đó, Tần Vũ liền có thể nhìn xem sách.

Có thể nói, hắn không lãng phí bất luận cái gì một phần thời gian.

Suối nước nóng bên cạnh, bỗng nhiên xuất hiện hai bóng người, chính là ngay cả giảng hòa Triệu Vân Hưng, hai người chính nhìn xem ngủ say sưa Tần Vũ.

“Tiểu Vũ còn chưa tới chín tuổi, hay là hài tử a.” nhìn xem Tần Vũ khóe miệng óng ánh nước bọt, cùng cái kia như cũ non nớt khuôn mặt nhỏ, ngay cả nói trong lòng một trận thương yêu, từ nhỏ mang theo Tần Vũ lớn lên, ngay cả nói hoàn toàn đem Tần Vũ trở thành cháu của mình đối đãi.

Triệu Vân Hưng khó được đất có vẻ tươi cười, nhìn xem Tần Vũ, gật đầu nói: “Tiểu Vũ hắn là một cái hài tử vô cùng kiên cường, ta cho hắn huấn luyện tuyệt đối là hắn chân chính cực hạn, nếu như vượt qua cực hạn này, thân thể của hắn liền muốn sụp đổ mất. Hắn lại có thể kiên trì nổi...... Lúc trước vương gia để cho ta luyện quân thời điểm, ta tại một cái mười vạn người trong đại quân tiến hành cực hạn huấn luyện, hoàn toàn đạt tới một cái bình thường quân nhân cực hạn, nhưng là chân chính có thể kiên trì đến một năm, chỉ có một ngàn người.”

Triệu Vân Hưng lần kia luyện quân, chủ yếu là bình thường quân nhân cũng không có khả năng giống Tần Vũ một dạng ăn trân quý dược thiện, tắm suối nước nóng giải trừ mệt nhọc, còn có chuyên môn Y Đạo cao thủ giúp ấn ma chờ chút.

Bất quá......

Những quân nhân kia đều là người trưởng thành, mà Tần Vũ lại chỉ là một đứa bé mà thôi. Một đứa bé đều có thể kiên trì nổi, cái này đích xác là để Triệu Vân Hưng kinh ngạc mà lại vui mừng.

Nhìn xem Tần Vũ ngủ say bộ dáng, ngay cả giảng hòa Triệu Vân Hưng cười liền đi ra, chỉ lưu đến Tần Vũ vẫn tại ngủ, hồn nhiên không biết có người đến qua, có chút giương miệng nhỏ, trên mặt nhưng lại có hạnh phúc nụ cười ngọt ngào, khóe miệng nước bọt kia sợi tơ óng ánh sáng long lanh.

Có lẽ...... Trong mộng, hắn đang cùng hắn phụ vương cùng một chỗ đi.

Phụ vương, đã nhanh hai năm đều không có tới qua một lần.......

Phụ trọng chạy huấn luyện, phụ trọng ngồi xổm sâu huấn luyện, dưới thác nước trung bình tấn huấn luyện, bị ngăn trở lực tình huống dưới liên tục tính dễ nổ huấn luyện, trong nước thụ nước lực cản tình huống dưới luyện quyền, cả ngày mặc phụ trọng hành động, tính dẻo dai huấn luyện, chỉ lực huấn luyện, phản ứng linh mẫn huấn luyện, tốc độ huấn luyện......

Các loại phương pháp huấn luyện, dựa theo quy luật nhất định, Triệu Vân Hưng đối với Tần Vũ tiến hành toàn phương vị huấn luyện. Tần Vũ cũng tại Triệu Vân Hưng trong khi huấn luyện, không ngừng đột phá sinh lý cực hạn, thân thể kỹ năng cũng đang nhanh chóng đề cao.

Một năm sau.

Chín tuổi Tần Vũ mặc quần dài, ở trần, toàn thân của hắn cơ bắp cũng không lồi ra, hiện ra cơ hồ hoàn mỹ hình giọt nước, liền giống như một cái báo săn một dạng.

“Tần Vũ, ý chí của ngươi rất kiên cường, cực hạn huấn luyện mặt khác không trọng yếu, trọng yếu nhất chính là cần ý chí kiên cường.” Triệu Vân Hưng nhìn xem Tần Vũ, trước nay chưa có mỉm cười nhìn xem Tần Vũ, “Lão sư muốn về quân đội, nhớ kỹ, cực hạn, khiêu chiến cực hạn, siêu việt cực hạn, chỉ cần ngươi không ngừng cố gắng xuống dưới, ngươi cuối cùng sẽ có một ngày sẽ thành công.”

Tần Vũ nhìn trước mắt lão sư, đã qua một năm, Tần Vũ thậm chí âm thầm phẫn nộ lão sư của mình vô tình, mỗi một lần Tần Vũ đều là chảy nước mắt không ngừng huấn luyện, thế nhưng là hôm nay nhìn thấy lão sư trên mặt nụ cười vui mừng, hắn bỗng nhiên tất cả đều minh bạch.

“Lão sư, ta nhất định sẽ không để cho ngươi thất vọng.” Tần Vũ nhìn xem Triệu Vân Hưng, kiên định nói.

Triệu Vân Hưng mỉm cười gật đầu, sau đó đột nhiên quay người, nhanh chân mà đi, trực tiếp ra Vân vụ sơn trang, theo một tiếng liệt hổ tiếng hổ gầm, Tần Vũ con mắt cũng hơi ửng đỏ đứng lên, Tần Vũ minh bạch, từ hôm nay trở đi......

Hắn đem một thân một mình tiến hành bản thân huấn luyện. ', 11),
( 1, N'ánh rạng đông （ bên trên ）', N'Chương 12: ánh rạng đông （ bên trên ）

Vô biên Hồng Hoang, bên trong núi non trùng điệp, rừng cây vô biên, yêu thú thâm tàng tại bên trong, Hồng Hoang diện tích to lớn, căn bản không người có thể biết, Đông Vực Tam Quận đối ngoại tuyên bố tổng cộng có 600. 000 đại quân, trong đó có 400, 000 tại trú đóng ở Hồng Hoang bên cạnh.

Còn có 200. 000 đại quân tại Hắc Thủy Sơn Mạch bên ngoài, Hắc Thủy Sơn Mạch bên trong có sơn tặc gần như 200. 000, là thiên hạ đệ nhất sơn tặc chỗ, bởi vì những sơn tặc này hết sức quen thuộc Hắc Thủy Sơn Mạch địa hình, zhan có địa lợi, cho nên Trấn Đông Vương khống chế 200. 000 đại quân một mực trú đóng ở Hắc Thủy Sơn Mạch bên ngoài, chấn nhiếp Hắc Thủy sơn tặc.

Hồng Hoang bên cạnh sắt phong thành, Nhất Sâm Nghiêm phủ đệ trong phòng, giờ phút này Trấn Đông Vương Tần Đức chính bưng lấy một quyển sách, lẳng lặng mà nhìn xem.

“Vương gia.” Triệu Vân Hưng đứng ở ngoài cửa khom người nói.

“Vân Hưng, ngươi vào đi.” Tần Đức căn bản không ngẩng đầu lên, nói thẳng, Triệu Vân Hưng liền khom người đi vào trong phòng, đứng tại gian phòng một bên lẳng lặng chờ Tần Đức Phát nói, đối với Trấn Đông Vương Tần Đức, Triệu Vân Hưng trong lòng có chỉ là sùng kính.

Tần Đức thả ra trong tay sách, ngẩng đầu nhìn về phía Triệu Vân Hưng, khẽ mỉm cười nói: “Vân Hưng a, ngươi chỉ dạy Vũ Nhi cũng có một năm, nói cho ta nghe một chút, Vũ Nhi hắn ở ngoại công một đạo trên có không có tiền đồ.”

“Vương gia, Tam điện hạ hắn phi thường khắc khổ, phi thường cố gắng, nghị lực chi kiên rất nhiều người trưởng thành đều không kịp.” Triệu Vân Hưng lúc này nói ra, Tần Đức trên mặt có chút có vẻ tươi cười, Triệu Vân Hưng tiếp tục nói, “Bất quá Tam điện hạ trời sinh tư chất chỉ có thể coi là trung thượng, từ trước ngoại công muốn tu luyện tới cực hạn, đại đa số đều là trời sinh tư chất cực cao người. Có thể có Vân Vụ Sơn Trang suối nước nóng tẩm bổ, cùng thường xuyên phục dụng trân quý dược thiện, Tam điện hạ vẫn là có hi vọng đạt tới ngoại công cực hạn.”

Ngoại công cực hạn, chính là ngày kia cực hạn, tiếp cận với tiên thiên cảnh giới. Ngoại công tu luyện tới tình trạng như thế, dù cho đối đầu nội công Tiên Thiên tiền kỳ cao thủ cũng có thể liều lên một phen.

“Cần bao nhiêu năm?” Tần Đức hỏi ngược lại.

Triệu Vân Hưng suy nghĩ một lát, nói “Đoán chừng cần 30 năm thời gian. Đây là Tam điện hạ nhất định phải một mực kiên trì. Ngoại công một đạo, càng là đến cuối cùng thì càng khó mà tiến bộ, tỉ như khí lực, Tam điện hạ tu luyện cái vài chục năm đến một tay ba bốn trăm cân không có vấn đề. Thế nhưng là ngoại công cực hạn, hẳn là đạt tới một tay 700~800 cân, càng là về sau càng khó. 30 năm, không sai biệt lắm.”

Tần Đức lắc đầu thở dài một hơi: “30 năm quá lâu, bất quá vài chục năm có thể có sức tự vệ cũng miễn cưỡng xem như không tệ.”

“Tốt, Vân Hưng ngươi đi về trước đi.” Tần Đức cười một tiếng nói ra, Triệu Vân Hưng lập tức khom người nói: “Thuộc hạ cáo lui.” sau đó Triệu Vân Hưng rời đi gian phòng kia, chỉ lưu đến Tần Đức một người ở trong đó, hồi lâu sau, trong phòng vang lên một trận thở dài trầm thấp......

******

Thác nước trùng kích xuống, Tần Vũ ghim trung bình tấn, quả thực là ở dưới thác nước trên tảng đá kiên trì.

Cảm thụ được thác nước lực trùng kích kia, Tần Vũ trong lòng âm thầm may mắn, may mắn ngay từ đầu rèn luyện thời điểm, Triệu Vân Hưng liền chú trọng tại thân thể năng lực kháng đòn, còn thường xuyên dùng rượu thuốc thoa khắp toàn thân, cái này khiến Tần Vũ năng lực kháng đòn không nhỏ, nếu không căn bản chịu không được thác nước lực trùng kích.

“Kiên trì.”

Tần Vũ không ngừng ở trong lòng yêu cầu mình, Triệu Vân Hưng đã không tại, không có người yêu cầu hắn, Tần Vũ trong lòng cũng từng có qua lười biếng suy nghĩ, dù sao chỉ một mình hắn một mình huấn luyện, hắn lười biếng cũng không có người răn dạy. Mà lại hắn hay là hài tử.

Bất quá...... Ý nghĩ kia cùng một chỗ, liền bị hắn bóp chết.

Đại ca của mình, chính mình nhị ca, thậm chí phụ thân của mình, không có một cái nào là lười biếng, không có một cái nào là kẻ yếu.

Hắn thân là Tần gia tử tôn, thân là Trấn Đông Vương Tần Đức nhi tử, tự nhiên cũng sẽ không là kẻ yếu.

Cố gắng!

“Kiên trì, kiên trì!” cảm thấy chân như nhũn ra, Tần Vũ không ngừng trong lòng vì chính mình động viên, hắn thậm chí cảm nhận được chân bắp thịt rung động, mỗi một lần kiên trì lâu, cơ bắp chỗ sâu đều sẽ lần nữa tuôn ra lực lượng.

Đột nhiên ——

Chân tê rần, Tần Vũ liền bị “Bồng” một tiếng vọt vào trong hồ nước.......

Sân luyện công, treo ngược lấy từng cái bao cát, hết thảy sáu cái bao cát, Tần Vũ liền lẳng lặng đứng ở trong đó.

“Uống!”

Tần Vũ hét lớn một tiếng, bỗng nhiên một quyền nện ở một hạt cát túi bên trên, cơ hồ tại chốc lát, Tần Vũ đồng thời đập ba bốn bao cát, những cái kia bao cát nhoáng một cái du, liền đụng phải khác bao cát, lập tức toàn bộ bao cát bầy đều rung chuyển lên.

Không có chút nào quỹ tích, một hạt cát túi vốn là hướng phía trước vọt tới, thế nhưng là cùng một cái khác bao cát đụng một cái, nhưng lại là mặt khác quỹ tích.

“Bồng!”“Bồng!”“Bồng!”“Bồng!”“Bồng!”

Tần Vũ hai mắt phát ra tinh mang, hai tay nhanh chóng đánh về phía mỗi một cái đánh thẳng tới bao cát, đây là huấn luyện tốc độ phản ứng, tốc độ phản ứng cùng cánh tay cơ bắp có quan hệ, đồng thời còn cùng cá nhân phản ứng có quan hệ, phản ứng trải qua huấn luyện, cũng là có thể đề cao.

Cao thủ chi chiến, thời khắc sinh tử, phản ứng nhanh lên chốc lát liền có thể đoạt tính mạng người.

Theo Tần Vũ Địa nhanh chóng đập nện, những cái kia bao cát lắc lư tốc độ cũng càng lúc càng nhanh, Tần Vũ trong lúc nhất thời cũng cảm thấy áp lực lớn lên, đột nhiên phía sau lưng va chạm, Tần Vũ liền không tự chủ được thân hình vừa loạn, lập tức đồng thời ba bốn bao cát đập vào trên người hắn.

“Bồng!”

Tần Vũ lập tức ngã xuống trên mặt đất, trở mình một cái hắn lại bò lên.

“Tê ~~~” Tần Vũ hít vào một ngụm khí lạnh, liền hướng đầu gối nhìn lại, đầu gối giờ phút này đã hoàn toàn bị ma sát phá, máu tươi chảy ra, mà trên mặt đất thì là có một chút cát đá, hiển nhiên chính là ngã xuống thời điểm đầu gối đánh tới những này cát đá.

“Vậy mà không có quét dọn sạch sẽ.” Tần Vũ bất đắc dĩ, đang huấn luyện trước đó, chính hắn thế nhưng là quét dọn qua một lần, ai muốn vậy mà không có quét dọn sạch sẽ.

“Tiếp tục.”

Cũng không để ý điểm ấy thương thế, Tần Vũ đem những này cát đá xa xa quét ra, sau đó lại xông vào bao cát trung ương, lần nữa tiến hành phản ứng huấn luyện đứng lên.......

Vẻn vẹn mặc quần cộc nằm trên ghế, Tần Vũ toàn thân bôi trét lấy rượu thuốc tại trong sân trong tay cầm sách, giờ phút này trong sân có mấy cái đèn lồng lóe lên, Tần Vũ tại nhất đăng lồng bên cạnh, có thể thấy rõ ràng trên thư tịch chữ viết.

Mặc dù lão sư Triệu Vân Hưng trở về, thế nhưng là Tần Vũ cũng không không có giảm xuống mảy may yêu cầu, thậm chí càng thêm nghiêm khắc, mỗi ngày huấn luyện cả ngày, ban đêm đến nửa đêm là trong suối nước nóng hấp thu trong ôn tuyền tẩm bổ, để thân thể khôi phục, đồng thời cũng là Tần Vũ lúc ngủ ở giữa.

Mà giờ khắc này vừa mới tại Ông Nhàn cái kia bôi lên rượu thuốc sau, chính là đọc sách thời gian.

“Đã thật lâu không có đi đỉnh núi ngắm sao.” Tần Vũ ngửa đầu nhìn xem đầy trời tinh thần, nhếch mép cười, “Bất quá ở trong viện ngắm sao cũng cũng không tệ lắm, Tiểu Hắc, ngươi nói đúng không? Ai, Tiểu Hắc, ta nói ngươi có còn hay không là ưng a, làm sao lớn lên chậm như vậy, đỉnh đầu còn rất dài lông vàng?”

Tần Vũ nói sờ lên một bên “Tiểu Hắc”.

Tiểu Hắc hai mắt ẩn hiện quang mang, còn liên tục vỗ cánh, tựa hồ không cho phép Tần Vũ sờ đầu của hắn, sau đó còn đắc ý ngẩng lên đầu lâu, lộ ra rất là cao ngạo.

Tần Vũ lập tức nở nụ cười.

“Tính toán, không cùng ngươi lãng phí thời gian, ta phải nghiêm túc xem sách, ngày mai còn muốn tiếp tục huấn luyện đâu.” Tần Vũ lúc này nhìn lên trong tay hình đường thẳng thư tịch, đó là một bản Y Đạo thư tịch, Tần Vũ Khả nhớ rõ, lúc trước Triệu Vân Hưng nói qua, muốn trở thành một cái chân chính ngoại công cao thủ, nhất định phải tinh thông Y Đạo.

Tại sân nhỏ bên cạnh cửa, ngay cả Ngôn Chính Tàng tại chỗ bóng tối, Từ Tường nhìn xem Tần Vũ.

Đặc biệt là nghe được Tần Vũ nói không lãng phí thời gian cùng Hắc Ưng chơi đùa, ngay cả nói trong lòng càng là tuôn ra một trận thương yêu, Tần Vũ mới chín tuổi, lại không lãng phí trong một ngày bất luận cái gì thời gian, mỗi một phần thời gian Tần Vũ đều kế hoạch thật tốt. Hết thảy cũng là vì đau khổ rèn luyện, nhưng mà đây hết thảy vì cái gì đâu?

Tần Đức đã cực kỳ lâu chưa có tới Vân Vụ Sơn Trang.

Xem sách, trong lúc bất tri bất giác trời đã sáng rồi, Tần Vũ cái ghế cái khác một chút bánh ngọt chờ chút trong lúc vô tình cũng bị Tần Vũ ăn sạch.

Tần Vũ thả ra trong tay thư tịch, ngẩng đầu nhìn, rất là thống khoái duỗi lưng một cái, vẻ mặt tươi cười xán lạn nói “Một ngày thời khắc ở chỗ sáng sớm, một ngày mới lại đến, Tần Vũ, cố gắng! Cố gắng ngươi liền sẽ thành công.”

Một ngày mới huấn luyện lại bắt đầu......', 12),
( 1, N'ánh rạng đông （ bên dưới ）', N'Chương 13: ánh rạng đông （ bên dưới ）

Trong ôn tuyền, Tần Vũ ánh mắt kiên định đang đứng vào trong đó.

Tuyệt đối đừng coi là Tần Vũ là tại tắm suối nước nóng, hắn là đang tiến hành trong nước có trở ngại lực tính dễ nổ huấn luyện. Trong nước có trở ngại lực tính dễ nổ huấn luyện, đôi này thân thể lực bộc phát có trợ giúp. Cùng tại cái khác trong hồ nước rèn luyện, còn không bằng ngay tại trong ôn tuyền rèn luyện, trong ôn tuyền đến một lần nước một dạng có trở ngại lực, thứ hai còn có thể không ngừng tẩm bổ thân thể, nhất cử lưỡng tiện.

Ra quyền! Thu quyền!

Xuất thối! Thu chân!

Tần Vũ ở trong nước cực tốc ra quyền đá chân, mỗi một lần Tần Vũ đều bộc phát ra lực lượng mạnh nhất, để cho mình tốc độ đạt tới nhanh nhất, Tần Vũ trung bình tấn một đâm, ở trong nước cũng không lắc lư, đây cũng là trung bình tấn tu luyện hồi lâu mới có công lực.

Dòng nước cuồn cuộn, có kỳ đặc có quỹ tích, Tần Vũ mỗi một lần đều để nắm đấm của mình chân tốc độ càng tăng nhanh hơn, rất là tự nhiên bắt đầu nắm đấm hoặc là chân quỹ tích bắt đầu biến hóa. Ra quyền hẳn là cái gì quỹ tích đâu?

Thẳng tắp?

Đường cong?

Đều không đối! Mọi thứ không thể tuyệt đối, thẳng tắp đường cong lẫn nhau hỗn hợp, hết thảy cũng là vì nhường ra quyền càng nhanh, lực lượng càng lớn, nhận lực cản càng thêm nhỏ, hết thảy theo đuổi lực lượng mạnh hơn, tốc độ nhanh hơn, Tần Vũ càng không ngừng công kích tới.

Giờ phút này Tần Vũ cánh tay cùng trên đùi còn trói chặt có nho nhỏ khối sắt............

Sân luyện võ, Tần Vũ vẻn vẹn mặc quần cộc, ghim trung bình tấn, một bên đang có một gã hộ vệ đại hán, đại hán trên tay đang có một cây bổng, giờ phút này Tần Vũ Chính đang tiến hành kháng đòn huấn luyện, thân thể chỉ có không ngừng tiến hành sắp xếp đánh, hấp thu rượu thuốc, mới có thể để cho thân thể càng thêm rắn chắc cường hãn, huấn luyện đến cực hạn, thậm chí có thể ngăn cản đao thương.

“Dương Thúc, lực lượng lớn một chút a.” Tần Vũ rất là không hài lòng đối với bên cạnh đại hán Dương Sơn nói ra.

Dương Sơn vội vàng khuyên: “Tam điện hạ, không sai biệt lắm, sắp xếp đánh có thể kết thúc.” Dương Sơn nhìn xem Tần Vũ trên thân từng đầu vết tích màu đỏ, nhìn nhìn lại Tần Vũ trên gương mặt non nớt chẳng hề để ý biểu lộ, liền cảm thấy một trận đau lòng, Tần Vũ 6 tuổi năm đó, Dương Sơn bọn hắn là cùng nhau đến Vân Vụ Sơn Trang, hơn ba năm này đến, bọn hắn thế nhưng là đều nhìn hài tử này lớn lên, ai bỏ được đánh hài tử này đâu?

Nhưng là Dương Sơn lại bị bách nhất định phải đánh, bởi vì đây là ngoại công huấn luyện kháng đòn huấn luyện.

“Ta để cho ngươi đánh liền đánh, tính toán, ta tự mình tới đánh đi.” Tần Vũ lắc đầu cười một tiếng, nói liền muốn cầm qua cây gỗ.

Dương Sơn xem xét, vội vàng một cái bay ngược, quả thực là không để cho Tần Vũ chính mình cầm cây gỗ, hoảng hốt vội nói: “Tốt, tốt, ta tiếp tục đánh, lực lượng lớn một chút đúng không, ta đã biết.” Dương Sơn cũng không dám cho Tần Vũ chính mình đánh, Tần Vũ đánh chính mình, đây chính là hoàn toàn hướng cực hạn đánh, Dương Sơn còn nhớ rõ hôm đó Tần Vũ trên thân thậm chí đều bị đánh vỡ.

“Đùng!”“Đùng!”“Đùng!”“Đùng!”......

Cây gỗ lần lượt đập tại Tần Vũ trên thân, Tần Vũ ghim trung bình tấn, mím môi, quả thực là khiêng, không nói một lời, từng cái từng cái vết tích màu đỏ xuất hiện tại Tần Vũ trên thân thể, cái này khiến Dương Sơn trong lòng cảm thấy một trận khó chịu, hắn mặc dù bây giờ tham gia quân ngũ, thế nhưng là chín tuổi thời điểm, đang ở nhà chăn trâu đâu. Thế nhưng là thân là Trấn Đông Vương vương phủ Tam điện hạ Tần Vũ lại là không lãng phí bất luận cái gì thời gian, không ngừng rèn luyện, muốn đạt tới nhân thể cực hạn.

Tần Vũ con mắt giống như tinh thần một dạng, từ trong ánh mắt liền có thể đánh giá ra Tần Vũ quyết tâm, đó là Thái Sơn giống như không thể lay dời.......

“Tiểu Vũ a, hôm nay huấn luyện đo qua một chút, ngày mai hơi giảm bớt một chút huấn luyện số lượng.”

Tần Vũ Chính nằm tại mặc vào, tóc trắng phơ lão giả một lần là Tần Vũ xoa bóp một lần đối với Tần Vũ lo lắng nói, lão giả này chính là Ông Nhàn, là một cái Y Đạo cao thủ, tại Trấn Đông Vương trong vương phủ cũng số một số hai Y Đạo cao thủ, Tần Đức lúc trước đem Ông Nhàn phái đến Vân Vụ Sơn Trang, còn từng để cho người trong vương phủ kinh ngạc vương gia làm sao bỏ được đem một cái Y Đạo cao thủ phái đến một núi trang đâu.

“Không có việc gì, Ông Gia Gia ngươi như thế đặc biệt thủ pháp xoa bóp một lần, tăng thêm rượu thuốc, ngày thứ hai ta một chút việc đều không có.” Tần Vũ nhếch miệng, không thèm để ý chút nào.

Ông Nhàn hai tay động tác không nhanh, tuy nhiên lại có nội quy luật, hoặc đập, hoặc theo vò, hoặc điểm, hoặc phủ, các loại thủ pháp đều là khác biệt, mà lại Ông Nhàn trên tay hay là bôi lên có rượu thuốc, theo hắn đặc biệt xoa bóp bí pháp, những thuốc này rượu dược hiệu cực tốc dung nhập Tần Vũ thể nội.

Nhìn thấy Tần Vũ không quan tâm bộ dáng, Ông Nhàn cười lắc đầu, đồng thời không nhịn được đem chân khí trong cơ thể cũng dung nhập xoa bóp bí pháp bên trong.

“Sảng khoái a.” Tần Vũ cảm thấy thân thể từng đợt ấm áp, không tự kìm hãm được thoải mái kêu lên.

Ông Nhàn cười cười, nếu như không phải hắn nguyện ý, ngoại nhân dù cho thân phận lại cao hơn, hắn cũng sẽ không như vậy dốc hết toàn lực, ngay cả thể nội nội lực cũng không keo kiệt mảy may, mà đối với Tần Vũ, Ông Nhàn cũng rất là quan tâm, dù sao nhìn thấy một đứa bé con mỗi ngày như vậy rèn luyện, hắn lại thế nào không mềm lòng đau lòng a?

“Tốt, Tiểu Vũ a, về sau lúc huấn luyện không nên quá liều mạng, cái kia Triệu Vân Hưng cũng vậy, cái gì cực hạn phương pháp huấn luyện, nếu như không phải cái này Vân Vụ Sơn Trang suối nước nóng còn có ta mỗi ngày giúp ngươi khơi thông kinh lạc, dung nhập rượu thuốc dược hiệu tiến vào thân thể ngươi, ngươi một đứa bé làm sao chịu nổi a!” Ông Nhàn giận dữ nói, hiển nhiên đối với Triệu Vân Hưng rất là bất mãn.

Tần Vũ đối với Ông Nhàn xán lạn cười một tiếng, nói “Biết rồi, Ông Gia Gia ngươi tốt nhất rồi. Ông Gia Gia đi ngủ sớm một chút đi, gặp lại!” Ông Nhàn lập tức gật đầu cười, cũng dặn dò Tần Vũ một phen, Tần Vũ liền rời đi Ông Nhàn trụ sở.

Tối nay, bầu trời đầy sao, sáng chói cực kỳ.

“Lão sư đi, theo mỗi ngày huấn luyện, thân thể của ta cũng đem càng ngày càng mạnh, huấn luyện số lượng nhất định phải gia tăng, mà lại...... Còn hẳn là gia tăng mặt khác một chút phương pháp huấn luyện.” Tần Vũ nhìn lên bầu trời ngôi sao, thầm nghĩ trong lòng.

Sau đó Tần Vũ trực tiếp đi vào Bắc Uyển mật thất dưới đất trong đám, các loại cơ quan mở ra phương pháp Tần Vũ đều là thuộc nằm lòng.

Tiến vào cất giữ có bí tịch trong mật thất, bàn dài phía trên chính trưng bày từng quyển từng quyển bí tịch, những bí tịch này Tần Vũ đều không có thu hồi, dù sao mật thất này mở ra phương pháp chỉ có hắn cùng ngay cả nói mới biết được, Tần Vũ lúc này nhìn về phía 28 bản ngoại công bí tịch.

Những này ngoại công trên bí tịch có các loại rèn luyện phương pháp, Tần Vũ nghĩ nơi này tìm ra một chút thích hợp bản thân biện pháp đến.

Bỗng nhiên, Tần Vũ ánh mắt không tự giác bị trong bí tịch duy nhất một vòng màu vàng hấp dẫn, 96 bản bí tịch, trong đó chỉ có một quyển là giấy vàng tạo thành, lóe lên Winky kim quang, tự nhiên bắt mắt không gì sánh được, chính là « Tổ Long Quyết ».

Một cái ý niệm trong đầu đột nhiên xuất hiện tại Tần Vũ trong đầu.

“Lúc trước ta tu luyện nội công không thành, nhưng là ta hiện tại rèn luyện thân thể cũng có hơn một năm, so với quá khứ mạnh rất nhiều, nói không chừng đan điền vấn đề tự động biến mất đâu.” Tần Vũ trong lòng nghĩ như vậy đến, dù sao bình thường thân thể có bệnh người, tu luyện công phu sau, bình thường bệnh sẽ tự động biến mất.

Thế nhưng là Tần Vũ lại quên đi, đan điền của hắn cùng thường nhân khác biệt, đó cũng không phải bệnh. Mà là trời sinh.

Có thể Tần Vũ hay là hài tử, mà lại cũng một mực hi vọng thực lực mình nhanh chóng gia tăng, có suy nghĩ này cũng là bình thường.

“Bất kể như thế nào, thử trước một chút lại nói, dù sao cũng lãng phí không được mấy cái thời gian.” Tần Vũ lúc này khoanh chân ngồi ở trên giường, cầm qua « Tổ Long Quyết » cứ dựa theo thiên thứ nhất nội dung bắt đầu tu luyện, tâm linh hoàn toàn tĩnh lặng, nhập minh minh phiêu miểu bên trong......

Chỉ một lát sau, Tần Vũ liền cảm nhận được thiên địa linh khí bị hút vào thể nội trở thành một dòng nước nóng, mà lại so hơn một năm trước lần kia nhiệt lưu phải lớn hơn không ít.

“Quả nhiên, thân thể cường hãn, hấp thu thiên địa linh khí đều nhanh bên trên không ít. Bắt đầu vận chuyển Chu Thiên.” Tần Vũ lập tức ý niệm khống chế đám kia nhiệt lưu tại thể nội vận chuyển, dựa theo « Tổ Long Quyết » tiểu chu thiên quỹ tích, nhiệt lưu không ngừng chuyển biến, sau đó liền bị dung nhập trong đan điền.

Tần Vũ trong lòng kích động, cẩn thận cảm thụ được cái này một phần nhỏ nội lực có thể hay không bị tản mất.

“Nhất định không cần tán a, nhất định không cần.” Tần Vũ trong lòng chờ mong, lực chú ý thì là càng thêm tập trung, tất cả tinh thần hoàn toàn cảm thụ được cái này một phần nhỏ nội lực. Cực hạn huấn luyện, nhất rèn luyện người tinh thần, Tần Vũ thời gian dài như vậy rèn luyện, lực lượng tinh thần thì là so với thường nhân mạnh lên rất nhiều, cũng so với lúc trước lần thứ nhất tu luyện mạnh lên không biết bao nhiêu lần.

Hắn rõ ràng cảm nhận được những nội lực kia ở trong đan điền chậm rãi tản ra, sau đó hướng bốn phương tám hướng dọc theo toàn thân tán đi ra đi.

“Ai, lại thất bại.” Tần Vũ trong lòng thở dài.

Đột nhiên ——

“Không đối!” Tần Vũ phảng phất phát hiện kinh thiên đại bí mật một dạng, tất cả tinh thần hoàn toàn tập trung ở những cái kia tản ra trong nội lực, những nội lực kia mặc dù phần lớn từ toàn thân tản vào trong không gian, thế nhưng là lại còn có bộ phận vậy mà dung nhập thân thể cơ bắp xương cốt bên trong.

Nói cho đúng, Tần Vũ cơ bắp xương cốt giống như đất cát một dạng, những nội lực kia là giống như dòng nước, dòng nước từ trên đất cát di chuyển, nhưng như cũ bị hấp thu một bộ phận nước. Đây là một cái đạo lý, nội lực mặc dù di chuyển tiến vào ngoại giới, thế nhưng là vẫn như cũ có bộ phận nội lực năng lượng bị hấp thu.

Tần Vũ lập tức con mắt tỏa sáng.

“Quá tốt rồi, quá tốt rồi, quá tốt rồi.” Tần Vũ kích động toàn thân phát run, “Hấp thu rượu thuốc dược hiệu, mặc dù để thân thể cơ bắp được bổ sung, thế nhưng là làm sao có thể cùng nội lực so sánh đâu? Ta không cách nào tích súc nội lực, lại là cơ bắp lại có thể hấp thu nội lực năng lượng, để cơ bắp càng mạnh, để ngoại công tu luyện càng tăng nhanh hơn, càng thêm cấp tốc!”

Tần Vũ giờ phút này kích động phi thường, hắn thậm chí cũng nghe được trái tim kịch liệt nhảy lên.

“Phụ vương, ta nhất định sẽ thành công.” Tần Vũ trong mắt tản mát ra sáng rực hào quang, chưa từng có một khắc, Tần Vũ là tự tin như vậy.

Tần Vũ tu luyện ngoại công gian nguy mờ tối con đường đồ thượng, một đạo ánh rạng đông đang sáng lên......', 13),
( 1, N'cực tốc thuế biến （ bên trên ）', N'Chương 14: cực tốc thuế biến （ bên trên ）

Nội lực năng lượng dung nhập trong cơ thể, Tần Vũ cơ bắp xương cốt lập tức không ngừng thuế biến, hấp thu nội lực năng lượng, cơ bắp tính dẻo dai cùng tiềm lực đều không ngừng đề cao, cái này khiến Tần Vũ thân thể rèn luyện, lấy một loại từ xưa tới nay chưa từng có ai nghĩ tới tốc độ gia tăng lấy.

Thời gian trôi qua......

Tần Vũ bản thân thực lực cũng phi tốc gia tăng......

Hơn nửa năm sau.

Triệu Vân Hưng trở về cũng có thời gian một năm, Tần Vũ 10 tuổi.

Đông Lam Sơn trên sơn đạo, Tần Vũ ánh mắt giống như Ưng Chuẩn bình thường, hoàn toàn nhìn chằm chằm phía trước, hai chân mở ra lấy nhanh chân phi tốc chạy nhanh, ngoại nhân căn bản là không có cách tưởng tượng trên hai cánh tay của hắn còn tất cả mang theo nặng năm cân làm bằng sắt hộ cụ, hai chân bên trên cũng riêng phần mình mang theo nặng mười cân làm bằng sắt hộ cụ, trên người làm bằng sắt sau lưng cũng kém không nhiều có nặng hai mươi cân.

Tần Vũ cực tốc chạy nhanh, căn bản không ngừng.

Cái này phụ trọng thêm bộ vị khác biệt, chạy trình độ khó khăn cũng khác biệt. Nếu như vẻn vẹn cõng lên người, chí ít hai chân chạy còn nhẹ nhõm điểm, thế nhưng là phụ trọng tăng thêm cánh tay cùng trên đùi, hai chân này bắt đầu chạy liền cần cực lớn khí lực.

Đồng dạng, đây cũng là rèn luyện Tần Vũ chân cánh tay lực bộc phát biện pháp.

Đỉnh núi đã ở trong tầm mắt, Tần Vũ trên mặt không nhịn được có một tia nụ cười xán lạn.

“Hơn nửa năm này lực lượng tiến bộ vượt qua phía trước hơn một năm huấn luyện, bắp thịt tiềm lực cùng tính bền dẻo đều đề cao quá nhiều, mà lại hấp thu nội lực đối với bắp thịt tính dẻo dai, xa so với mặt khác rèn luyện hiệu quả tốt hơn. Ân, tiếp tục cố gắng!” Tần Vũ trong mắt đều là hưng phấn, hơn nửa năm qua này đến, mỗi ngày đêm khuya hắn không ngừng tu luyện nội công, mặc dù Đan Điền không cách nào tích súc nội lực, thế nhưng là trên thân cơ bắp lại hấp thu một bộ phận tán phát nội lực.

Giờ phút này Tần Vũ cơ bắp co dãn cùng tính dẻo dai, thậm chí tiềm lực đều cao hơn không ít.

Trong bóng tối một mực đi theo Tần Vũ tam đại nội công cao thủ, trong lòng cũng là kinh ngạc không gì sánh được.

Cái này ba đại cao thủ một mực âm thầm bảo hộ Tần Vũ, bọn hắn cũng lo lắng Tần Vũ một người lúc huấn luyện thừa dịp không nổi thụ thương hoặc là ngất đi, bọn hắn liền có thể xuất thủ cứu trợ. Thế nhưng là hơn nửa năm qua này, mắt thấy Tần Vũ không ngừng gia tăng huấn luyện độ khó, gia tăng biên độ thậm chí để tam đại nội công trong lòng... Cao thủ đều chấn kinh, thế nhưng là Tần Vũ quả thực là đều chống đỡ nổi.

Dưới thác nước.

Tần Vũ cùng vừa rồi một dạng phụ trọng, ghim trung bình tấn tại thác nước phía dưới, thụ lấy thác nước dòng nước xiết trùng kích.

“Uống!”

Tại thác nước trùng kích vào, Tần Vũ quát khẽ lấy, còn thỉnh thoảng phi tốc đập nện ra song quyền, quyền ảnh như gió như sấm, từng quyền đập nện lấy thác nước. Như vậy rèn luyện cánh tay lực công kích, cái kia bọt nước tức thì bị đập nện văng tứ phía, dưới ánh mặt trời chiếu sáng, phát ra thất thải quang mang rất là chói mắt.

Tần Vũ trung bình tấn nhất định, thì là cổ tùng bình thường không nhúc nhích.

“Phụ trọng gia tăng, chân này bộ nhận áp lực quả nhiên lớn rất nhiều.” Tần Vũ cắn môi một cái, cố gắng để hai chân đứng càng thêm ổn.

Giờ phút này, Tần Vũ hai chân chẳng những nhận thác nước lực trùng kích, còn nhận trên thân phụ trọng áp lực, kiên trì đương nhiên khó khăn rất. Bất quá phụ trọng tồn tại, cũng làm cho Tần Vũ trọng lực gia tăng, trọng tâm ổn không ít. Tại thác nước không ngừng trùng kích vào, Tần Vũ hai chân nhận áp lực càng lúc càng lớn.

Đạt tới loại kia trạng thái cực hạn, cần chính là kiên trì.

Sinh lý cực hạn đỉnh phong, Tần Vũ rõ ràng cảm nhận được, cơ bắp chỗ sâu liền tuôn ra từng dòng nước ấm, để hai chân lần nữa có được lực lượng, bởi vì cơ bắp hấp thu nội lực, bây giờ mỗi lần đạt tới cực hạn đột phá thời điểm chỗ cảm thụ lực lượng so với quá khứ đều phải lớn hơn không ít, điều này cũng làm cho Tần Vũ tiến bộ nhanh hơn rất nhiều.

Đêm.

Tần Vũ nhắm mắt khoanh chân ngồi ở trên giường, không ngừng hấp thu thiên địa linh khí, sau đó chuyển hóa thành nội lực đi vào trong đan điền. Sau đó những nội lực kia liền tứ tán ra, không ngừng bị Tần Vũ rèn luyện rèn luyện cơ bắp thì là như cùng đường đồ đói khát lữ nhân, không ngừng hấp thu nội lực.

Một đêm qua đi, Tần Vũ mở mắt.

“Giống như ta nghĩ, rèn luyện số lượng càng lớn, cơ bắp hấp thu nội lực cũng càng nhiều. Hôm nay hấp thu nội lực không sai biệt lắm là tổng số lượng một phần năm nhiều.” Tần Vũ trên mặt có đều là hưng phấn, nội lực tán đi tốc độ rất nhanh, đại bộ phận đều là tản vào thiên địa trong không gian, chỉ có một bộ phận rất nhỏ bị hấp thu, hiện tại có thể hấp thu một phần năm, đã rất cao.

Tần Vũ đột nhiên đứng dậy, lập tức cảm giác toàn thân tràn đầy lực lượng.

Nội lực bị hút vào trong cơ thể, cái này khiến trong cơ thể bộ ẩn tàng tiềm lực đề cao thật lớn.

“Một ngày mới đến, tiếp tục huấn luyện.” Tần Vũ cười một tiếng, liền vọt ra khỏi phòng.......

Một ngày lại một ngày huấn luyện, Tần Vũ thân thể cũng lặng lẽ phát sinh thuế biến, trưởng thành theo tuổi tác, Tần Vũ đến tuổi dậy thì phát dục tuổi tác!

Tuổi dậy thì phát dục.

Đây là nhân thể trên sinh lý một cái phi tốc đề cao thời kỳ.

Lập tức, Tần Vũ Phạn số lượng bỗng nhiên mà tăng mạnh rồi, thân thể các hạng cơ năng càng tăng nhanh hơn đề cao, 10 tuổi đến 11 tuổi cái này ròng rã thời gian một năm, là Tần Vũ rèn luyện ba năm qua tiến bộ lớn nhất một năm, trong năm đó, hắn chẳng những thân thể phát dục, xương cốt gia tăng cơ bắp tăng nhiều, mà lại mỗi ngày cơ bắp hấp thu nội lực xác suất cũng cao hơn rất nhiều.

11 tuổi một năm này, Tần Vũ thân cao liền đạt đến khoảng một mét sáu, cả người thực lực có thể nói là lật ra mấy cái té ngã.

Sân luyện võ, Tần Vũ mặc quần áo luyện công màu đen tùy ý ngồi, rất là khó được không có nghỉ ngơi.

Người mặc quần áo luyện công, vẻn vẹn từ bề ngoài căn bản nhìn không ra, giờ phút này Tần Vũ hai tay đều có mười cân bao cổ tay phụ trọng, trên đùi càng là đều có lấy hai mươi cân hộ thối phụ trọng, còn mặc bốn mươi cân thiết bối tâm, cả người chẳng khác gì là cõng 100 cân, bất quá đây đối với cực hạn huấn luyện ba năm Tần Vũ tới nói, không đáng kể chút nào.

“Điểm ấy khí lực còn kém rất đâu.” Tần Vũ vừa nghĩ tới lúc trước tám cái ngoại công cao thủ, hắn đã cảm thấy chính mình rất kém. Cái kia rất dãy một tay 800 cân, toàn thân cõng ngàn cân đoán chừng đều là dễ như trở bàn tay, Tần Vũ cùng mà so sánh với, hoàn toàn chính xác rất kém.

Bất quá Tần Vũ quên đi.

Hắn mới tu luyện ba năm, nếu như không phải Triệu Vân Hưng sau khi đi hắn phát hiện tu luyện nội lực diệu dụng, muốn đạt tới cảnh giới như thế, tối thiểu nhất cần thời gian sáu, bảy năm. Mà lại Tần Vũ đi đường đi cũng cùng mặt khác ngoại công cao thủ khác biệt.

Một bộ thân thể, chẳng những muốn nhìn lực lượng, còn phải xem tính dẻo dai, tốc độ, lực bộc phát, năng lực kháng đòn chờ chút rất nhiều.

Tần Vũ trên lực lượng không kịp cái kia rất dãy, thế nhưng là chỉ luận về tốc độ, rất dãy cái kia man hán thậm chí đều không kịp Tần Vũ, Tần Vũ tốc độ là thật nhanh. Mà lại thân thể của hắn tính dẻo dai cũng rất tốt, viễn siêu bình thường ngoại công cao thủ.

Một cái thùng gỗ chứa nước, không phải nhìn cao nhất khối kia tấm ván gỗ, mà là thấp nhất khối kia tấm ván gỗ, cân bằng rất trọng yếu!

Nhìn một cái, ngồi trên ghế Tần Vũ cả người liền giống như tràn ngập lực lượng con báo một dạng.

Ba năm rèn luyện, tăng thêm thân thể phát dục, Tần Vũ vóc dáng cũng có một mét sáu, Tần Vũ cũng từ hài đồng tấn cấp Thành thiếu năm, hơn nữa còn là một cái so với bình thường người trưởng thành đều muốn lợi hại nhiều thiếu niên, giờ phút này người thiếu niên đang trầm tư.

“Lão sư nói qua, ngoại công rèn luyện, đầu tiên muốn rèn luyện ra một cái thân thể hoàn mỹ, sau đó thông qua thân thể này lại học tập các loại chiến đấu chi pháp. Bất quá chiến đấu chém giết biện pháp không phải một ngày hai ngày liền có thể học xong, ta hiện tại hẳn là bắt đầu học được.”

Tần Vũ trong mắt lóe ra cơ trí quang mang.

Ba năm qua, trong thư phòng Y Đạo thư tịch cùng với khác không ít sách vở Tần Vũ đều xem hết, sách nhìn càng nhiều, Tần Vũ trong não logic năng lực liền càng cao, cân nhắc sự tình góc độ cũng đuổi sát bản chất, hắn đối với lúc trước Triệu Vân Hưng lời nói thể ngộ cũng liền càng thêm sâu.

“Từ hôm nay trở đi, ban ngày một nửa thời gian dùng để tiếp tục rèn luyện thân thể, một nửa kia thời gian thì là lĩnh ngộ thuộc về chính ta phương pháp công kích.” Tần Vũ đột nhiên đứng lên, trực tiếp đi ra sân luyện công, hướng thư phòng đi đến, trên thân vẫn như cũ mặc trăm cân phụ trọng. Tần Vũ hắn một ngày hai mươi bốn tiếng, trừ tắm rửa, lúc khác cơ hồ đều không thoát phụ trọng.

Một cái hoàn mỹ thân thể hình thức ban đầu đã hình thành, như thế nào lợi dụng thân thể này đến tiến hành công kích đâu?

Triệu Vân Hưng có biện pháp của mình, Tần Vũ đương nhiên cũng sẽ có chuyên thuộc về biện pháp của mình. Chỉ có căn cứ từ bản thân thể sáng lập ra phương pháp công kích, mới là tốt nhất, uy lực lớn nhất phương pháp công kích. Tần Vũ hiện tại muốn làm, chính là lĩnh ngộ sáng chế công kích như vậy chi pháp!', 14),
( 1, N'cực tốc thuế biến （ bên trong ）', N'Chương 15: cực tốc thuế biến （ bên trong ）

Thời gian trôi qua, Tần Vũ trừ rèn luyện bên ngoài mặt khác phần lớn thời gian đều dùng đến lĩnh ngộ công kích của mình phương pháp, hắn đem chính mình lĩnh ngộ phương pháp công kích muốn làm định tại ba cái phương diện: thân pháp, cận thân công kích, vũ khí.

Thân pháp.

Thân pháp cùng trốn tránh phòng ngự có quan hệ, cùng cận thân công kích có quan hệ, cùng truy tung đào mệnh có quan hệ. Tần Vũ đối với thân pháp yêu cầu chính là: tựa như tia chớp cấp tốc, như thỏ khôn bình thường linh mẫn. Nghiên cứu thân pháp, muốn nghiên cứu kỳ môn độn giáp chi thuật, còn muốn nghiên cứu mặt khác các loại thân pháp.

Cận thân công kích.

Trong quá trình huấn luyện, Tần Vũ phát hiện mình thích khiêu chiến cực hạn, ưa thích nhiệt huyết sôi trào, được tuyển chọn công kích thời điểm, hắn lựa chọn tu luyện...... Đanh cận chiến! Đanh cận chiến, chốc lát liền có thể có thể quyết định sinh tử, hung hiểm nhất, cũng tương tự càng thêm tràn ngập sinh mệnh kích tình.

Vũ khí!

Đến nay Tần Vũ còn không có quyết định dùng cái gì vũ khí, đao thương côn bổng mười tám giống như vũ khí, đều có các chỗ đặc thù, Tần Vũ càng ưa thích dùng nắm đấm của mình chân, chí ít tạm thời còn không có quyết định lựa chọn vũ khí gì.

Trong thư phòng.

Tần Vũ bưng lấy một quyển sách, tên sách là « Dịch Kinh ».

“Ân, chương này đạo lý tựa hồ...... Tựa hồ cùng « Tổ Long Quyết » tấm thứ ba trên giấy thân pháp « Vân Long Cửu Hiện » tương đối giống a.” Tần Vũ thì thầm trong miệng, sau đó khép lại sách vở trên tay, trong lòng rất tự nhiên bắt đầu sắp xếp như ý nhìn thấy một chút tri thức.

Từng đầu nhìn thấy các loại thân pháp nguyên lý, hoặc là mặt khác độn giáp chi thuật, không ngừng thổi qua Tần Vũ trong lòng......

“Lục nghi, Tam Kỳ, tám môn, cửu tinh bố cục, thành kỳ môn độn giáp chi thế, Bát Môn Thành Đỗ, thương, cảnh, đừng, sinh, chết, kinh, mở. Kỳ môn độn phân trời, cửa, tam bàn, tức là Tam Tài......” kỳ môn độn giáp một chút cơ bản khái niệm tại Tần Vũ trong não mọc rễ.

Những này mặc dù là cơ bản nhất, nhưng lại là cơ sở nhất, vô số trận pháp độn thuật đều là từ những này cơ bản nhất một chút đạo lý diễn tan ra đến.

Các loại huyền ảo thân pháp, hoặc nhiều hoặc ít đều có nó ảnh hưởng.

Tần Vũ bởi vì là tu luyện ngoại công, mà lại thể nội không có nội lực. Bình thường khinh công thân pháp là không cách nào tu luyện, chỉ có thể sáng chế thuộc về mình. 68 bản nội công bí tịch, bình thường đều có kèm theo một chút đối ứng nội công quyền pháp, đao pháp, thân pháp chờ chút.

Thậm chí 28 bản ngoại công trong bí tịch cũng có các loại công kích chi pháp.

Tần Vũ hải nạp bách xuyên, xem 96 bản nội ngoại công các loại phương pháp công kích, các loại thân pháp, sau đó kết hợp nhìn thấy kỳ môn độn giáp Dịch Kinh tổng cương, tìm một chút thân pháp cất giấu chí lý, những này đều phi thường khó khăn, thế nhưng là Tần Vũ không phân ngày đêm, chỉ cần vừa kết thúc rèn luyện thân thể, phải cố gắng nghiên cứu.......

Muốn tu luyện ngoại công cực hạn, nhất định phải nghiên cứu Y Đạo. Đây là Triệu Vân Hưng ngày đầu tiên dạy bảo Tần Vũ lời nói, mà giờ khắc này Tần Vũ đang xem lấy Y Đạo thư tịch, ba năm qua, Tần Vũ đã nhìn rất nhiều Y Đạo thư tịch, trong lòng trải nghiệm cũng có rất nhiều.

“Mỗi một phần lực lượng, mỗi một phần công kích cũng phải làm cho địch nhân bỏ ra lớn nhất đại giới. Một chưởng trảm kích tại đối phương trên bụng, nhiều nhất để cho người ta đau bụng một chút mà thôi, thế nhưng là đồng dạng một chưởng lại có thể chém vỡ cổ họng của đối phương, để cho người ta mất mạng.”

Tần Vũ Hợp dâng thư tịch, trong mắt quang mang Winky.

Nhân thể các loại yếu hại, Tần Vũ trong não nhớ tinh tường, thân thể xương cốt khớp nối, kinh mạch chỗ giao hợp, khí huyết lưu thông chỗ. Công kích yếu hại, công kích nặng huyệt, công kích sinh lý mềm yếu chỗ, hoặc bắt chi pháp đoạn xương người ca khớp nối chờ chút.

Tóm lại, Tần Vũ công kích nguyên lý chính là: để mỗi một phần lực lượng đều đạt tới lớn nhất lực tổn thương, tuyệt đối không lãng phí một chút lực lượng!

Một tay có 100 cân lực lượng, lại muốn đạt tới một tay 200 cân cao thủ lực công kích, thậm chí càng thêm lợi hại lực công kích!

Muốn làm đến điểm ấy, nhất định phải từ từng cái phương pháp cố gắng, thân pháp, công kích yếu hại, lợi dụng chung quanh thiên thời địa lợi, lợi dụng đối thủ biến hóa trong lòng chờ chút các loại tình huống. Tần Vũ rất tự tin, hắn có tốc độ, lực bộc phát, tính dẻo dai chờ chút từng cái phương diện đều rất cân đối thân thể, còn có các loại bí tịch thờ hắn tham khảo.

Vào lúc giữa trưa, sân luyện võ.

Từng cái máy móc mộc nhân đặt ở sân luyện võ, hình thành một cái Mộc Nhân Hạng, đây là máy móc chúng đại sư tuyệt đỉnh thành quả, muốn đánh qua Mộc Nhân Hạng, độ khó rất lớn, tuyệt không phải người thường có thể phá, Tần Vũ hôm nay lại là quyết định lợi dụng Mộc Nhân Hạng đến rèn luyện chính mình cận thân công kích chi pháp.

Tần Vũ đứng tại Mộc Nhân Hạng phía trước, không nhúc nhích, đột nhiên, Tần Vũ xông vào Mộc Nhân Hạng bên trong, một cái tác động đến nhiều cái, đụng phải cái thứ nhất mộc nhân, toàn bộ Mộc Nhân Hạng tất cả mộc nhân đều bắt đầu chuyển động, Tần Vũ trong mắt có chỉ là tỉnh táo.

“Phanh!”“Phanh!”“Phanh!”“Phanh!”“Phanh!”......

Hai tay như là thiểm điện cực tốc công kích, trực tiếp cây gãy người khớp nối. Hai chân chủ phòng ngự, khi thì đến cái kình đá, một chân gãy mộc, Tần Vũ tốc độ rất nhanh, chỉ là bởi vì giờ phút này hắn thoát khỏi phụ trọng, bởi vì Tần Vũ minh bạch, hắn mặc vào cái kia trăm cân phụ trọng, căn bản không có khả năng phá cái này Mộc Nhân Hạng.

Bỏ đi trăm cân phụ trọng, Tần Vũ tốc độ cực nhanh, thế nhưng là...... Mộc Nhân Hạng mộc nhân nhiều lắm, Tần Vũ vẫn là bị chung quanh một cây người đánh tới đầu, bị đánh đến một chút, ngay sau đó liên tục bị công kích mấy cái, Tần Vũ chỉ có thể một cái ngay cả lăn, lập tức trốn thoát.

“Không sai, mỗi một từng cái mộc nhân khớp nối cùng nhân thể xương cốt khớp nối tương cận, kiểu tu luyện này hiệu quả đã tốt lắm rồi.” Tần Vũ trong mắt phát sáng, lần nữa xông vào Mộc Nhân Hạng.

Mộc Nhân Hạng tại Tần Vũ trong kế hoạch bất quá là tương đối dễ dàng phương pháp huấn luyện, Mộc Nhân Hạng phía trên còn có Đồng Nhân Hạng, dĩ nhiên không phải dùng đồng đúc kim loại một cái đồng nhân, mà là tại mộc nhân mặt ngoài đắp lên một tầng đồng sắt da, cứ như vậy, đồng nhân công kích cùng phòng ngự đều muốn rõ ràng mạnh lên một cái cấp độ.......

Đến cùng dùng cái gì vũ khí, Tần Vũ một mực không có lấy định chủ ý, một ngày này đêm khuya, Tần Vũ lại đang trong mật thất cẩn thận quan sát mỗi bản bí tịch bên trong có kèm theo phương pháp công kích, trong đó đa số đao kiếm, cũng có số ít kỳ lạ vũ khí.

“A?” Tần Vũ bỗng nhiên lật ra một bản nội công bí tịch, ở trong đó một chương giảng thuật kiếm pháp thời điểm, nhắc nhở có dạng này một đoạn văn. “Bản môn Tàn ảnh kiếm mặc dù là ám sát chi kiếm, nhưng mà nếu bàn về ám sát cận chiến chi kiếm, thứ nhất vẫn nếu bàn về Vu Thị Nhất Kiếm, mặc kệ giết người nào, sát thủ “Vu Thị” chưa từng có thất bại qua, năm đó càng là tổ chức sát thủ “Thiên võng” truyền kỳ tính đệ nhất sát thủ.”

Tần Vũ lấy làm kinh hãi.

Thiên võng, Tần Vũ cũng là nghe nói qua, đây là một cái phi thường cổ lão, thậm chí có quá ngàn năm lịch sử tổ chức sát thủ, thế lực càng là trải rộng toàn bộ Tiềm Long Đại Lục. Tiềm Long Đại Lục ba cái quốc gia lịch sử đều không có “Thiên võng” dài. Sát thủ này “Vu Thị” vậy mà danh xưng truyền kỳ tính đệ nhất sát thủ, cái kia nó thủ đoạn giết người khẳng định không được.

Bỗng nhiên ——

Tần Vũ hai mắt trợn tròn xoe.

“Vu Thị Nhất Kiếm, Vu Thị Nhất Kiếm, a, « Tổ Long Quyết » tấm thứ ba trên giấy mặt trái tựa hồ nói đến.” Tần Vũ lúc trước nhìn kỹ « Tổ Long Quyết » « Tổ Long Quyết » ba tấm trên giấy vàng gần như một nửa là nội công bí tịch, còn có một nửa là thân pháp « Vân Long Cửu Hiện » quyền pháp « Viêm Long Quyền » kiếm pháp « Cửu Dương Liệt Thiên Kiếm » mà cái gọi là Vu Thị Nhất Kiếm, chỉ là cuối cùng miêu tả một chút mà thôi, Tần Vũ lúc trước không có quá để ý nhìn.

Giờ phút này Tần Vũ mới hiểu được, tại « Tổ Long Quyết » bên trong không đáng chú ý “Vu Thị Nhất Kiếm” lại là cái gọi là truyền kỳ tính đệ nhất sát thủ kiếm pháp.

« Tổ Long Quyết » nội công tâm pháp hấp thu thiên địa linh khí tốc độ cực nhanh, tại các loại nội công tâm pháp bên trong tuyệt đối thứ nhất. Thân pháp « Vân Long Cửu Hiện » quyền pháp « Viêm Long Quyền » kiếm pháp « Cửu Dương Liệt Thiên Kiếm » đều là cực kì khủng bố lợi hại, thế nhưng là cái này lại cần « Tổ Long Quyết » nội công phối hợp tu luyện, Tần Vũ chỉ có thể làm nhìn lại không cách nào tu luyện.

Lật ra cuối cùng một trang giấy, Tần Vũ rốt cục thấy được có quan hệ với thị một kiếm một chút tin tức.

“A, lại còn có tu luyện Vu Thị Nhất Kiếm phương pháp.” Tần Vũ nhãn tình sáng lên, trong lòng một trận cuồng hỉ, ai cũng không nghĩ tới « Tổ Long Quyết » bên trong lại còn có « Vu Thị Nhất Kiếm » phương pháp tu luyện, Tần Vũ lập tức bắt đầu cẩn thận đọc đứng lên, thế nhưng là càng xem sắc mặt hắn liền càng tái nhợt, đến phía sau thậm chí sắc mặt đều có chút phát xanh.', 15),
( 1, N'cực tốc thuế biến ( bên dưới )', N'Chương 16: cực tốc thuế biến （ bên dưới ）

Vu Thị một kiếm, là một loại phi thường tàn khốc phương pháp tu luyện, đây là Vu Thị gia tộc gia truyền phương pháp, cũng không biết vì sao xuất hiện tại « Tổ Long Quyết » bên trên.

Vu Thị mỗi một thời đại nam tính hài nhi đều làm “Vu Thị một kiếm” người thừa kế người ứng cử, khi những hài nhi này vừa ra đời thời điểm, liền hủy đi những hài nhi này dung mạo, nhưng mà Vu Thị gia tộc âm thầm phái người hầu phân biệt mang theo một đứa bé đến khu dân nghèo.

Hài nhi này bị người hầu tra tấn, tăng thêm bởi vì hủy dung nhận người kỳ thị, nhận hết nhân gian ấm lạnh, tâm tính trở nên cực kỳ phẫn hận thế gian, đợi đến hắn lớn lên thời điểm Vu Thị gia tộc lại mang về, bị truyền lấy chuyên môn nội công, đồng thời tiến hành Vu Thị một kiếm đặc huấn.

Đặc huấn rất đơn giản, chính là huấn luyện giết người. Đầu tiên dùng tử thi huấn luyện, khiến cái này người ứng cử không ngừng dùng đoản kiếm công kích tử thi yếu hại, mỗi cái tử thi đều muốn bị kiếm đâm nát hư thối sau mới có thể ném đi, đợi đến nhắm mắt đều có thể tuỳ tiện công kích đến địch nhân yếu hại sau, chính là không ngừng chấp hành nhiệm vụ.

Vu Thị một kiếm, một kích giết người, hết thảy chỉ có hai bước ——“Tàng kiếm, xuất kiếm”.

Vu Thị một kiếm không ra thì đã, vừa ra tất sát người.

Đơn giản, vô cùng đơn giản, đơn giản muốn mạng, tuy nhiên lại danh xưng ám sát bên trong kiếm thứ nhất.

“Hài nhi kỳ bị hủy dung, liền nhận tra tấn, một mực bị người kỳ thị, không có thân tình không có người trợ giúp, đợi đến khi trưởng thành lại là cả ngày cùng tử thi làm bạn, không ngừng đâm nát tử thi, cho đến hư thối. Huấn luyện như thế, thực sự quá biến thái thật là buồn nôn.” Tần Vũ sắc mặt rất là khó coi.

Vừa nghĩ tới hủy đi hài nhi dung mạo, dùng tử thi huấn luyện, chỗ này vị “Vu Thị một kiếm” liền để Tần Vũ cảm thấy rất là chán ghét. Như vậy bồi dưỡng sát thủ thực sự quá mức biến thái.

“Sát khí, Vu Thị truyền nhân quỷ dị nhất doạ người!”

« Tổ Long Quyết » bên trên cuối cùng liên quan tới cái này “Vu Thị một kiếm” phán định để Tần Vũ trong lòng khẽ giật mình, suy nghĩ một lát, Tần Vũ hoàn toàn minh bạch “Vu Thị một kiếm” đáng sợ, vì cái gì “Vu Thị một kiếm” danh xưng ám sát bên trong kiếm thứ nhất.

Tần Vũ khắp khuôn mặt là chấn kinh: “Đáng sợ, đáng sợ, cái này thiết kế ra “Vu Thị một kiếm” phương pháp huấn luyện người thực sự thật là đáng sợ. Những cái kia hài nhi từ nhỏ bị hủy dung nhận kỳ thị, không có bất kỳ cái gì thân tình, tâm lý hoàn toàn vặn vẹo, sau khi lớn lên huấn luyện đâm nát tử thi, cả ngày cùng tử thi làm bạn. Cuối cùng chính là không ngừng chấp hành nhiệm vụ, dạng này hài nhi từ nhỏ đáy lòng liền có cực sâu lệ khí, sau đó cả ngày cùng tử thi làm bạn, lệ khí sẽ càng thêm khủng bố, một khi giết người, vẻn vẹn chốc lát bộc phát ra lệ khí liền sẽ để đối thủ tâm thần đại loạn.”

Tần Vũ chậm rãi hít sâu hai cái, bình tĩnh lại.

Bởi vì thường xuyên cô độc một người, Tần Vũ cũng thường xuyên thói quen suy nghĩ một ít chuyện.

“Cái này “Vu Thị một kiếm” có thể danh xưng ám sát kiếm thứ nhất, có hai cái phương diện, thứ nhất chính là bồi dưỡng doạ người khí thế, thứ hai chính là đơn giản nhất xuất kiếm.” Tần Vũ trong lòng âm thầm tổng kết, “Từ hài nhi thời kỳ bắt đầu bồi dưỡng thâm tàng dưới đáy lòng lệ khí, đợi cho trưởng thành thời khắc liền mười phần khủng bố. Lúc giết người, đoán chừng cái kia lệ khí liền có thể để đối thủ tâm cảnh đại loạn, đến lúc đó cực tốc xuất kiếm, một kiếm giết địch.”

Vu Thị một kiếm, hai bước “Tàng kiếm, xuất kiếm”.

Đây là rất có coi trọng, “Tàng kiếm” giấu khiến người ta cảm thấy không đến kiếm này tồn tại, “Xuất kiếm” thì là để cho người ta căn bản phản ứng không kịp, đồng thời muốn một kiếm giết địch, không dung có chút sai lầm.

“Bồi dưỡng khí thế đáng sợ kia, là nhường ra kiếm càng thêm có nắm chắc, trên thực tế không có đáng sợ khí thế, Vu Thị một kiếm vẫn như cũ là lợi hại ám sát chi pháp!” Tần Vũ trong lòng tán thưởng, cái này “Tàng kiếm, xuất kiếm” mặc dù đơn giản, lại là tinh túy không gì sánh được.

Bất quá Tần Vũ hiểu rõ một chút, không có cái kia đáng sợ lệ khí, Vu Thị một kiếm nhiều nhất chỉ là tương đối lợi hại ám sát kiếm pháp, lại không gọi được ám sát kiếm thứ nhất.

“Ta cũng không muốn biến thái như vậy, chẳng qua ở thị một kiếm cái gọi là “Tàng kiếm, xuất kiếm” lại là mười phần hợp tâm ý ta.” Tần Vũ trong lòng rất là cao hứng, “Lúc bình thường ta liền tàng kiếm, dùng đanh cận chiến, đợi đến bất đắc dĩ, liền xuất kiếm. Tốt, vũ khí của ta liền dùng đoản kiếm.”

Dùng nắm đấm, dùng chân tiến hành chiến đấu, đây là Tần Vũ thích nhất.

Sở dĩ lựa chọn đoản kiếm này, cũng là bởi vì đoản kiếm đồng dạng là thiếp thân chém giết. Tại xuất kiếm chốc lát, trực tiếp đoạn tính mạng người. Chốc lát quyết định sinh tử, Tần Vũ ưa thích chính là loại này kích tình thiêu đốt, để thể nội nhiệt huyết sôi trào phương thức chiến đấu.

Cận thân chiến đấu, phân cân thác cốt, trực tiếp dùng quyền cước công kích địch nhân yếu hại.

Tay, có thể thành quyền, có thể thành trảo, có thể thành chưởng, có thể thành đao......

Chân, có thể thành roi, có thể thành đao, có thể thành côn, có thể thành rìu......

“Cận thân chiến đấu mới là nhất làm cho người hưng phấn.” Tần Vũ nhìn trước mắt hoàn toàn dựa theo nhân thể xương cốt chế tạo mộc nhân, lúc này lấy tay thành trảo, bóp chặt lấy mộc nhân khớp nối, đồng thời hai tay càng là như là huyễn ảnh, chỉ chốc lát, một cái mộc nhân tất cả khớp nối liền hoàn toàn bị bóp vỡ nát.......

Tây Uyển trong ôn tuyền.

Tần Vũ người như du long ở trong nước lắc lư, đồng thời hai tay không ngừng ra quyền, thậm chí để cho người ta nhìn thấy dưới nước từng đạo quyền ảnh, Tần Vũ tốc độ quá nhanh.

Ròng rã gần như ba năm huấn luyện, cái này khiến Tần Vũ không sai biệt lắm nắm giữ nước đặc tính, ở trong nước, hắn có thể mượn nhờ thủy thế, nước căn bản không thành được trở ngại của hắn, ở trong nước Tần Vũ chính là một con cá con, trơn trượt rất.

“Tiểu Vũ a.” ngay cả nói cười lấy đi vào Tây Uyển.

“Bồng!”

Tần Vũ đột nhiên từ trong nước xông lên, vậy mà trực tiếp nhảy ra mặt nước, hai tay chống đất, một cái lộn mèo, xinh đẹp rơi xuống đất.

“Ngay cả gia gia.” Tần Vũ cười hướng liên nói đi tới, bỗng nhiên...... Một trận gió lên, gió thổi đến Tần Vũ trên thân, Tần Vũ không tự chủ thân hình thoắt một cái, vậy mà thoáng cái đã đến ngay cả nói bên cạnh, tốc độ nhanh dọa người, ngay cả nói không khỏi giật nảy cả mình.

Mà Tần Vũ con mắt đột nhiên bộc phát ra một đạo kinh người ánh sáng, cả người phảng phất bị lôi điện đánh trúng một dạng không nhúc nhích.

“Vừa rồi, vừa rồi......”

Tần Vũ đối với vừa rồi phát sinh sự tình giật mình không gì sánh được, ở trong nước thời điểm, Tần Vũ tìm kiếm nghĩ cách mượn nhờ thủy thế để cho mình tốc độ càng tăng nhanh hơn, mà vừa rồi vừa ra mặt nước, gió thổi tới thời điểm, Tần Vũ thầm nghĩ lấy ngay cả nói, vậy mà không tự giác cùng trong nước một dạng, lần nữa mưu toan mượn nhờ “Thủy thế” kỳ thật đó là gió.

“Nước lực cản, lực cản của gió, không khí lực cản...... Kỳ thật đều là lực cản, chỉ là nước lực cản càng thêm lớn mà thôi, ta có thể mượn nhờ thủy thế, vì sao không có khả năng mượn nhờ gió thổi, để di chuyển nhanh chóng thời điểm kình phong không còn là lực cản!”

Tần Vũ trong lòng càng thêm kích động.

“Tiểu Vũ, ngươi......” ngay cả nói thấy cảnh này giật mình, Tần Vũ căn bản không ngẩng đầu lên, khua tay nói, “Ngay cả gia gia, có chuyện về sau đàm luận.” nói liền hoàn toàn đắm chìm tại chính mình trong cảm ngộ, Tần Vũ hoàn toàn nhắm mắt lại.

Dùng thân thể càng thêm rõ ràng cảm thụ lực cản của gió.

Tốc độ!

Một người tốc độ đến cùng có bao nhanh, khi chính mình bình thường đi đường thời điểm, cơ hồ không cảm giác được không khí lực cản, thế nhưng là khi phi tốc cực hạn chớp động thời điểm, tốc độ càng nhanh, nhận lực cản lại càng lớn, tốc độ đạt tới cực hạn thời điểm, cái kia không khí lực cản sẽ đạt đến một cái trình độ kinh người.

“Khi những lực cản này không còn là lực cản, thậm chí là trợ lực sau, vậy ta tốc độ lại có bao nhiêu nhanh?” nghĩ đến vấn đề này, Tần Vũ trong lòng lập tức có mục tiêu, trong khoảng thời gian này, hắn một mực tại tìm kiếm thuộc về mình thân pháp, giờ khắc này, Tần Vũ bỗng nhiên minh bạch, cái này có lẽ chính là hắn thân pháp con đường.

Nhắm mắt lại, chậm rãi đi lại, cảm thụ được lực cản của gió, thật giống như ban đầu ở trong nước cảm thụ nước lực cản một dạng.

Chỉ là, không khí lực cản của gió rõ ràng nhỏ hơn trong nước lực cản, muốn theo cơn gió thế độ khó càng thêm lớn. Tần Vũ có trong nước kinh nghiệm, giờ phút này cảm ngộ đứng lên tốc độ lại là nhanh nhiều, đồng thời, kỳ môn độn giáp chi thuật cũng bị Tần Vũ có ý thức dung hợp vào trong đó.......

Cuộc sống ngày ngày trôi qua.

Dưới thác nước chống cự thủy áp, phụ trọng chạy cự li dài, rèn luyện chỉ lực, đống cát trong trận luyện tập năng lực phản ứng, cây gỗ bên trong rèn luyện cường độ thân thể...... Mộc Nhân Hạng bên trong rèn luyện đanh cận chiến thực lực, đối phó nhân thể mô hình thi triển “Vu Thị một kiếm” cảm ngộ mượn nhờ không khí sức gió thân pháp......

Hấp thu nội lực, gia tăng cơ bắp tính cứng cỏi cùng tiềm lực.

Tăng vọt lượng cơm ăn, xương cốt cơ bắp cũng phi tốc thuế biến, đang đứng ở thân thể phát dục giai đoạn Tần Vũ, dựa theo gần như hoàn mỹ cực hạn huấn luyện, không ngừng để cho mình thân thể hướng tới cân đối hoàn mỹ, thực lực bản thân cũng phi tốc gia tăng.

Thân pháp, cũng dần dần hướng tới hoàn thành, Tần Vũ cực tốc di động thời điểm, nhận không khí lực cản của gió cũng càng ngày càng nhỏ.......

Sắt phong thành trấn Đông Vương chỗ trong phủ đệ.

Tần Đức Chính nhìn xem trên tường bản đồ quân sự, trên địa đồ kia có các loại ấn ký, Đông Vực Tam Quận là màu đen, mà Sở Vương hướng những nơi khác thì là là màu đỏ, Tần Đức nhìn xem này tấm bản đồ quân sự, trong mắt sát cơ Winky, mỗi ngày hắn đều có gần như hai canh giờ không nhúc nhích nhìn xem địa đồ này.

“Vương gia, Vân vụ sơn trang truyền đến một thì tin tức.” toàn thân áo đen Từ Nguyên đi đến.

Nghe được “Vân vụ sơn trang” một từ, Tần Đức lực chú ý cuối cùng từ trên địa đồ dời đi tới, xoay đầu lại thản nhiên nói: “Nói, tin tức gì?”

Từ Nguyên lập tức đáp: “Vương gia, trên thư nói, lúc trước vương gia an bài chuyên môn âm thầm bảo hộ Tiểu Vũ ba vị nội gia cao thủ đã quyết định muốn về quân đội.”

Tần Đức không khỏi rất là nghi hoặc, ba người kia Tần Đức thế nhưng là rất rõ ràng, mặc dù chỉ là ngày kia cao thủ, thế nhưng là liên thủ lực công kích hay là rất mạnh, mà lại đối với hắn trung thành rất, tuyệt đối không dám tùy ý làm trái mệnh lệnh của hắn.

“Nói, nguyên nhân gì?” Tần Đức lạnh giọng dò hỏi.

Từ Nguyên lại nhìn một lần trên tay thư, sắc mặt có chút quái dị nói: “Trên thư giảng, vương gia nguyên bản phái ba vị này nội công cao thủ âm thầm bảo hộ Tiểu Vũ, thế nhưng là, thế nhưng là......” nói đến đây, Từ Nguyên tựa hồ có chút nói không được nữa.

“Đến cùng nguyên nhân gì, mau nói!” Tần Đức nhìn chằm chằm Từ Nguyên dò hỏi.

Từ Nguyên sắc mặt quái dị, chỉ có thể nói nói “Vương gia, trong thư này nói, vương gia chọn lựa ba vị nội công cao thủ, thế nhưng là bọn hắn bây giờ căn bản theo không kịp Tiểu Vũ tốc độ di chuyển, cho nên cũng liền không cách nào âm thầm bảo hộ Tiểu Vũ.”

“Cái gì, theo không kịp, làm sao có thể!” Tần Đức lại tỉnh táo, giờ phút này cũng mở to hai mắt nhìn.

Năm nay, Tần Vũ vừa mới 12 tuổi mà thôi.', 16),
( 2, N'Tám trăm năm sau', N'1. Chương 01: 800 năm sau

"Trì Dao, ta đối với ngươi như tình cảm chân thành, ngươi vì sao muốn g·iết ta?"

Trương Nhược Trần hét lớn một tiếng, nghĩ trước bổ nhào về phía trước, ép tới mạ vàng chế tạo giường "Kẽo kẹt" một tiếng, đột nhiên ngồi dậy.

Phát hiện chỉ là một giấc mộng, Trương Nhược Trần mới thở ra một hơi thật dài, dùng ống tay áo đem mồ hôi trên trán lau khô.

Không!

Đây không phải là một giấc mộng!

Hắn cùng Trì Dao công chúa phát sinh hết thảy, lại thế nào có thể là một giấc mộng?

Trương Nhược Trần vốn là Côn Lôn Giới chín đại Đế Quân một trong "Minh Đế" con trai độc nhất, năm gần 16 tuổi, lợi dụng nghịch thiên thể chất, tu luyện tới Thiên Cực Cảnh đại viên mãn.

Nhưng là, ngay tại hắn trở thành Côn Lôn Giới thế hệ tuổi trẻ đệ nhất nhân thời điểm, lại c·hết tại mình thanh mai trúc mã vị hôn thê Trì Dao công chúa trong tay.

Trì Dao công chúa, là chín đại Đế Quân một trong "Thanh Đế" nữ nhi.

Minh Đế cùng Thanh Đế là tốt nhất bạn tri kỉ, Trương Nhược Trần cùng Trì Dao công chúa càng là chỉ phúc vi hôn, từ nhỏ cùng nhau lớn lên, cùng một chỗ tu luyện. Một cái tư thế hiên ngang, một cái mỹ mạo tuyệt luân, có thể xưng Kim Đồng Ngọc Nữ, lúc đầu có thể trở thành tu luyện giới một đoạn giai thoại.

Trương Nhược Trần làm sao cũng không ngờ được, Trì Dao công chúa thế mà lại ra tay với hắn!

C·hết tại Trì Dao công chúa trong tay về sau, khi Trương Nhược Trần lần nữa tỉnh lại, lại phát hiện mình đã tại 800 năm về sau.

Đã từng Trì Dao công chúa, bình định Cửu Đế chi loạn, thống nhất cửu quốc, thành lập thứ nhất Trung Ương Đế Quốc, trở thành toàn bộ Côn Lôn Giới Chúa Tể —— Trì Dao Nữ Hoàng.

800 năm trước, xưng hùng Côn Lôn Giới Cửu Đế, triệt để trở thành quá khứ, biến mất tại lịch sử trường hà bên trong.

Cửu Đế đ·ã c·hết, Nữ Hoàng đương lập.

Thời đại này, chỉ có một vị Hoàng giả, cái kia chính là Trì Dao Nữ Hoàng, thống ngự thiên hạ, uy lâm bát phương.

"Nàng vì sao muốn g·iết ta? Lòng của nàng tại sao có thể ác như vậy, hay là nói lòng của phụ nữ đều như thế hung ác?"

Trương Nhược Trần ánh mắt sắc bén, tâm chìm như sắt, đầy bụng nghi vấn. Nhưng là, nhưng không ai có thể giúp hắn giải đáp.

800 năm đi qua, sớm đã thương hải tang điền, cảnh còn người mất, ngoại trừ tu vi tuyệt thế Trì Dao Nữ Hoàng, thanh xuân vẫn như cũ, bất lão bất tử. Đã từng những cố nhân kia, toàn bộ đều đã hoá thành cát vàng, biến thành bạch cốt.

Cho dù là năm đó uy phong bát diện Cửu Đế, cũng đều toàn bộ ở nhân gian tuyệt tích, chỉ để lại từng đoạn để hậu nhân kéo dài truyền tụng huy hoàng cố sự.

"Kẹt kẹt!"

Một cái thân thể nhu nhược cung trang mỹ phụ nhân, từ bên ngoài đẩy cửa đi tới, nhìn xem ngồi tại trên giường Trương Nhược Trần, mang theo mắt ân cần thần, "Trần Nhi, ngươi lại thấy ác mộng?"

Trước mắt người mỹ phụ này, là Vân Võ Quận Vương Vương phi, cũng là Trương Nhược Trần mẫu thân, Lâm Phi.

Cái này một thân thể nguyên chủ nhân, bởi vì người yếu nhiều bệnh, ba ngày trước liền bệnh c·hết tại trên giường.

Trương Nhược Trần bị Trì Dao công chúa g·iết c·hết về sau, lần nữa tỉnh lại, liền xuất hiện tại cái này một thân thể bên trong, để nguyên bản bệnh c·hết thiếu niên khởi tử hồi sinh. Càng thêm trùng hợp chính là, cái này một thân thể nguyên chủ nhân, cũng gọi Trương Nhược Trần.

Trương Nhược Trần vừa mới lúc tỉnh lại, còn rất bài xích Lâm Phi. Dù sao ở trong mắt Trương Nhược Trần, Lâm Phi, chỉ là một người xa lạ.

Nhưng là, đi qua ba ngày tiếp xúc, Trương Nhược Trần dần dần phát hiện, Lâm Phi thật hết sức quan tâm hắn, đơn giản cẩn thận, nhìn thấy Trương Nhược Trần làm ác mộng bị làm tỉnh lại, càng không để ý trời đông giá rét, lập tức chạy đến Trương Nhược Trần gian phòng.

Ở kiếp trước, Trương Nhược Trần chưa bao giờ thấy qua mình mẹ đẻ. Nghe nói, tại mình ra đời thời điểm, nàng liền đi thế! Không nghĩ tới, bị Trì Dao công chúa g·iết c·hết về sau, trùng sinh tại cái này một thân thể bên trong, vậy mà để hắn nhiều một vị mẫu thân, cảm nhận được tình thương của mẹ ấm áp.

"Có lẽ nàng còn không biết, mình Trần Nhi, tại ba ngày trước, liền bệnh c·hết!"

Nếu là nói cho nàng chân tướng, nàng chưa hẳn chịu được tin dữ này đả kích.

Trương Nhược Trần nhìn trước mắt người mỹ phụ này, nhãn thần trở nên nhu hòa, mỉm cười: "Mẫu thân, không cần lo lắng cho ta, chỉ là một giấc mộng mà thôi."

Lâm Phi đơn bạc trên thân hất lên một kiện đỏ thẫm sắc ngay cả mũ lông chồn, ngồi tại Trương Nhược Trần bên giường, vuốt ve Trương Nhược Trần cái trán, lo lắng nói: "Đã ba ngày buổi tối, ngươi luôn luôn bị ác mộng làm tỉnh lại, mỗi lần đều gọi "Trì Dao" danh tự. Nàng đến cùng là ai a?"

Lâm Phi tự nhiên không có khả năng đem "Trì Dao" cái tên này, liên tưởng đến thứ nhất Trung Ương Đế Quốc Nữ Hoàng.

Huống hồ, Trì Dao Nữ Hoàng thống nhất Côn Lôn Giới, thành lập thứ nhất Trung Ương Đế Quốc về sau, liền danh xưng "Đại Uy Đại Đức Nữ Thánh Hoàng" bình thường căn bản không có người dám nhắc tới "Trì Dao" hai chữ. Sẽ phạm kiêng kị.

Trương Nhược Trần nói: "Không có gì, mẫu thân, ngươi nghe lầm!"

Lâm Phi thở dài một cái, nói: "Sau này tuyệt đối không nên lại gọi thẳng "Trì Dao" hai chữ, cho dù là trong mộng cũng không được, đây chính là Nữ Hoàng tục danh. Gọi thẳng Nữ Hoàng tục danh là đại bất kính, một khi bị người hữu tâm nghe được, sẽ bị xử tử."

Trương Nhược Trần nhẹ gật đầu, thật chặt nhéo nhéo ngón tay, có phần ngậm thâm ý nói: "Tuyệt đối sẽ không! Sau này..."

Sau này, ta chính là nàng ác mộng.

Lâm Phi nhìn xem dáng người gầy yếu, sắc mặt tái nhợt Trương Nhược Trần, nhẹ nhàng thở dài một hơi, trong lòng vô cùng chua xót.

Mặc dù sinh ở Quận Vương nhà, nhưng là, hắn lại từ nhỏ người yếu nhiều bệnh, đã 16 tuổi, vẫn như cũ chỉ có thể lâu dài nằm ở trên giường, chỉ sợ đời này cũng chỉ có thể bộ dáng này!

Bên ngoài, vang lên một trận xốc xếch tiếng bước chân.

"Các ngươi chơi cái gì? Nơi này chính là Ngọc Sấu Cung, ai cho các ngươi lá gan, dám tùy ý xông loạn tiến đến?" Một cái dung mạo xinh đẹp thị nữ, muốn ngăn lại xông vào Bát vương tử, lại bị Bát vương tử nhẹ nhàng đẩy, ném tới hơn mười mét bên ngoài.

Bát vương tử thế nhưng là một vị võ giả, tu vi đạt tới Hoàng Cực Cảnh hậu kỳ, một chưởng đánh ra, đủ để đem nặng ba trăm cân bàn đá đánh ra xa mười trượng, huống chi chỉ là một cái trên dưới một trăm cân nặng thị nữ?

Ngón tay búng một cái, liền có thể đưa nàng bắn bay ra ngoài.

Một cái kia thị nữ kêu thảm một tiếng, trùng điệp ngã xuống đất, tay trái cánh tay bị ngã đoạn.

Bát vương tử mặc một thân kim sợi áo, trên lưng quấn lấy một cây ngọc thạch mang, thân thể tráng kiện, cánh tay thon dài, bộ pháp trầm ổn, đi vào Ngọc Sấu Cung, lặng lẽ nhìn chằm chằm người thị nữ kia một chút, "Một cái nô tỳ cũng dám cản bản vương tử con đường, thật sự là muốn c·hết."

Bát vương tử sau lưng, đi theo sáu vị người mặc lân giáp da giáp thị vệ, thân thể cao lớn, lưng hùm vai gấu, hiển nhiên đều là chiến lực cường đại tu sĩ Võ Đạo, thuộc về hoàng cung cấm vệ.

Lâm Phi nghe phía bên ngoài động tĩnh, trấn an Trương Nhược Trần cảm xúc về sau, liền đóng cửa lại, đi ra ngoài.

Nàng nhìn chằm chằm đứng ở bên ngoài Bát vương tử, có chút cau lại lông mày, nói: "Bát vương tử điện hạ, nơi này chính là Ngọc Sấu Cung, coi như ngươi là Vương tử, cũng không thể xông loạn đi!"

Bát vương tử Trương Tế ngẩng đầu nhìn chằm chằm Lâm Phi, cất cao giọng nói: "Vương hậu có lệnh, Lâm Phi nương nương cùng Cửu đệ tẩm cung, đổi đến "Tử Di Thiên Điện" . Sau này Ngọc Sấu Cung chủ nhân, chính là bản vương tử mẹ đẻ Tiêu Phi nương nương."

Lâm Phi sắc mặt hơi đổi, nàng đã sớm ngờ tới một ngày này sẽ đến, nhưng là, nhưng không có nghĩ đến sẽ đến đến nhanh như vậy.

Lâm Phi đau thương cười một tiếng, nói: "Vương hậu nhanh như vậy liền muốn đuổi chúng ta mẹ con rời đi Ngọc Sấu Cung sao? Tốt a! Ngày mai, ta liền cùng Trần Nhi dọn đi Thiên Điện."

Bát vương tử nói: "Thật xin lỗi! Mẫu thân nói, nàng đêm nay liền muốn vào ở Ngọc Sấu Cung. Xin Lâm Phi nương nương hiện tại liền dọn đi Thiên Điện!"

Lâm Phi biết Trương Nhược Trần người yếu nhiều bệnh, chịu không được giày vò, mang theo vài phần cầu khẩn ngữ khí, nói: "Bát vương tử điện hạ, ngươi cũng biết ngươi Cửu đệ người yếu nhiều bệnh, đêm đã khuya, thời tiết rét lạnh, vạn nhất..."

Bát vương tử cười lạnh, mảy may đều không khách khí nói: "Lâm Phi nương nương, trên đời này người đáng thương nhiều đến đi, nhưng là, không phải mỗi người đều đáng giá đáng thương. Tất nhiên Cửu đệ người yếu nhiều bệnh, cái kia còn sống trên đời làm gì?"

"Hắn nhưng là ngươi Cửu đệ!"

Lâm Phi còn muốn nói tiếp cái gì, đột nhiên, cửa phía sau bị đẩy ra.

Trương Nhược Trần thân thể suy yếu, lấy tay chống đỡ cột cửa mới có thể miễn cưỡng đứng thẳng, nhìn chằm chằm cách đó không xa Bát vương tử. Hắn nhìn như yếu không trải qua gió thân thể, giống như là ẩn chứa ý chí bất khuất, nói: "Không cần cầu bọn hắn, chúng ta bây giờ liền dọn đi."

"Trần Nhi, ngươi làm sao xuống giường? Khí trời bên ngoài rét lạnh, còn không mau trở về." Lâm Phi liền vội vàng tiến lên đỡ Trương Nhược Trần, sợ hắn nhiễm lên phong hàn.

Trương Nhược Trần cố chấp lắc đầu, nói: "Mẫu thân, chúng ta không cần cầu bất luận kẻ nào, sớm muộn có một ngày... Chúng ta sẽ một lần nữa về tới đây!"

Lâm Phi nhìn xem Trương Nhược Trần ánh mắt kiên định, tựa hồ cũng bị tâm tình của hắn cảm nhiễm, nước mắt lượn quanh nhẹ gật đầu.

Lâm Phi cùng tham gia vịn Trương Nhược Trần, từng bước một đi ra Ngọc Sấu Cung, ngoại trừ một cái kia bị Bát vương tử một chưởng đẩy đi ra quẳng tay gãy cánh tay thị nữ. Khác những người hầu kia, toàn bộ đều không có đi theo đám bọn hắn rời đi Ngọc Sấu Cung.

Tất cả mọi người nhìn ra được, Lâm Phi cùng Cửu vương tử đã triệt để thất thế, tại Quận Vương trong phủ, lại khó có bọn hắn nơi sống yên ổn.

Lúc đầu bọn hắn liền là Ngọc Sấu Cung người hầu, hiện tại tự nhiên lựa chọn sáng suốt lưu tại Ngọc Sấu Cung, toàn bộ đều đi nịnh nọt Bát vương tử vị này chủ nhân mới.

Tử Di Thiên Điện, bình thường đều là thất sủng Vương phi chỗ ở, mười phần vắng vẻ, đầy đất lá rụng, tựa hồ đã thật lâu không có người ở.

Đêm lấy sâu, hàn phong đìu hiu.

Ngồi tại băng lãnh trên mặt ghế đá, Trương Nhược Trần gầy yếu trên thân bọc lấy một kiện áo ngoài, nhưng như cũ cảm giác được rét lạnh.

"Cái này một bộ nhục thân quá yếu ớt, chỉ có tu luyện Võ Đạo, mới có thể để cho thân thể dần dần cường tráng. Nếu không, coi như ta hiện tại là Quận Vương chi tử, vẫn như cũ chỉ có thể bị người bài bố." Trương Nhược Trần trong lòng thầm nghĩ.

800 năm đi qua, Trương Nhược Trần cũng không biết mình bây giờ có thể đi nơi nào? Tất nhiên thượng thiên an bài hắn trùng sinh tại cái này một thân thể bên trong, vô luận là vì tương lai hướng Trì Dao Nữ Hoàng báo thù, vẫn là vì vị kia cẩn thận chiếu cố mẹ ruột của mình, hắn đều nhất định muốn cường đại lên.

Hôm nay gặp khuất nhục cùng lạnh nhạt, hoàn toàn đều là bởi vì chính mình quá yếu ớt, không cách nào phản kháng, không cách nào nắm giữ vận mệnh của mình, thậm chí ngay cả mình chỗ ở đều bị người khác cưỡng chiếm.

Muốn có được người khác tôn trọng, muốn thu hoạch được ấm áp thoải mái dễ chịu ở lại hoàn cảnh, nhất định phải trở thành một tên võ giả, chứng minh năng lực của mình.

Tại Côn Lôn Giới, muốn trở thành một tên võ giả, nhất định phải trước mở ra "Thần Võ Ấn Ký" .

Cái gọi là "Thần Võ Ấn Ký" liền là Thần Linh ban cho nhân loại tu luyện Võ Đạo tư cách. Không có mở ra "Thần Võ Ấn Ký" người, liền vĩnh viễn cũng tu luyện không ra chân khí, không cách nào trở thành giữa thiên địa cường giả.

Trương Nhược Trần đã 16 tuổi, vẫn không có mở ra "Thần Võ Ấn Ký" .

Qua 16 tuổi, liền bỏ lỡ tu võ tốt nhất tuổi tác, coi như mở ra "Thần Võ Ấn Ký" cũng không có khả năng lớn bao nhiêu thành tựu.

Đồng dạng đều là Vân Võ Quận Vương nhi tử, vì sao Bát vương tử liền có thể tài trí hơn người? Có thể đem Trương Nhược Trần cùng Lâm Phi đuổi ra Ngọc Sấu Cung?

Cũng là bởi vì, Bát vương tử tại 10 tuổi thời điểm, liền mở ra "Thần Võ Ấn Ký" hiện tại đã là Hoàng Cực Cảnh hậu kỳ tuổi trẻ võ giả.

"Chỉ cần để cho ta mở ra "Thần Võ Ấn Ký" ta liền có thể tu luyện « Cửu Thiên Minh Đế Kinh ». Lấy « Cửu Thiên Minh Đế Kinh » huyền diệu, coi như ta đã bỏ lỡ tốt nhất tu luyện niên kỷ, vẫn như cũ có khả năng đuổi kịp khác thiên tài, một lần nữa trở thành một tên Võ Đạo cường giả."

« Cửu Thiên Minh Đế Kinh » là Minh Đế tu luyện chí cao bảo điển, ngoại trừ Minh Đế bên ngoài, liền chỉ có Trương Nhược Trần biết « Cửu Thiên Minh Đế Kinh » hoàn chỉnh tu luyện pháp quyết.

"Ngày mai sẽ là tế tự đại điển, hy vọng có thể đạt được Thần Linh tán thành, đem "Thần Võ Ấn Ký" mở ra." Trương Nhược Trần nắm thật chặt nắm đấm, đối mở ra "Thần Võ Ấn Ký" tràn ngập khát vọng.

Lâm Phi đem gian phòng thu thập chỉnh lý tốt về sau, liền tới nâng Trương Nhược Trần, "Trần Nhi, ngươi nhanh sớm nghỉ ngơi một chút đi! Ngày mai, còn muốn đi tham gia tế tự đại điển."

"Mẫu thân yên tâm, ta ngày mai khẳng định có thể mở ra "Thần Võ Ấn Ký" !" Trương Nhược Trần nói.

"Ừm! Mẫu thân tin tưởng ngươi!"

Lâm Phi nhìn thật sâu Trương Nhược Trần một chút, trong lòng nhẹ nhàng thở dài.

Kỳ thật, nàng đối Trương Nhược Trần mở ra "Thần Võ Ấn Ký" căn bản không báo bất cứ hy vọng nào, dù sao Trương Nhược Trần đã 16 tuổi, qua 16 tuổi, liền gần như không có khả năng còn có thể mở ra Thần Võ Ấn Ký.

Nhưng là, làm một vị mẫu thân, nàng lại nhất định phải cổ vũ con của mình, cho hắn lòng tin.', 1),
( 2, N'Mở ra Thần Võ Ấn Ký', N'2. Chương 02: Mở ra Thần Võ Ấn Ký

Trương Nhược Trần hiện tại chỗ quốc gia, tên là "Vân Võ Quận Quốc", chỉ là Côn Lôn Giới Đông Vực hàng ngàn hàng vạn cái Quận Quốc bên trong một cái.

Cái gọi là Quận Quốc, kỳ thật liền là thứ nhất Trung Ương Đế Quốc cái thứ nhất quận, hàng năm nhất định phải hướng thứ nhất Trung Ương Đế Quốc cống lên cùng nộp thuế.

Quận Quốc quốc quân, xưng là "Quận Vương" .

Trương Nhược Trần thân phận bây giờ, liền là Vân Võ Quận Vương con trai thứ chín.

Nằm thẳng tại băng lãnh, cứng rắn trên giường gỗ, Trương Nhược Trần vẫn tại suy tư ngày mai tế tự đại điển sự tình.

"Cỗ thân thể này nguyên chủ nhân, đến 16 tuổi thế mà đều không có mở ra "Thần Võ Ấn Ký", khẳng định là bị Chư Thần vứt bỏ người. Ta muốn làm thế nào, mới có thể có càng lớn cơ hội mở ra "Thần Võ Ấn Ký" ?"

Tại Côn Lôn Giới, muốn mở ra "Thần Võ Ấn Ký", nhất định phải đạt được Thần Linh tán đồng.

Được xưng là, võ quyền thần thụ.

Tại tế tự đại điển thời điểm, Thần Giới cùng Côn Lôn Giới ở giữa sẽ xuất hiện một đầu Thiên Địa Thần Kiều , liên tiếp lưỡng giới. Chư Thần tại hưởng dụng tế phẩm về sau, sẽ ban cho một chút người có thiên phú loại "Thần Võ Ấn Ký", giúp bọn hắn mở ra cánh cửa tu luyện.

Thiên phú càng cao người, liền có thể càng sớm đạt được "Thần Võ Ấn Ký" .

Trương Nhược Trần ở kiếp trước, còn tại thai trong bụng thời điểm, liền mở ra "Thần Võ Ấn Ký", có thể nói là trời sinh kỳ tài.

Một thế này, đến 16 tuổi, thế mà đều không có mở ra "Thần Võ Ấn Ký", cái kia trên cơ bản liền là bị Chư Thần vứt bỏ người. Coi như ngày mai lại tham gia tế tự đại điển, cơ hồ cũng không có khả năng thu hoạch được "Thần Võ Ấn Ký" .

Trương Nhược Trần không cách nào chìm vào giấc ngủ, từ trên giường ngồi dậy, cầm trong tay một viên hạt táo hình dạng màu trắng Tinh Thạch, hai đầu bén nhọn, ở giữa lập thể, óng ánh sáng long lanh, không có chút nào tạp chất.

Hắn bắt đầu nghiên cứu cái này một viên màu trắng Tinh Thạch, có lẽ, nó có thể giúp mình, đạt được một vị nào đó Thần Linh tán thành, mở ra "Thần Võ Ấn Ký" .

Cái này một viên màu trắng Tinh Thạch, là tại hắn 16 tuổi lễ thành nhân thời điểm, Minh Đế đưa cho hắn lễ vật.

Trương Nhược Trần cũng không biết cái này một viên màu trắng Tinh Thạch rốt cuộc là thứ gì, chỉ là đưa nó thiếp thân đeo ở trên người. Không nghĩ tới, đi vào 800 năm về sau, nó thế mà vẫn như cũ còn tại trên người mình.

"Ta sẽ từ 800 năm trước đi vào 800 năm về sau, nói không chừng liền cùng nó có quan hệ."

Trương Nhược Trần thật chặt nắm vuốt màu trắng Tinh Thạch, hai mắt nhắm lại, trong đầu hiện ra phụ thân Minh Đế thân ảnh, cũng không biết phụ thân còn sống trên đời không có?

Một đêm này, Vương thành rơi ra tuyết lớn.

Sáng sớm ngày thứ hai, toàn bộ Vương thành đều bị thật dày tuyết đọng bao trùm, từng tòa màu đỏ thắm cung điện, lầu các, đình đài, toàn bộ trùm lên một tầng băng điêu tuyết y.

Ngày Đông chí, cả năm rét lạnh nhất một ngày.

Toàn bộ Vương thành võ giả, tụ tập đến Chư Hoàng Từ Đường bên ngoài, tại Quận Vương dẫn đầu dưới, tế tự Chư Thần.

Chư Hoàng Từ Đường bên ngoài, dùng cự thạch đắp lên lấy một tòa cổ xưa tế đàn. Trên tế đài, không chỉ có trói chặt nước cờ lấy vạn nhớ súc vật, trâu, dê, heo... , còn có rất đa dụng xích sắt khóa lại cường đại Man thú.

Văn võ bá quan, tu sĩ Võ Đạo, Vương tử Tần phi, vô số chờ đợi mở ra Thần Võ Ấn Ký thiếu niên cùng thiếu nữ, thậm chí là một chút còn tại trong tã lót hài nhi.

Đây là một trận cả nước buổi lễ long trọng, không chỉ có chỉ là Vương thành, tại Vân Võ Quận Quốc mỗi một tòa thành trì, mỗi một cái tiểu trấn, mỗi một cái thôn xóm đều muốn cử hành tế tự.

"Ngân ngân! Cửu đệ, ngươi cũng 16 tuổi, coi như tham gia tế tự đại điển, cũng không có khả năng thu hoạch được "Thần Võ Ấn Ký", làm gì đến mất mặt xấu hổ?" Bát vương tử Trương Tế chắp hai tay sau lưng, lạnh buốt cười một tiếng.

Lục vương tử liền đứng tại Bát vương tử bên người, gương mặt lạnh lùng, nói: "Đều nói rồng sinh chín con, đều có khác biệt. Phụ vương cỡ nào anh hùng nhân vật, lại sinh ra ngươi cái phế vật này, 16 tuổi, ngay cả "Thần Võ Ấn Ký" đều không có mở ra, Vương tộc mặt đều bị ngươi mất hết. Ngươi sống ở trên đời này làm gì? Vì cái gì không chết đi đâu?"

Câu nói này nói đến có chút qua, nhưng là ở đây mấy vị Vương tử tiếng lòng.

Đế vương gia thân tình, nhất là đơn bạc, giờ khắc này thể hiện đến phát huy vô cùng tinh tế.

Tại Côn Lôn Giới, có thể mở ra "Thần Võ Ấn Ký" người cũng không nhiều, mười người bên trong cũng nhiều nhất chỉ có một cái. Có thể nói, mỗi một vị địa vị của võ giả đều cực cao.

Đương nhiên đối với Võ Đạo cường giả tới nói, lại là một chuyện khác. Võ Đạo cao thủ huyết mạch cường đại, hậu thế cũng sẽ đem cường đại huyết mạch truyền thừa xuống, mở ra "Thần Võ Ấn Ký" xác suất cũng liền lớn.

Vân Võ Quận Vương hết thảy có chín cái nhi tử, trong đó tám cái đều mở ra "Thần Võ Ấn Ký", duy chỉ có Trương Nhược Trần, đã 16 tuổi, nhưng như cũ không có mở ra "Thần Võ Ấn Ký", biến thành Vương tộc trò cười.

Rất nhiều người đều cười xưng là hắn "Hổ phụ khuyển tử" .

Thậm chí trong triều còn có một số tin đồn, công bố Trương Nhược Trần cũng không phải là Vân Võ Quận Vương con ruột. Mặc dù chỉ là lời đồn đại, nhưng cũng để trong vương tộc người trên mặt không ánh sáng.

Cho nên, khác những cái kia Vương tử, phần lớn đều cho rằng Trương Nhược Trần là Vương tộc sỉ nhục, căn bản không có đem hắn xem như thân huynh đệ, hận không thể hắn sớm đi chết mất.

Mấy năm gần đây, liền ngay cả Vân Võ Quận Vương đều có chút xa lánh Trương Nhược Trần cùng Lâm Phi. Tại phi tần khác cùng Vương tử xa lánh dưới, tại đêm qua, Trương Nhược Trần cùng Lâm Phi rốt cục bị đuổi ra chủ điện, bị ép dọn đi Thiên Điện.

Trương Nhược Trần chỉ là yên lặng đứng ở nơi đó, cũng không để ý tới Ngũ vương tử cùng Bát vương tử.

Tại không có đủ thực lực trước đó , bất kỳ cái gì miệng lưỡi chi tranh, sẽ chỉ làm người khác càng thêm xem nhẹ ngươi.

Lâm Phi cùng khác những cái kia Vương phi đứng chung một chỗ, nhìn thấy có thụ xa lánh Trương Nhược Trần, đau lòng không thôi, nhưng là, lại không có biện pháp nào.

"Tế tự đại điển, bắt đầu!"

Vân Võ Quận Quốc Quốc sư đứng tại phía trên tế đàn, bưng lấy một quyển Chúc Văn, đọc diễn cảm.

Sau đó, phía trên tế đàn, thổi lên đại pháp loa, đại hào giác, từng vị y phục rực rỡ thướt tha cung nữ gõ vang khánh, chuông nhạc, chiêng chuông mười sáu loại nhạc khí.

Tiếp theo, chém giết súc vật, lấy huyết tế trời.

"Hoa —— "

Nồng đậm huyết khí, hóa thành một cây tráng kiện cột sáng, bay thẳng thiên khung, đem tầng mây đánh nát, xông vào mênh mông thiên khung.

Đột nhiên, một hạt tinh quang từ thiên ngoại bay thấp xuống tới, rơi xuống một cái 6 tuổi tiểu nam hài mi tâm, cùng tiểu nam hài thân thể hòa làm một thể, hóa thành một cái xích hồng sắc "Thần Võ Ấn Ký" .

Trong đám người, phát ra một tiếng kinh hô, "Tiết đô thống ấu tử, mới 6 tuổi liền mở ra Thần Võ Ấn Ký!"

"Xích Diễm Thần Võ Ấn Ký, thuộc về Tứ phẩm Thần Võ Ấn Ký. Quá lợi hại, tương lai tiền đồ vô lượng!"

Thần Võ Ấn Ký cũng chia phẩm cấp, từ Nhất phẩm đến Cửu phẩm.

Nhất phẩm Thần Võ Ấn Ký nhược tiểu nhất, Cửu phẩm Thần Võ Ấn Ký cường đại nhất.

Tất cả mọi người dùng ánh mắt hâm mộ, nhìn chằm chằm một cái kia 6 tuổi tiểu nam hài.

6 tuổi liền mở ra Tứ phẩm Thần Võ Ấn Ký, có thể xưng thiên chi kiêu tử, thành tựu tương lai tuyệt đối không thấp.

Vân Võ Quận Quốc đông đảo võ tướng bên trong, một người dáng dấp khôi ngô nam tử vỗ bộ ngực, cao giọng cười to, hưng phấn không thôi, "Tốt! Không hổ là ta Tiết Lượng nhi tử, đêm nay đô thống phủ bày yến, các vị nhưng nhất định phải tới đến dự. Ha ha!"

"Xoạt!"

Trên bầu trời, lại bay xuống vô số tinh quang, rơi vào từng vị thiếu niên, thiếu nữ mi tâm, hóa thành hóa thành từng cái Thần Võ Ấn Ký.

Trong đó, lấy Nhất phẩm Thần Võ Ấn Ký nhiều nhất, có thể mở ra Nhị phẩm Thần Võ Ấn Ký thiếu niên đều ít càng thêm ít, người lợi hại nhất, vẫn như cũ là vị nào Tiết đô thống nhi tử, Tứ phẩm Thần Võ Ấn Ký, làm cho tất cả mọi người đều theo không kịp.

Mở ra Thần Võ Ấn Ký người, dù sao cũng là số ít, đại khái chỉ có tổng số người một phần mười. Mỗi người đều hưng phấn không hiểu, rốt cục đạt được Thần Linh tán thành, mở ra Võ Đạo chi môn.

Những cái kia không có mở ra Thần Võ Ấn Ký thiếu niên cùng thiếu nữ, toàn bộ đều mười phần thất lạc, có người càng là khóc rống nghẹn ngào, có thể nói là mấy nhà sung sướng mấy nhà sầu.

Mắt thấy tế tự liền muốn kết thúc, nhưng là, Trương Nhược Trần nhưng như cũ không có mở ra Thần Võ Ấn Ký.

16 tuổi đều không có mở ra Thần Võ Ấn Ký, cơ hồ liền là không thể nào còn có thể mở ra Thần Võ Ấn Ký, sau này chỉ có thể làm một cái bình thường người bình thường.

Tất cả mọi người đem hắn coi nhẹ, tựa như trong góc một hạt bụi, căn bản không nhận chú ý.

Lâm Phi ban đầu cũng ôm một tia huyễn tưởng, hi vọng mình hài nhi có thể sáng tạo ra kỳ tích, mở ra Thần Võ Ấn Ký. Coi như không thể trở thành Võ Đạo cường giả, chí ít có thể cường thân kiện thể, không đến mức lại bị bệnh ma tra tấn.

Theo tế tự chuẩn bị kết thúc, Lâm Phi hi vọng, lần nữa biến thành thất vọng, thậm chí là tuyệt vọng.

Ngay tại Trương Nhược Trần đều cho là mình không cách nào mở ra Thần Võ Ấn Ký thời điểm, bị hắn nắm chặt trong tay màu trắng Tinh Thạch, hơi sáng một cái.

Tại tế tự kết thúc trước tốt nhất một cái sát na, một hạt tinh quang, từ trên trời giáng xuống, rơi xuống Trương Nhược Trần mi tâm, hóa thành một cái màu trắng hình tròn Thần Võ Ấn Ký.

"Xoạt!"

Một cỗ nóng rực cảm giác, từ mi tâm truyền đến, chợt truyền khắp toàn thân.

Mở ra!

Trương Nhược Trần hưng phấn vô cùng, rốt cục mở ra Thần Võ Ấn Ký.

Chỉ cần mở ra Thần Võ Ấn Ký liền tốt, cho dù là Nhất phẩm Thần Võ Ấn Ký, hắn cũng không có chút nào thèm quan tâm.

Lúc đầu không có người chú ý Trương Nhược Trần, nhưng là, tại Trương Nhược Trần mở ra Thần Võ Ấn Ký một sát na kia, lại hấp dẫn ánh mắt mọi người.

"Đây không phải là Cửu vương tử, hắn đều 16 tuổi, mà lại người yếu nhiều bệnh, thế mà còn có thể mở ra Thần Võ Ấn Ký!" Rất nhiều người đều lấy một loại ánh mắt không thể tin nhìn chằm chằm Trương Nhược Trần, cảm thấy rất không thể tưởng tượng nổi.

Đứng tại Trương Nhược Trần bên cạnh Lục vương tử cùng Bát vương tử cũng mở to hai mắt nhìn, lộ ra vẻ kinh dị.

Cái này sao có thể?

Lâm Phi hướng về Trương Nhược Trần nhìn sang, nhìn thấy Trương Nhược Trần mi tâm Thần Võ Ấn Ký về sau, mừng rỡ nước mắt chảy xuống, lập tức vọt tới Trương Nhược Trần trước mặt, đem Trương Nhược Trần nhục thân thân thể ôm chặt lấy, "Trần Nhi, ngươi rốt cục làm được! Làm được!"

Vân Võ Quận Vương bên người một vị lão thái giám, đi đến Trương Nhược Trần trước mặt, cười nhẹ nhàng mà nói: "Chúc mừng Lâm Phi nương nương, chúc mừng Cửu vương tử điện hạ mở ra Thần Võ Ấn Ký! Vương hậu để lão nô đến xin Cửu vương tử điện hạ đi qua, nàng muốn đích thân kiểm trắc Cửu vương tử điện hạ mở ra Thần Võ Ấn Ký phẩm cấp!"

"Vương hậu!"

Lâm Phi nụ cười trên mặt lập tức cứng đờ, có chút khẩn trương đem Trương Nhược Trần bảo hộ ở sau lưng.

"Mẫu thân, chúng ta đi gặp Vương hậu đi!"

Trương Nhược Trần phát giác được Lâm Phi biến hóa vi diệu, trong lòng thầm nghĩ, xem ra cái này Vương hậu nương nương không phải thiện nhân, được nhiều càng cẩn thận.', 2),
( 2, N'Hoàng Cực Cảnh', N'3. Chương 03: Hoàng Cực Cảnh

Vương hậu nương nương ngồi tại bên dưới tế đàn phương trong doanh trướng, đầu đội vàng Kim Phượng quan, người khoác Thải Phượng bào, coi trọng lên 28, chín dáng vẻ, tú lệ đoan trang, không hề giống Trương Nhược Trần trong tưởng tượng như vậy già nua, ngược lại còn cho người một loại khí chất cao quý.

Nàng nói: "Đại vương tại Sinh Tử Điện bế quan tu luyện, lần này "Tế tự đại điển" là từ bổn hậu chủ trì. Quốc sư, kiểm trắc ra Cửu vương tử điện hạ mở ra Thần Võ Ấn Ký phẩm cấp sao?"

Vân Võ Quận Quốc Quốc sư, trong tay bưng lấy một quyển thiết thư, lắc lắc, nói: "« Thần Võ Ấn Ký Toàn Sách » phía trên ghi chép Côn Lôn Giới từ trước tới nay tất cả xuất hiện qua võ đạo ấn ký đồ án, từ Nhất phẩm võ đạo ấn ký đến Cửu phẩm võ đạo ấn ký, tất cả đều ghi lại ở. Tuy nhiên lại không có một cái nào ấn ký cùng Cửu vương tử điện hạ Thần Võ Ấn Ký tương xứng."

Vương hậu nương nương hướng về Trương Nhược Trần nhìn thoáng qua, mang theo vài phần đạm mạc, "Tất nhiên kiểm trắc không ra kết quả, đoán chừng chính là không có phẩm cấp Thần Võ Ấn Ký. Tại khác Quận Quốc, cũng xuất hiện qua một chút mở ra không biết Thần Võ Ấn Ký võ giả, thành tựu cuối cùng đều mười phần có hạn."

Bát vương tử cũng đứng tại trong doanh trướng, lập tức góp lời, nói: "Vương hậu nương nương nói không sai, Cửu đệ dù sao đã 16 tuổi, bỏ qua tốt nhất tu luyện niên kỷ, với hắn mà nói, coi như mở ra Tứ phẩm Thần Võ Ấn Ký, Ngũ phẩm Thần Võ Ấn Ký, cũng sẽ không có cái gì thành tựu."

Vương hậu nương nương nhẹ gật đầu, đồng ý Bát vương tử, nói: "Tất nhiên Cửu vương tử mở ra chỉ là không có phẩm cấp Thần Võ Ấn Ký, mà lại, cũng đã 16 tuổi, vì tận lực tiết kiệm Vương tộc tài nguyên tu luyện, cũng chỉ cho Cửu vương tử một phần Tẩy Tủy Dịch đi!"

Lâm Phi sắc mặt biến đổi, nói: "Vương hậu nương nương, mở ra Thần Võ Ấn Ký năm thứ nhất, là trọng yếu nhất một năm. Năm đó Thất vương tử mở ra Thần Võ Ấn Ký về sau, hết thảy đạt được mười hai phần Tẩy Tủy Dịch, mỗi tháng đều có thể tẩy tủy một lần. Trần Nhi, vì sao chỉ có thể đạt được một phần Tẩy Tủy Dịch?"

Vương hậu nương nương lạnh giọng mà nói: "Thất vương tử tại lúc ba tuổi, liền mở ra Thất phẩm Thần Võ Ấn Ký. Cửu vương tử há có thể cùng Thất vương tử so sánh?"

Bát vương tử nịnh nọt mà nói: "Thất ca, thế nhưng là Vương hậu nương nương con trai trưởng, kế thừa Vương hậu nương nương cường đại huyết mạch, có được Thất phẩm Thần Võ Ấn Ký, toàn bộ Vân Võ Quận Quốc ai có thể cùng Thất ca so sánh? Tương lai Vân Võ Quận Quốc có thể hay không càng thêm hưng thịnh, càng thêm cường đại, tất cả đều thắt ở Thất ca trên người một người."

Hắn lại nói: "Bản vương tử nói một câu không thích nghe, Thất ca một đầu ngón tay, cũng so Cửu đệ tính mệnh trọng yếu gấp mười lần, gấp trăm lần, căn bản không có khả năng so sánh."

Lâm Phi cắn chặt răng môi, tiếp tục vì Trương Nhược Trần tranh thủ, nói: "Thế nhưng là Bát vương tử mở ra Thần Võ Ấn Ký thời điểm, cũng đã nhận được bốn phần Tẩy Tủy Dịch."

Vương hậu nương nương mười phần không vui nói: "Thiên phú càng cao, lấy được tài nguyên càng nhiều. Cửu vương tử thiên phú thấp nhất, lấy được tài nguyên tự nhiên càng ít."

"Thế nhưng là..." Lâm Phi nói.

Vương hậu nương nương càng thêm không kiên nhẫn, trầm giọng nói: "Bổn hậu đã làm ra quyết định, Lâm Phi, ngươi như còn dám nói nhiều một câu, tin hay không bổn hậu để cho người ta đưa ngươi lần nữa kéo ra ngoài trượng chứ?"

"Lần nữa..." Trương Nhược Trần nghe được Vương hậu nương nương, thông suốt ngẩng đầu lên.

Chẳng lẽ Vương hậu nương nương đã từng trượng trách qua mẫu thân?

Lâm Phi nghe được Vương hậu nương nương lời nói về sau, toàn thân khẽ run lên, giống như là nhớ lại cái gì đáng sợ sự tình, lập tức ngậm miệng lại.

Giờ phút này, đã có người đem một phần Tẩy Tủy Dịch đưa tới, đưa tới Trương Nhược Trần trong tay.

Trương Nhược Trần tiếp nhận Tẩy Tủy Dịch, liền đi tới Lâm Phi bên người, xoay người thật sâu nhìn chằm chằm một chút ngồi ở phía trên Vương hậu nương nương, nói: "Mẫu thân, chúng ta trở về đi!"

"Ừm!" Lâm Phi nhẹ nhàng mím môi, đắng chát nhẹ gật đầu.

Vương hậu nương nương nhìn chằm chằm Trương Nhược Trần cùng Lâm Phi bóng lưng rời đi, nói: "Ba tháng về sau, liền là Vương tộc cuối năm khảo hạch, Cửu vương tử nhưng nhất định phải cố gắng tu luyện, tranh thủ tại trong vòng ba tháng hoàn thành "Tẩy tủy trùng mạch", trở thành một tên chân chính võ giả. Đến lúc đó, Đại vương cũng sẽ xuất quan, hi vọng ngươi có thể mang cho hắn kinh hỉ."

Lập tức lại vang lên Bát vương tử khinh thường thanh âm, cười nói: "Cho dù có ba phần Tẩy Tủy Dịch, cũng không có khả năng tại trong vòng ba tháng hoàn thành tẩy tủy trùng mạch. Ta đều hao tốn thời gian nửa năm mới làm đến, lấy Cửu đệ tư chất, đoán chừng phải hao phí một năm trở lên, mới có cơ hội. Ngân ngân!"

Trương Nhược Trần cũng không quay đầu, nắm thật chặt nắm đấm, ý niệm trong lòng mười phần kiên định, "Các ngươi liền đợi đến nhìn đi, ta tuyệt đối sẽ không để cho các ngươi thất vọng!"

Trở lại Tử Di Thiên Điện, Trương Nhược Trần liền không kịp chờ đợi đóng cửa phòng, lập tức tu luyện.

Mặc dù không biết mở ra là cái gì Thần Võ Ấn Ký, nhưng là, tất nhiên có được Thần Võ Ấn Ký, liền khẳng định có thể tu luyện ra chân khí.

Đầu tiên, bước đầu tiên, tại Thần Võ Ấn Ký phía dưới, mở ra "Khí Trì" .

Cái gọi là "Khí Trì", liền là dung nạp chân khí ao.

Ao càng lớn, dung nạp chân khí càng nhiều. Theo tu vi tăng lên, "Khí Trì" cũng sẽ dần dần mở rộng.

Nói như vậy, muốn mở "Khí Trì", nhất định phải tại trưởng bối chỉ điểm xuống tiến hành.

Đối với có được phong phú kinh nghiệm tu luyện Trương Nhược Trần tới nói, mở "Khí Trì" cũng không phải là việc khó, vẻn vẹn chỉ là tốn hao nửa canh giờ, hắn liền thành công mở ra "Khí Trì" .

Đối với tu sĩ khác tới nói, ít nhất cũng phải tốn hao mấy ngày thời gian tiến hành nếm thử, mới có thể đem "Khí Trì" mở ra tới.

Trương Nhược Trần lại chỉ dùng nửa canh giờ.

"Cỗ thân thể này quả nhiên rất nhỏ yếu, cũng chỉ là mở ra lớn chừng cái trứng gà một cái Khí Trì, có thể dung nạp chân khí quá ít!"

Mở ra "Khí Trì", còn xa xa không đủ.

Khí Trì, chỉ là chứa đựng chân khí địa phương.

Chân khí muốn tại toàn thân vận hành, nhất định phải mở ra thuộc về mình tu luyện kinh mạch.

Chỉ có hoàn thành một bước này, mới có thể có được chân khí, trở thành một tên chân chính võ giả.

Sau đó liền là bước thứ hai, tẩy tủy trùng mạch.

Trương Nhược Trần lấy ra một con kia chứa Tẩy Tủy Dịch bình ngọc nhỏ, dùng cái mũi nhẹ nhàng hít hà, xác định là thật Tẩy Tủy Dịch về sau, trực tiếp đem trọn bình Tẩy Tủy Dịch rót vào miệng bên trong.

Tẩy Tủy Dịch vào cổ họng về sau, mười phần lạnh buốt, nhưng là, vẻn vẹn chỉ là đi qua một cái sát na, cái kia một cỗ băng lãnh liền biến mất không thấy, thay vào đó là một cỗ nóng hổi nhiệt độ cao.

Tựa như có một đám lửa, tại thể nội thiêu đốt!

Từng tia hỏa diễm, tiến vào Trương Nhược Trần toàn thân mỗi một chỗ kinh mạch, sau đó, dung nhập kinh mạch.

Chính là cái này thời điểm!

"« Cửu Thiên Minh Đế Kinh », tầng thứ nhất, Thái Hoàng Hoàng Cảnh Thiên."

Tu luyện khác biệt công pháp, mở ra đến kinh mạch lộ tuyến tự nhiên không giống.

Càng là cao thâm công pháp, kinh mạch lộ tuyến thì càng nhiều, càng phức tạp, càng sợ kỳ.

« Cửu Thiên Minh Đế Kinh » vận hành kinh mạch, hết thảy nhiều đến 36 đầu.

Đương nhiên, Trương Nhược Trần hiện tại cũng không cần đem tất cả kinh mạch toàn bộ mở ra đến, chỉ cần mở ra đầu thứ nhất kinh mạch, liền xem như hoàn thành tẩy tủy trùng mạch.

"Bọn hắn nói ta tốn hao ba tháng thời điểm cũng không thể hoàn thành tẩy tủy trùng mạch, nhưng là, ta sẽ dùng hành động thực tế chứng minh, đêm nay ta liền có thể hoàn thành tẩy tủy trùng mạch, trở thành một tên chân chính võ giả!"

Trương Nhược Trần mượn nhờ ở kiếp trước kinh nghiệm tu luyện, lợi dụng chỉ có một sợi chân khí, toàn lực trùng mạch, rất nhanh liền đem đầu thứ nhất kinh mạch đả thông hơn phân nửa.

Một cỗ đau đớn kịch liệt, từ thể nội truyền đến, tựa như kinh mạch muốn bị xé đứt, để Trương Nhược Trần toàn thân run rẩy một cái.

Nếu là những người khác, gặp phải tình huống như vậy, khẳng định đã trùng mạch thất bại.

Nhưng là, Trương Nhược Trần lại cắn chặt hàm răng, lấy ý chí cường đại lực kiên trì nổi , mặc cho mồ hôi không ngừng rớt xuống đất, từ đầu đến cuối không buông bỏ.

"Chỉ kém... Cuối cùng một đoạn ngắn..."

Hi vọng đang ở trước mắt, nhất định phải trùng mạch thành công!

Nhất định phải thành công!

Trương Nhược Trần nhất cổ tác khí, là số không nhiều chân khí toàn bộ trùng kích đi qua.

"Oanh!"

Một tiếng vang thật lớn từ thể nội truyền đến, phát ra thanh âm điếc tai nhức óc, kém một chút đem Trương Nhược Trần chấn động đến ngất đi.

Cái kia một cỗ cảm giác đau đớn biến mất về sau, chỉ cảm thấy một cỗ lạnh buốt khí lưu ở trong kinh mạch lưu động, cảm giác đau đớn dần dần biến mất, một cỗ trước nay chưa có sảng khoái truyền khắp toàn thân.

"Ha ha! Thành công! Thành công hoàn thành tẩy tủy trùng mạch, trở thành một tên chân chính võ giả!"

Bát vương tử hoàn thành một bước này, phục dụng bốn phần Tẩy Tủy Dịch, ròng rã hao tốn thời gian nửa năm.

Trương Nhược Trần vẻn vẹn chỉ là dùng một đêm, cũng chỉ phục dụng một phần Tẩy Tủy Dịch.

Hoàn thành tẩy tủy trùng mạch, liền là "Hoàng Cực Cảnh sơ kỳ" tu vi.

Võ Đạo tu luyện, chia làm "Vàng, huyền,, trời" tứ đại cảnh giới, tức: Hoàng Cực Cảnh, Huyền Cực Cảnh, Địa Cực Cảnh, Thiên Cực Cảnh.

Mỗi cái đại cảnh giới, chia làm bảy cái tiểu cảnh giới, chia làm là: Sơ kỳ, trung kỳ, hậu kỳ, tiểu cực vị, trung cực vị, đại cực vị, đại viên mãn.

Tứ đại bảy nhỏ.

Trương Nhược Trần hiện tại liền là Hoàng Cực Cảnh sơ kỳ tu vi.

Hoàng Cực Cảnh "Sơ kỳ", "Trung kỳ", "Hậu kỳ", mở kinh mạch, chân khí bình thể, làm lực lượng của thân thể trở nên càng ngày càng mạnh, mỗi tăng lên một cái tiểu cảnh giới, lực lượng liền sẽ tăng cường một mảng lớn.

Bát vương tử liền là Hoàng Cực Cảnh hậu kỳ tu vi, có thể tay không giơ lên nặng ba trăm cân bàn đá, đem bàn đá ném ra xa mười trượng. Hắn đánh ra một quyền lực lượng, có thể so với một đầu Man Ngưu lực lượng.

Hoàng Cực Cảnh hậu kỳ võ giả, phần lớn đều có thể tu luyện ra "Nhất ngưu chi lực" .

Tại "Hậu kỳ" phía trên, liền là "Tiểu cực vị", "Trung cực vị", "Đại cực vị", "Đại viên mãn" bốn cái cảnh giới.

Đột phá Hoàng Cực Cảnh hậu kỳ, liền có thể đạt tới Hoàng Cực Cảnh tiểu cực vị, lập tức liền có thể có được "Tứ ngưu chi lực", lực lượng lật ra bốn lần.

Cho nên, Hoàng Cực Cảnh tiểu cực vị võ giả, đối đầu Hoàng Cực Cảnh hậu kỳ võ giả, đơn giản tựa như đại nhân đối đầu tiểu hài, một người đánh mười người, cũng hoàn toàn không có vấn đề.

Lại hướng lên "Trung cực vị", "Đại cực vị", "Đại viên mãn", càng khủng bố hơn, có được thường nhân khó có thể tưởng tượng lực lượng.

Những cảnh giới kia cách Trương Nhược Trần còn rất xa xôi, bây giờ căn bản không cần suy nghĩ nhiều, ổn trát ổn đả tu luyện mới là mấu chốt, một bước một cái dấu chân, mới có thể đi được càng xa.

Bát vương tử tu luyện tám năm, cũng mới đạt tới Hoàng Cực Cảnh hậu kỳ, chỉ có thể coi là phổ Thông Thiên phú.

"Bát vương tử tốn hao thời gian nửa năm, mới hoàn thành tẩy tủy trùng mạch. Ta chỉ dùng một đêm thời gian."

"Bát vương tử hao tốn thời gian tám năm, mới tu luyện đến Hoàng Cực Cảnh hậu kỳ. Ta nhất định phải tại trong vòng ba tháng, hoàn thành cái mục tiêu này. Đối với ta mà nói, cũng không phải là không có cơ hội làm đến."

Ba tháng về sau, liền là Vương tộc cuối năm khảo hạch, tất cả Vương tộc tuổi trẻ võ giả, bao quát các vị Vương tử, quận chúa, hoàng thân quốc thích, toàn bộ đều sẽ tham gia khảo hạch, kiểm nghiệm một năm đã qua thành quả tu luyện.

Tại trong vương tộc, muốn thu hoạch được địa vị, muốn được người tôn trọng, muốn thu hoạch được càng nhiều tài nguyên tu luyện, nhất định phải chứng minh thực lực của mình.

Ba tháng!

Trong vòng ba tháng, nhất định phải tu luyện tới Hoàng Cực Cảnh hậu kỳ, coi như không vì mình, cũng phải vì vị kia quan tâm cùng yêu thương mẹ ruột của mình, vì nàng tranh thủ đến thuộc về nàng tôn nghiêm.', 3);


INSERT INTO comments ( acId, storyId, chapterId, content) VALUES 
( 2, 1, 1, N'Hay'),
( 3, 1, 1, N'Truện Hay'),
( 4, 1, 1, N'Khó Hiểu'),
( 5, 1, 1, N'Truyện Rất Hay'),
( 3, 2, 1, N'Truyện Dở quá'),
( 3, 2, 1, N'Không đến lỗi nào'),
( 4, 2, 1, N'Tạm Được'),
( 5, 2, 1, N'Cũng Hay');


INSERT INTO favorites ( acId, storyId) VALUES ( 2, 1);
INSERT INTO favorites ( acId, storyId) VALUES ( 3, 1);
INSERT INTO favorites ( acId, storyId) VALUES ( 4, 1);
INSERT INTO favorites ( acId, storyId) VALUES ( 5, 1);
INSERT INTO favorites ( acId, storyId) VALUES ( 6, 1);
INSERT INTO favorites ( acId, storyId) VALUES ( 2, 2);
INSERT INTO favorites ( acId, storyId) VALUES ( 3, 2);
INSERT INTO favorites ( acId, storyId) VALUES ( 4, 2);
INSERT INTO favorites ( acId, storyId) VALUES ( 6, 2);
INSERT INTO favorites ( acId, storyId) VALUES ( 3, 8);
INSERT INTO favorites ( acId, storyId) VALUES ( 5, 8);
INSERT INTO favorites ( acId, storyId) VALUES ( 6, 8);
INSERT INTO favorites ( acId, storyId) VALUES ( 4, 10);
INSERT INTO favorites ( acId, storyId) VALUES ( 5, 10);
INSERT INTO favorites ( acId, storyId) VALUES ( 4, 13);

