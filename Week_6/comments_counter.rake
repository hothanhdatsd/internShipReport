desc 'Counter cache for project has many tasks'

task task_counter: :environment do
  User.reset_column_information
  User.pluck(:id).find_each do |p|
    User.reset_counters p.id, :comments
  end
end
