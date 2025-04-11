# check_ssl
SSL憑證檢查

用於 Macbook，可直接於 terminal 運作，查詢 SAAS 客戶的 SSL 憑證是否到期

$ nano check_ssl.sh

$ nano url_list.txt
> 將客戶的 url 直接貼在 txt 清單中，最後須換行

$ chmod 764 check_ssl.sh

$ cd ~/Documents/check_ssl && ./check_ssl.sh
