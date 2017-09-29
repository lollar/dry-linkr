require 'rom-repository'

class ManagedLinkRepo < ROM::Repository[:managed_links]
  ValidShortCode = -> (short_code) { short_code.to_s.length >= 16 }
  commands :create
end
