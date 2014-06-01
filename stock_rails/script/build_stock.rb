require 'rubygems'
require 'yahoo_finance'
require 'active_record'


class ItemTable < ActiveRecord::Base ; end

module BuildStock
  DB_CONNECTION_SETTING = {
    adapter: "mysql2",
    encoding: "utf8",
    database: "stock_rails_development",
    pool: 5,
    username: "root",
    password: '0000',
    socket: "/var/run/mysqld/mysqld.sock"
  }

  def self.initialize
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection(DB_CONNECTION_SETTING)
  end

  def self.go!
    initialize()
    stock_filter()
  end

  def self.stock_filter
    target_1=[];target_2=[];target_3=[];target_4=[];data_1=[];data_2=[];data_3=[];data_4=[];stock =[]
    #create array for request 
    (1101..5601).each do |t| target_1 << t.to_s+".TW";target_3 << t.to_s+".TWO";end
    (5602..9962).each do |t| target_2 << t.to_s+".TW";target_4 << t.to_s+".TWO";end
    
    puts "fetching data"

    data_1 = YahooFinance.quotes(target_1,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})
    data_2 = YahooFinance.quotes(target_2,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})
    data_3 = YahooFinance.quotes(target_3,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})
    data_4 = YahooFinance.quotes(target_4,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})
    
    puts "data fetched"
    
    data_1.each do |t| if t.ask != 0 then stock << t end;end
    data_2.each do |t| if t.ask != 0 then stock << t end;end
    data_3.each do |t| if t.ask != 0 then stock << t end;end
    data_4.each do |t| if t.ask != 0 then stock << t end;end
    
    puts "stock saved"

  #目前 stock 獲得最新的所有資料，下面存入資料庫
    puts "start saving db"
    if ItemTable.count == 0
      (0..stock.length-1).each do |i|
        item = ItemTable.new
        item.ask = stock[i].ask
        item.prev_close = stock[i].previous_close
        item.name = stock[i].name
        item.high = stock[i].high
        item.low = stock[i].low
        item.open = stock[i].open
        item.close = stock[i].close
        item.volume = stock[i].volume
        item.ask = stock[i].ask
        item.bid = stock[i].bid
        item.item_id = stock[i].symbol
        item.save
      end
    else 
      item = ItemTable.all
      stock.each_with_index do |s , index|
        item.each do |i|
          if i.item_id == s.symbol
            i.ask = s.ask
            i.bid = s.bid
            i.prev_close = s.previous_close
            i.name = s.name
            i.high = s.high
            i.low = s.low
            i.open = s.open
            i.close = s.close
            i.volume = s.volume  
            i.save
            s = 0
          end
        end
      end
=begin
          item = ItemTable.new
          item.ask = s.ask
          item.prev_close = s.previous_close
          item.name = s.name
          item.high = s.high
          item.low = s.low
          item.open = s.open
          item.close = s.close
          item.volume = s.volume
          item.ask = s.ask
          item.bid = s.bid
          item.item_id = s.symbol
          item.save                              
=end
    end
    stock.each do |s|
      if s != 0
        puts s
      end
    end
  end
end
BuildStock.go!
