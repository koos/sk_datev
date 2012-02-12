class FrontendController < ApplicationController
  skip_before_filter :login_required
  layout 'frontend'  
end