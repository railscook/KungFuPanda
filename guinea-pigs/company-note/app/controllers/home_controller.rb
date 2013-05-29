class HomeController < ApplicationController
  def index
    @companies = Company.all
    respond_to do |format|
      format.mobile # index.html.erb
      format.json { render json: @companies }
      format.html
    end

  end
end
