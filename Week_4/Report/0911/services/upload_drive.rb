require 'google_drive'

session = GoogleDrive::Session.from_service_account_key("key.json")



# Tạo một thư mục trên Google Drive
# session.files.each do |file|
#   p file
# end

# #xem file trong folder 
# files_in_folder = session.collection_by_id("1mI0nQSMqBNyBbQk4BxbEX41jynUZGCFJ").files
# files_in_folder.each do |file|
#   puts "ID của tệp: #{file.id}"
#   puts "Tên của tệp: #{file.title}"
#   puts "Đường dẫn trực tiếp: #{file.human_url}"
#   puts "---------"
# end


# tao folder
# folder_name = "Data"
# folder = session.create_collection(folder_name)

# folder_name_to_search = "Data"
# target_folder = session.collections.select { |collection| collection.title == folder_name_to_search }.first
# if target_folder.nil?
#   target_folder = session.create_collection(folder_name_to_search)
#   puts "Thư mục mới đã được tạo: #{target_folder.title}"
# end
# docx_file_path = "data/TableChart.docx"
# uploaded_file = target_folder.upload_from_file(docx_file_path, "TableChart.txt", convert: true)


# upload file
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

# file = session.file_by_id("1kKygKGeNABE75QUK2WmfFoG3UeleJFzA")
# p file
# # Kiểm tra xem tệp có tồn tại không
# if file
#   # Tải xuống tệp và lưu vào đường dẫn cụ thể
#   file.download_to_file("data/FreebieMarket.zip")
#   # p file.methods
#   puts "Tệp đã được tải xuống thành công và lưu trong thư mục 'data'."
# else
#   puts "Không tìm thấy tệp có tiêu đề 'TableApi'."
# end


user_email = 'hothanhdatsd@gmail.com'
folder_id = '1mI0nQSMqBNyBbQk4BxbEX41jynUZGCFJ'
folder = session.folder_by_id(folder_id)
folder.acl.push(type: 'user', role: 'writer', email_address: user_email)
puts "Folder shared with: #{user_email}"