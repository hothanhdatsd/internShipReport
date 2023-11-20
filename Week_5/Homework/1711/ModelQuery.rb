- find : tìm kiếm dựa theo khóa chính
vd : User.find(20) -> Tìm kiếm user dựa theo id =  20

- find_by : Tìm kiếm dựa theo một điều kiện cụ thể
vd : User.find_by(name:"JOHN") -> Tìm kiếm user tên JOHN

find_by! : Tìm kiếm dựa trên một điều kiện cụ thể nhưng có ném ra ngoại lệ
vd : User.find_by!(name:"JOHN") -> Tìm kiếm user tên JOHN khi không có user thì trả về một ngoại lệ


Query N+1 là vấn đề thường xảy ra trong lập trình ORM, khi thực hiện một truy vấn chính và sau đó thực hiện thêm một loạt các truy vấn phụ để lấy dữ liệu liên quan.
vd : users = User.all 
users.each do |user|
 puts user.posts.count
end
->> Thực hiện lấy tất cả user và sau đó chạy vòng lặp để đếm số posts của từng user
