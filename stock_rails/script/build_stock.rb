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

  end
end
BuildStock.go!
