自己的股票自已選
=============
想要有自己私人的股票查詢系統嗎？

##System Require

* Ruby - 2.1.1
* Rails - 4.1
* MySQL >=  5.5
* Unix-like system
* NetWork

##Deploy Infomation

* 修改 stock_project/stock_rails/config/database.yml 以連結到資料庫
* 在 stock_project/stock_rails/config/initialize/ 加入 secret tocken ( rake secret) 
* 安裝所需的 gem ( bundle install )
* 建立資料庫 ( rake db:create && rake db:migrate )
* 抓取即時股價並存入資料庫 ( 執行 stock_project/stock_rails/script/build_stock.rb )
* 使用系統 crontab 將 stock_project/stock_rails/script/build_stock.rb 設定為上班日早上九點到下午一點，整點更新
* 若要測試系統，請使用 rails server 開啟伺服器
* 若要將系統正式上線請使用 gem install passenger 利用 nginx 來將系統上線

##資料來源
* Yahoo Finance API 雅虎財經 API

##所用外部 Lib
* Twitter Bootstrap 3.0
* jQuery 1.8.2
* Devise

##測試
本專案在以下平台測試成功

* Ubuntu Linux 13.04 Server x64
* Ubuntu Linux 14.04 Desktop x64
* Mac OSX 10.09 

##License

本專案透過 MIT Open Source License 釋出
如需使用本專案，請在專案中提出有使用本專案。
