#!/bin/bash
#起動時
echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

# Add Password が入力された場合
echo "サービス名を入力してください："
echo "ユーザー名を入力してください："
echo "パスワードを入力してください："

echo "パスワードの追加は成功しました。"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

# Get Password が入力された場合
echo "サービス名を入力してください："
## サービス名が保存されていなかった場合
echo "そのサービスは登録されていません。"
## サービス名が保存されていた場合
echo "サービス名："
echo "ユーザー名："
echo "パスワード："
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

# Exit が入力された場合
echo "Thank you!"
## プログラムが終了

# Add Password/Get Password/Exit 以外が入力された場合
echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"