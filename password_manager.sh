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
  "add password")
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
while true; do   
    echo "入力したデータの暗号化を行います。GPGキーで設定したメールアドレスを入力してください"
    read gpg_email
    if [ -n "$gpg_email" ]; then
     break
    else
     echo "エラー。正しいメールアドレスを設定してください" 
    fi 
   done 
#入力されたパスワードの一時保存
   gpg -d password_store.gpg > password_store.txt 2> /dev/null
   echo "$service_name:$user_name:$password" >> password_store.txt
#パスワードの暗号化
   if gpg -r "$gpg_email" -e -o password_store.gpg password_store.txt; then
#暗号化成功時
    rm password_store.txt
    echo "パスワードの追加は成功しました。" 
   else
#暗号化失敗時
    echo "エラー：パスワードの追加に失敗しました。正しいGPGキーを設定してください。"
   fi
   ;;
# Get Password が入力された場合
  "get password")
  echo "サービス名を入力してください："
  read service_name
#暗号化ファイルの複合化
  gpg -d password_store.gpg > password_store.txt 2> /dev/null  
#パスワードの取得  
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
   #複合化された一時ファイルの削除
    rm password_store.txt
   ;;
# Exit が入力された場合
  "exit")
   echo "Thank you!"
   break
   ;;
# Add Password/Get Password/Exit 以外が入力された場合
   *)
   echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
   ;;
 esac
done
#nocasematchの無効化
shopt -u nocasematch