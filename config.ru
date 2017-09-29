require "roda"
require_relative './app/resources/managed_links'
require_relative './app/resources/redirects'

class V1 < Roda
  plugin :json, classes: [Hash]

  route do |r|
    r.on "managed_links" do
      r.post do
        Resources::ManagedLinks.post(r.params)
      end
    end
  end
end

class API < Roda
  route do |r|
    r.on "v1" do
      r.run V1
    end
  end
end

class DryLinkr < Roda
  route do |r|
    r.root do
      r.redirect 'https://acimacredit.com'
    end

    r.get 'status' do
      response.status = 200
    end

    r.on "api" do
      r.run API
    end

    r.get String do |short_code|
      destination = Resources::Redirects.get(short_code)
      r.redirect destination
    end
  end
end

run DryLinkr.freeze.app
