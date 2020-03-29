
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :users do
  link "マイページ", users_path
end

# 出品した商品の出品中
crumb :exhibiting do
  link "出品した商品 - 出品中", exhibiting_products_path
  parent :users
end

# 出品した商品の取引中
crumb :trading do
  link "出品した商品 - 取引中", trading_products_path
  parent :users
end

# 出品した商品の売却済
crumb :sold do
  link "出品した商品 - 売却済み", sold_products_path
  parent :users
end

# 購入した商品の取引中
crumb :purchase do
  link " 購入した商品 - 取引中", purchase_products_path
  parent :users
end

# 購入した商品の過去の取引
crumb :purchased do
  link " 購入した商品 - 過去の取引", purchased_products_path
  parent :users
end

# プロフィール
crumb :profile do
  link "プロフィール", edit_user_path
  parent :users
end

# 住所の変更
crumb :chenge_address do
  link "発送元・お届け先住所変更", change_address_users_path
  parent :users
end

# 支払い方法
crumb :card do
  link "支払い方法", card_users_path
  parent :users
end

# パスワードの変更
crumb :chenge_password do
  link "メール/パスワード", change_password_users_path
  parent :users
end

# 本人情報の登録
crumb :identification do
  link "本人情報の登録", identification_users_path
  parent :users
end

# 電話番号変更
crumb :check_cellphone do
  link "電話番号の確認", check_cellphone_users_path
  parent :users
end

# ログアウト
crumb :logout do
  link "ログアウト", logout_users_path
  parent :users
end

# カテゴリー一覧
crumb :categories do
  link "カテゴリー一覧", categories_path
end

# 各カテゴリー表記 
crumb :category do |category|
  category = Category.find(params[:id])
  link category.name
  parent :categories
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).