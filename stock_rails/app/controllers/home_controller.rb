class HomeController < ApplicationController
  def show
    @user_item = Selection.where(:userid => current_user.id).all
  end
  def search
  end
end
