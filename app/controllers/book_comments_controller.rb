class BookCommentsController < ApplicationController
  def create
  	@book_show = Book.find(params[:book_id])
  	@book_comment = current_user.book_comments.build(book_comment_params)
  	@book_comment.book_id = @book_show.id
    @book_comment.save
  end

  def destroy
    @book_show = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
  end

  private
  def book_comment_params
  	params.require(:book_comment).permit(:comment)
  end
end
