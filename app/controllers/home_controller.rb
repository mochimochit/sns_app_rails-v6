class HomeController < ApplicationController
  before_action :authenticate_devise_user!, except: [:top]
  def top
  end

  def prof
  end

  def login
  end

  def post
  end

  def postlist
  end
end
