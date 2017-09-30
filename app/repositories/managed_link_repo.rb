require 'rom-repository'

class ManagedLinkRepo < ROM::Repository[:managed_links]
  ValidShortCode = -> (short_code) { short_code.to_s.length >= 16 }
  commands :create

  def short_code_exists?(short_code)
    !!managed_links.where(short_code: short_code).one
  end
end
