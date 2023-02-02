class UsersController < ApplicationController
  before_action :authenticate_devise_user!

  def index
    @users = DeviseUser.all
  end

  def show
    @user = DeviseUser.find_by(id: params[:id])
    @posts = Post.where(user_id:params[:id]).order(created_at: :desc)
  end

  def new
    @user = User.new

  end

  def create
    # @user = User.create(user_id:current_devise_user.id)
    @user = User.create({name:params[:name],email:params[:email],avatar:params[:avatar]})
    render action: :new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login")
    end
  end



end
