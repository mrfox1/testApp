class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_author(user) #передаем юзера, а не поле, которому принадлежит запись и сравниваем с поточным
    user == current_user
  end

  helper_method :current_user, :user_author #хелпер позволяет вызывать метод в других контр. и вьюхах
end
