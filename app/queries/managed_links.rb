require 'rom'

module Queries
  class ManagedLinks < ROM::Relation[:sql]
    schema(infer: true)

    def short_code_exists?(short_code)
      where(short_code: short_code)
    end
  end
end

rom = ROM.container(:sql, 'postgres://localhost/dry_linkr_development')
