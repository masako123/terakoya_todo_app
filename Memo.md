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

### 


### 次やること
- ログインしているcurrent_userがタスクを登録できるのでタスク登録時にUser入力欄は不要、show画面には登録したuser.nameは必要
- 登録時にassigned_user_idではなくassigned_userのnameが選択できるようにしたい
- 自分が登録したtaskとassignされたtaskは見られる、それ以外は？？

