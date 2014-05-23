require 'rubygems'
require 'yahoo_finance'
require 'active_record'


class ItemTable < ActiveRecord::Base ; end

module BuildStock
  DB_CONNECTION_SETTING = {
    adapter: "mysql2",
    encoding: "utf8",
    database: "project_development",
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
    target_1=[]
    target_2=[]
    data_1=[]
    data_2=[]
    stock =[]

    #create array for request 
    (1101..5601).each do |t|
      target_1 << t.to_s+".TW"
    end

    (5602..9962).each do |t|
      target_2 << t.to_s+".TW"
    end

    data_1 = YahooFinance.quotes(target_1,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})
    data_2 = YahooFinance.quotes(target_2,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})

    data_1.each do |t|
      if t.ask != 0
      stock << t
      end
    end

    data_2.each do |t|
      if t.ask != 0
      stock << t
      end
    end

    target_1.clear
    target_2.clear
    data_1.clear
    data_2.clear
 
    (1101..5601).each do |t|
      target_1 << t.to_s+".TWO"
    end

    (5602..9962).each do |t|
      target_2 << t.to_s+".TWO"
    end

    data_1 = YahooFinance.quotes(target_1,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})
    data_2 = YahooFinance.quotes(target_2,[:ask, :bid, :high, :low, :open, :close, :previous_close, :volume, :name],{raw:false})

    data_1.each do |t|
      if t.ask != 0
      stock << t
      end
    end

    data_2.each do |t|
      if t.ask != 0
      stock << t
      end
    end
  #目前 stock 獲得最新的所有資料，下面存入資料庫
    if ItemTable.count == 0
      (0..stock.length).each do |i|
        item = ItemTable.new
        item.id = i+1
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
      (0..stock.length).each do |i|
        item[i].ask = stock[i].ask
        item[i].bid = stock[i].bid
        item[i].prev_close = stock[i].preveious_close
        item[i].name = stock[i].name
        item[i].high = stock[i].high
        item[i].low = stock[i].low
        item[i].open = stock[i].open
        item[i].close = stock[i].close
        item[i].volume = stock[i].volume
        item[i].save
      end
    end
  end
end
BuildStock.go!
