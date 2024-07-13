#!/bin/bash
# nocasematchの有効化
shopt -s nocasematch
#起動時
echo "パスワードマネージャーへようこそ！"
while true; do
 echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
#選択肢による処理分岐
 read choices
# Add Password が入力された場合
 case $choices in
  "add Password")
#サービス名登録 
  while true; do
   echo "サービス名を入力してください："
   read service_name
    if [ -n "$service_name" ]; then
     break
    else
     echo "エラー：サービス名は必須です。再入力してください。"
    fi
  done
#ユーザー名登録
  while true; do
   echo "ユーザー名を入力してください："
   read user_name
    if [ -n "$user_name" ]; then
     break
    else
     echo "エラー：ユーザー名は必須です。再入力してください。"
    fi
  done
#パスワード登録
  while true; do
   echo "パスワードを入力してください："
   read   -s password
    if [ -n "$password" ]; then
     break
    else
    echo "エラー：パスワードは必須です。再入力してください。"
   fi
  done
#ファイルの暗号化

#入力されたパスワードの一時保存

#パスワードの暗号化

#平文の一時ファイルを削除

#入力完了
   echo "$service_name:$user_name:$password" >> password_store.txt
   echo "パスワードの追加は成功しました。"
   ;;
# Get Password が入力された場合
  "get Password")
  echo "サービス名を入力してください："
  read service_name
  password=$(grep "^$service_name:" password_store.txt | cut -d: -f3)
   if [ -z "$password" ]; then
## サービス名が保存されていなかった場合
    echo "そのサービスは登録されていません。"
## サービス名が保存されていた場合
   else
    user_name=$(grep "^$service_name:" password_store.txt | cut -d: -f2)
    echo "サービス名：$service_name"
    echo "ユーザー名：$user_name"
    echo "パスワード：$password"
   fi
   ;;
# Exit が入力された場合
  "exit")
   echo "Thank you!"
   break
   ;;
## プログラムが終了
# Add Password/Get Password/Exit 以外が入力された場合
   *)
   echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
   ;;
 esac
done
#nocasematchの無効化
shopt -u nocasematch