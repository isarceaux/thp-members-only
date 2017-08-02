class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:mysterious_page]

  def home
  end

  def mysterious_page
  end

  private

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end

end
