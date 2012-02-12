require 'sk_api_schema'
require 'sk_sdk/base'
require 'sk_sdk/oauth'
# Tiny helper class for talking to SalesKing
# - Setup local Sk:: classes for remote objects. client, address,..
# - construct writable fields
class Sk
  # setup oAuth app info, local classes
  @@conf = YAML.load_file(Rails.root.join('config', 'salesking_app.yml'))
  #raise 'config/salesking_app.yml missing' if !@@conf || @@conf.empty?
  APP = SK::SDK::Oauth.new(@@conf[Rails.env])
  %w{Client Address Invoice LineItem Product}.each do |model|
    eval "class #{model} < SK::SDK::Base;end"
  end
  
  # init SalesKing classes and set connection oAuth token
  def self.init(site, token)
    SK::SDK::Base.set_connection( {:site => site, :token => token} )
  end

  # read json-schema
  def self.read_schema(kind)
    SK::Api::Schema.read(kind, '1.0')
  end
end
