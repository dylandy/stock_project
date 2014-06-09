class HomeController < ApplicationController
  def show
    user_item_info = Selection.where(:userid => current_user.id)
  end
end
