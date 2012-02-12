require 'spec_helper'

describe FrontendController do
  render_views

  describe "GET #index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
end