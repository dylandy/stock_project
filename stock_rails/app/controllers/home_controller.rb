class HomeController < ApplicationController
  def show
    find_stock=[]
    user_item_info = Selection.where(:userid => current_user.id).all

    user_item_info.each do |i|
      find_stock << i.itemid
    end
    @user_item=[]
    find_stock.each do |f|
      @user_item << ItemTable.where(:id => f).first
    end
  end
  def search
    output=[]
    if !params[:search].nil?
      if ItemTable.where(:item_id => params[:search]).empty?
        output << ItemTable.where(:name => params[:search].dump).first.id
      else
        output << ItemTable.where(:item_id => params[:search]).first.id
      end
    end
    output.each do |o|
      sl = Selection.new
      sl.userid = current_user.id
      sl.itemid = o
      sl.save
    end
  end
end
