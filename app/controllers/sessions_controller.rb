require "sk_sdk/oauth"
require "sk_sdk/signed_request"

class SessionsController < ApplicationController
  skip_before_filter :login_required
  # POST Receives the oauth code from SalesKing, saves it to session
  # renders canvas haml
  def create
    response = SK::SDK::SignedRequest.new(params[:signed_request], Sk::APP.secret)
    raise "invalid SalesKing app signed-request #{response.data.inspect}" unless response.valid?
    # always save and set subdomain
    Sk::APP.sub_domain = session['sub_domain'] = response.data['sub_domain']
    if response.data['user_id'] # logged in
      # new session with access_token, user_id, sub_domain
      session['access_token'] = response.data['access_token']
      session['user_id'] = response.data['user_id']
      session['company_id'] = response.data['company_id']
      # raise response.data.inspect
      # TODO add user_name
      # session['name'] = response.data['user_name']
      User.create(:sk_access_token => session['access_token'], :sk_user_id => session['user_id'], :sk_company_id => session['sk_company_id'])
      redirect_to exports_url
    else # must authorize redirect to oauth dialog
      render :inline => "<script> top.location.href='#{Sk::APP.auth_dialog}'</script>"
    end
  end

  #GET coming back from auth dialog as redirect_url
  def new
    if params[:code] # coming back from auth dialog as redirect_url
      Sk::APP.sub_domain = session['sub_domain']
      Sk::APP.get_token(params[:code])
      #redirect to sk internal canvas page, where we are now authenticated
      render :inline => "<script> top.location.href='#{Sk::APP.sk_canvas_url}'</script>"
    end
  end
end