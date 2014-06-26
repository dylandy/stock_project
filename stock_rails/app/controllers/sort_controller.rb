class SortController < ApplicationController
	def index
		@sort=ItemTable.order('item_id DESC')
	end
	def SortByOpen
		@sort=ItemTable.order('open DESC')
	end
	def SortByClose
		@sort=ItemTable.order('close DESC')
	end
	def SortByVolume
		@sort=ItemTable.order('volume DESC')
	end
	def SortByUp
	end
	def SortByDown
	end
end
