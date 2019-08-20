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
```class TasksController < ApplicationController
...
def create
    @task = current_user.posts.new params.require(:post).permit(:content, :image)
    ...（省略）
end

def update
    respond_to do |format|
      if @task.update params.require(:post).permit(:content, :image)
    ...
end
```

<%= form.select :user_id, Category.pluck(:name, :id), {include_blank: '選択ボックス'}, {class: 'sample'} %>


### 次やること
- ログインしているcurrent_userがタスクを登録できるのでタスク登録時にUser入力欄は不要、show画面には登録したuser.nameは必要
- 登録時にassigned_user_idではなくassigned_userのnameが選択できるようにしたい
- 自分が登録したtaskとassignされたtaskは見られる、それ以外は？？

