stock_project
=============

A database practicing project


---
在修改程式之前，請先注意以下幾點

1. 修改 config/database.yml 的 mysql 帳號密碼成為你機器上的帳號密碼
2. 在 stock_rails 資料夾裡下 bundle install 指令，把需要的 gem 安裝好，如果有缺什麼 gem 的話，要先裝好
3. 建立資料庫：在 stock_rails 資料夾的根目錄下 rake db:create 指令
4. 建立 table ，在 stock_rails 資料夾的根目錄下 rake db:migrate 指令
5. 到 stock_rails/script 資料夾下執行 ruby build_stock.rb 的指令，建立所需的資料庫內容

##請特別注意 issue tracker 中的訊息
