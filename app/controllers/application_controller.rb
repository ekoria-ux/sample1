class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:term]

  def after_sign_in_path_for(resource)
    mypage_path
  end
end
