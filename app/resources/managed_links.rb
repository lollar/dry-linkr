module Resources
  class ManagedLinks
    def self.post(params)
      ManagedLinks::Create.call(params).to_hash
    end
  end
end
