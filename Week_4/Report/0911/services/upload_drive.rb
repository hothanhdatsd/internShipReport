# frozen_string_literal: true

require 'google_drive'

# upload file to drive
class UploadDrive
  # Xem file tren session
  def self.list_file
    session.files.each do |file|
      p file
    end
  end

  # xem file trong folder
  def self.list_in_folder(name_folder)
    folder_id = take_id_folder(name_folder)
    files_in_folder = session.collection_by_id(folder_id).files
    files_in_folder.each do |file|
      puts "ID của tệp: #{file.id}"
      puts "Tên của tệp: #{file.title}"
      puts "Đường dẫn trực tiếp: #{file.human_url}"
      puts '---------'
    end
  end

  def self.create_folder(name)
    session.create_collection(name)
  end

  # upload file  to folder
  def self.upload_to_folder(folder_name, file_name, name_file_on_drive)
    target_folder = session.collections.select { |collection| collection.title == folder_name }.first
    if target_folder.nil?
      target_folder = session.create_collection(folder_name)
      puts "Thư mục mới đã được tạo: #{target_folder.title}"
    end
    # docx_file_path = 'data/TableApi.docx'
    target_folder.upload_from_file(file_name, name_file_on_drive, convert: true)
  end

  # share folder to user
  def self.share_folder(name_folder, name_user)
    folder_id = take_id_folder(name_folder)
    folder = session.folder_by_id(folder_id)
    permission = {
      type: 'user', role: 'writer', email_address: name_user
    }
    folder.acl.push(permission)
    puts "Folder shared with: #{name_user}"
  end

  # lay id cua folder
  def self.take_id_folder(str)
    session.folders do |folder|
      return folder.id if folder.title == str
    end
  end

  # lay session
  def self.session
    GoogleDrive::Session.from_service_account_key('key.json')
  end

  # list folders
  def self.list_folders
    session.folders do |folder|
      p folder
    end
  end
end

# upload file
# docx_file_path = 'data/TableChart.docx'
# uploaded_file = session.upload_from_file(docx_file_path, 'TableChart.txt', convert: true)
# if uploaded_file
#   puts 'Tệp đã tải lên thành công!'
#   puts "ID của tệp: #{uploaded_file.id}"
#   puts "Tên của tệp: #{uploaded_file.title}"
#   puts "Đường dẫn trực tiếp: #{uploaded_file.human_url}"
#   p uploaded_file
# else
#   puts 'Tải lên tệp không thành công.'
# end

## download
# folder = session.folder_by_id('1mI0nQSMqBNyBbQk4BxbEX41jynUZGCFJ')
# if folder
#   puts "Tệp đã được tải xuống thành công và lưu trong thư mục 'data'."
# else
#   puts "Không tìm thấy tệp có tiêu đề 'TableApi'."
# end

UploadDrive.share_folder('TestTest', 'hothanhdatsd@gmail.com')
