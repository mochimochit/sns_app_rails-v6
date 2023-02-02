class PostsController < ApplicationController
  before_action :authenticate_devise_user!

  def posts
    @posts = Post.new
  end

  def postslist
    @posts = Post.where(user_id:current_devise_user.id).order(created_at: :desc)
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id:params[:id])
  end

  def create
    @post = Post.new(content:params[:content],user_id:current_devise_user.id)
    if @post.save
      redirect_to("/posts/postslist")
    else
      render("posts/post")
    end
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to('/posts/postslist')
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to('/posts/postslist')
  end
end
