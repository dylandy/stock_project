class IndexController < ApplicationController
  def index
    tmp = 0;tmp1 = 0
    item = ItemTable.all

    item.each do |i|
      if tmp == 0
        tmp = i.close / i.prev_close
        tmp1 = i
      elsif tmp < i.close / i.prev_close
        tmp = i.close / i.prev_close
        tmp1 = i
      end
    end

    @most_grow_name = tmp1.name.gsub!(/[^0-9A-Za-z.\- ]/, '')
    @most_grow_id = tmp1.item_id
    @most_grow_percent = (tmp*100).round.to_f / 100
    @most_grow_open = tmp1.open
    @most_grow_close = tmp1.close
  end
end
