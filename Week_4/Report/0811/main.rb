require_relative 'import_data'
require_relative 'export_data'
require_relative 'user'


# Importer.import_user('users.csv')
user = User.get_list_user('name')
Exporter.export_chart(user)
