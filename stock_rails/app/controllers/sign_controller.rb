class SignController < ApplicationController
  def index
  end
  def create
    if User.where(:account => params[:account]) && User.where(:account => params[:account]).first.status != 1
      check = params[:pwd]
      check = Digest::SHA1.hexdigest check
      if User.where(:account => params[:account]).first.pwd == check
        checker = User.where(:account => params[:account]).first
        checker.status = 1
        checker.save
        @checking = 1
      end
    else
      @checking = 2
    end
  end
end