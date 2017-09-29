require 'rom'

module Migrations
  class CreateManagedLinksTable
    def self.up
      rom = ROM.container(:sql, 'postgres://localhost/dry_linkr_development') do |conf|
        conf.default.create_table(:managed_links) do
          primary_key :id
          column :short_code, String, null: false
          column :destination_url, String, null: false
        end
      end
    end
  end
end

