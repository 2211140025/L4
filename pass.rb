require 'bcrypt'
#ユーザーの登録アクション
signup_password = BCrypt::Password.create("orange")
puts signup_password

#ユーザーのログインアクション
login_password = BCrypt::Password.new(signup_password)
if login_password == "my password" #←login_password.==(“my password”)
 p "ログイン成功"
end