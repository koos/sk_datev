class ExportsController < ApplicationController

  def index
  end

  def prepare_new
  end

  def new
    @invoices = SK::Invoice.find(:all, :client_id => current_user.sk_user_id, :from => params[:from], :to => params[:to])

    @export = Export.new
  end

  def create
  end
  
end
