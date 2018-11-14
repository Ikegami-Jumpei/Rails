class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] ="登録に失敗しました"
      render :new
    end
  end

 private
 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end

 #beforeアクション

 #ログイン済みユーザーかどうか確認
 def logged_in_user
   unless logged_in?
     flash[:danger] = "ログインしてください。"
     redirect_to login_url
   end
 end
  
end
