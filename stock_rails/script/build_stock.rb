require 'yahoo_finance'

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

(0..4500).each do |t|
  if data_1[t].ask != 0
  stock << data_1[t]
  end
end

(0..4360).each do |t|
  if data_2[t].ask != 0
  stock << data_2[t]
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

(0..4500).each do |t|
  if data_1[t].ask != 0
  stock << data_1[t]
  end
end

(0..4360).each do |t|
  if data_2[t].ask != 0
  stock << data_2[t]
  end
end
