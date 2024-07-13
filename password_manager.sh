#!/bin/bash
#起動時
echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
#選択肢による処理分岐
read choices
# Add Password が入力された場合
case $choices in
 "Add Password")
#サービス名登録 
 echo "サービス名を入力してください："
 read service_name
#ユーザー名登録
 echo "ユーザー名を入力してください："
 read user_name
#パスワード登録
 echo "パスワードを入力してください："
 read password
#入力完了
 echo "$service_name:$user_name:$password" >> password-store.txt
 echo "パスワードの追加は成功しました。"
 echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
 ;;
# Get Password が入力された場合
 "Get Password")
 echo "サービス名を入力してください："
## サービス名が保存されていなかった場合
 echo "そのサービスは登録されていません。"
## サービス名が保存されていた場合 
 echo "サービス名："
 echo "ユーザー名："
 echo "パスワード："
 echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
 ;;
# Exit が入力された場合
 "Exit")
  echo "Thank you!"
  ;;
## プログラムが終了

# Add Password/Get Password/Exit 以外が入力された場合
 *)
 echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
 ;;
esac