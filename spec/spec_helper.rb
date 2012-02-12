require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "/vendor/"
end
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

def user_login(params = {})
  @request.session['access_token'] = params[:access_token] || 'abcdefg'
  @request.session['user_id'] = params[:user_id] || 'some-user_id'
  @request.session['company_id'] = params[:company_id] || 'a-company_id'
  @request.session['sub_domain'] = params[:sub_domain] || 'my-subdomain'
end

def stub_sk_client
  Sk.init('http://localhost', 'some-token')
  client = Sk::Client.new
  Sk::Client.stub(:new).and_return(client)
  client.stub(:save).and_return(true)
  client
end

def sk_config
  YAML.load_file(Rails.root.join('config', 'salesking_app.yml'))[Rails.env]
end

def sk_url(sub_domain)
  sk_config['sk_url'].gsub('*', sub_domain)
end

def canvas_slug
  sk_config['canvas_slug']
end

def response_to_json
  ActiveSupport::JSON.decode(response.body)
end
