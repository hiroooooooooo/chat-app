class UsersController < ApplicationController

  # ビューファイルを表示させるだけなので、アクションの定義のみ
  def edit
  end

  def update
    # deviseで使えるようになったヘルパーメソッド
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
