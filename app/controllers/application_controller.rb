class ApplicationController < ActionController::Base
#  include AuthenticateSk
  protect_from_forgery
  before_filter :login_required

  protected

    def current_user
      User.find_by_sk_access_token(session['access_token'])
    end
    
    def current_company_id
      session['company_id']
    end
    
    def current_user_id
      session['user_id']
    end

    def login_required
      (session['user_id'] && session['company_id'] && session['access_token']) || access_denied
    end

    def access_denied
      if session['sub_domain'] && Sk::APP.sub_domain == session['sub_domain'] # go to sk url if
        render :inline => "<script> top.location.href='#{Sk::APP.sk_url}'</script>"
      else
        flash[:error] = t(:'errors.sk_login_required')
        redirect_to root_url
      end
    end
end