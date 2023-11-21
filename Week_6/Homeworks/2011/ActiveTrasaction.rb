Active Record Transactions là cách để đảm bảo rằng một loạt các thao tác cơ sở dữ liệu ent hoặc tất cả thành công hoặc tất cả thất bại cùng nhau. Điều này rất quan trọng để duy trì tính toàn vẹn dữ liệu, đặc biệt là trong các tình huống khi cần thực hiện nhiều thao tác như một đơn vị duy nhất.

class Product < ActiveRecord::Base
  product1 = Product.create(name: 'Sản phẩm 1', price: 10)
  product2 = Product.create(name: 'Sản phẩm 2', price: 20)

end
- Nếu bất kỳ thao tác nào gấy ra lỗi sẽ ném ra một exception, toàn bộ xử lí sẽ bị rollback


- Khi sử dụng save hoặc destroy, ActiveRecord thường kiểm tra xem có lỗi nào xảy ra không. Nếu có lỗi (ví dụ: vi phạm ràng buộc cơ sở dữ liệu), save có thể trả về false và destroy có thể ném ra một ngoại lệ.


begin
  ActiveRecord::Base.transaction do
  # thực hiện các tác vụ
  end
rescue => e
ensure
  # Xử lý ngoại lệ: log, thông báo, hoặc thực hiện các hành động phù hợp nếu ném ra ngoại lệ, tras sẽ tự động rollback và hàm rescue sẽ được thực thi
  
  
  
  ------ after commit và after rollback
  class Order < ActiveRecord::Base
  	after_commit :send_confirmation_email
  private

  def send_confirmation_email
    # Gửi email xác nhận sau khi giao dịch được commit
  end
end


class Payment < ActiveRecord::Base
  after_rollback :alert_admin

  private

  def alert_admin
    # Thông báo cho quản trị viên khi giao dịch bị rollback
  end
end


- Giao dịch lồng nhau trong ActiveRecord cho phép bạn mở một giao dịch bên trong một giao dịch khác. Điều này có thể hữu ích khi bạn muốn thực hiện các thao tác phức tạp, và muốn kiểm soát việc commit hoặc rollback từng phần của giao dịch.





