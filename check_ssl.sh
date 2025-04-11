#!/bin/bash

# 從 url_list.txt 一行一行讀取 URL
while IFS= read -r line; do
  # 移除 URL 的 http:// 或 https:// 部分
  newline="${line#http*://}"

  echo "[ $newline ]"

  # 嘗試連接到指定的端口，檢查是否成功
  if curl -m 3 -I "https://$newline" &>/dev/null; then
    # 如果連接成功，使用 openssl 檢查 SSL 證書的有效期
    echo | openssl s_client -servername "$newline" -connect "$newline:443" 2>/dev/null | openssl x509 -noout -dates
  else
    # 如果連接失敗，輸出錯誤信息
    echo "connection failed"
  fi

  echo
done < ./url_list.txt
