# やったこと・やることメモ

### Taskモデルの追加
rails g scaffold Task name content:text image deadline:datetime assigned_user_id:integer user:references

### 画像添付機能
コマンド
rails active_storage:install
rails db:migrate

taskモデルに下記を追加
has_one_attached :image

controllerとviewの変更

### Taskにstatusを追加する
Taskモデルにstatusカラムを追加するマイグレーションを作成
rails g migration add_status_to_task status:integer
rails db:migrate

## Taskの完了・未完了を表示させる

