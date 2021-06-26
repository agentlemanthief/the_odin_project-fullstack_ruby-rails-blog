class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'nicholas', password: 'oldlongjohnson', only: :destroy

  def create
    @article = Article.find(params[:article_id])
    # @comment = @article.comments.create(comment_params)
    @comment = @article.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Thank you for your comment!'
    else
      flash[:notice] = 'Your comment could not be saved!'
    end
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
