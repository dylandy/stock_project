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
    session[:return_to] = request.referer
    output=[]
    if !params[:search].nil?
      if ItemTable.where(:item_id => params[:search]).empty?
        Selection.where(:userid => current_user.id).all.each do |i|
          if i.itemid ==  ItemTable.where(:name => params[:search].dump).first.id
            puts "item already exists"
            params[:search] = nil
          end
        end
        if !ItemTable.where(:name => params[:search].dump).first.nil?
          output << ItemTable.where(:name => params[:search].dump).first.id
        end
      else
      Selection.where(:userid => current_user.id).all.each do |i|
        if i.itemid ==  ItemTable.where(:item_id => params[:search]).first.id
          puts "item already exists"
          params[:search] = nil
        end
      end
      if !ItemTable.where(:item_id => params[:search]).first.nil?
        output << ItemTable.where(:item_id => params[:search]).first.id
      end
      end
    else
      #can't find
    end
    output.each do |o|
      sl = Selection.new
      sl.userid = current_user.id
      sl.itemid = o
      sl.save
    end
  redirect_to :back
  end

  def destory
    session[:return_to] = request.referer
    del = Selection.where(:itemid => params[:u]).first
    del.delete
    redirect_to :back
  end
end
