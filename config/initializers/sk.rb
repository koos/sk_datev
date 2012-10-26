require 'sk_sdk/base'

module SK

  begin
    sk = YAML.load_file(File.join(Rails.root, 'config', 'salesking_app.yml'))
    SK_SETUP = sk[Rails.env]
  rescue
    puts "Error reading config/salesking.yml please create and review this file"
  end

  SK::SDK::Base.set_connection( { :site => SK_SETUP['sk_url'],
                                  :user => SK_SETUP['user_name'],
                                  :password => SK_SETUP['password']})
end
# setup base classes
%w(Invoice).each do |model|
  eval "class SK::#{model} < SK::SDK::Base;end" unless Object.const_defined?(model)
end

