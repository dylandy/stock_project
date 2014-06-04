class IndexController < ApplicationController

  def item
    @item = ItemTable.find(param[:item_id])
  end

  def index
    tmp = 0;tmp1 = 0;de = 0 ; de1 = 0
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

    item.each do |i|
      if de == 0
        de = i.close / i.prev_close
        de1 = i
      elsif de > i.close / i.prev_close
        de = i.close / i.prev_close
        de1 = i
      end
    end

    @most_grow_name = tmp1.name.gsub!(/[^0-9A-Za-z.\- ]/, '')
    @most_grow_id = tmp1.item_id
    @most_grow_percent = (tmp*100).round.to_f / 100
    @most_grow_open = tmp1.open
    @most_grow_close = tmp1.close

    @most_decrease_name = de1.name.gsub!(/[^0-9A-Za-z.\- ]/, '')
    @most_decrease_id = de1.item_id
    @most_decrease_percent = (de*100).round.to_f / 100
    @most_decrease_open = de1.open
    @most_decrease_close = de1.close

    @most_close_name = ItemTable.order("close desc").first.name.gsub!(/[^0-9A-Za-z.\- ]/, '')
    @most_close_id = ItemTable.order("close desc").first.item_id
    @most_close_open = ItemTable.order("close desc").first.open
    @most_close_close = ItemTable.order("close desc").first.close

    @most_volume_name = ItemTable.order("volume desc").first.name.gsub!(/[^0-9A-Za-z.\- ]/, '')
    @most_volume_id = ItemTable.order("volume desc").first.item_id
    @most_volume_v = ItemTable.order("volume desc").first.volume
    @most_volume_open = ItemTable.order("volume desc").first.open
    @most_volume_close = ItemTable.order("volume desc").first.close
  end

  def search
    if param[:s]

    end
  end
end
