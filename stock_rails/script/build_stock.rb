require 'yahoo_finance'

start_from = 1101
end_at = 9962

target=[]

#create array for request 
(start_from .. end_at).each do |t|
  target << t.to_s+".TW"
end

