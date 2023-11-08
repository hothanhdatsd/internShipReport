# frozen_string_literal: true

require './services/import_data'
require './services/export_data'
require './services/user'
require './services/export_data_to_docx'

# Importer.import_user('users.csv')
Exporter.export_chart(User.get_list_user('active'))
# ExportDocx.export_table
