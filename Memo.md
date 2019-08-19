# やったこと・やることメモ

### Taskモデルの追加
rails g scaffold Task name content:text image deadline:datetime assigned_user_id:integer user:references

### 画像添付機能
コマンド
rails active_storage:install
rails db:migrate

taskモデルに下記を追加
has_one_attached :image

### 次やること
- ログインしているcurrent_userがタスクを登録できるのでタスクにUser入力欄は不要
- ビューにおいては登録時に　assigned_user_idではなくassigned_userのnameが選択できるようにしたい

- 