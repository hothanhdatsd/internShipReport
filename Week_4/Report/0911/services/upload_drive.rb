require 'google_drive'

session = GoogleDrive::Session.from_service_account_key("key.json")

# Tạo một thư mục trên Google Drive
session.files.each do |file|
  p file
end
# docx_file_path = "data/TableChart.docx"
# uploaded_file = session.upload_from_file(docx_file_path, "TableChart.txt", convert: true)
# if uploaded_file
#   puts "Tệp đã tải lên thành công!"
#   puts "ID của tệp: #{uploaded_file.id}"
#   puts "Tên của tệp: #{uploaded_file.title}"
#   puts "Đường dẫn trực tiếp: #{uploaded_file.human_url}"
#   p uploaded_file
# else
#   puts "Tải lên tệp không thành công."
# end


file = session.file_by_id("1kKygKGeNABE75QUK2WmfFoG3UeleJFzA")

# Kiểm tra xem tệp có tồn tại không
if file
  # Tải xuống tệp và lưu vào đường dẫn cụ thể
  file.download_to_file("data/FreebieMarket.zip")
  # p file.methods
  puts "Tệp đã được tải xuống thành công và lưu trong thư mục 'data'."
else
  puts "Không tìm thấy tệp có tiêu đề 'TableApi'."
end