require './services/import_data'
require './services/export_data'
require './services/user'


Importer.import_user('users.csv')
Exporter.export_chart(User.get_list_user('name'))
