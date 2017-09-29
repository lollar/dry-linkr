module Resources
  class ManagedLinks
    def self.post(params)
      puts params
      { success: true, message: "hey mike!" }
    end
  end
end
