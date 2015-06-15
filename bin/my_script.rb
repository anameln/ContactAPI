require 'addressable/uri'
require 'rest-client'

# def
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.json'
#
# ).to_s
#
# puts RestClient.get(url)

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s
    begin
    puts RestClient.post(
      url,
      { user: { name: "Gizmo", email: "gismo@gismo.gizmo" } }
    )
    rescue RestClient::Exception
    end
end
