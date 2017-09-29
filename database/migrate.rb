require_relative 'migrations/create_managed_links_table'

begin
  Migrations::CreateManagedLinksTable.up
rescue Sequel::DatabaseError => e
  puts "Skipping migration because: #{e.message}"
  true
end
