class RepliesController < ApplicationController
  def edit
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  def update
    @post = Post.find(params[:id])
    @reply = Reply.new(reply_params)
    if @reply
      @reply.post_id = @post.id
      @reply.user_digest = current_user.digest
      if @reply.save
        redirect_to end_reply_path
      else
        flash.now[:notice] = '空欄、または140文字以上のコメントは投稿できないよ'
        render 'edit'
      end
    else
      flash.now[:notice] = '空欄、または140文字以上のコメントは投稿できないよ'
      render 'edit'
    end
  end

  def end
    @post = Post.find(params[:id])
  end

  def destroy
    Reply.find(params[:id]).destroy
    redirect_to request.referrer
  end

  def myreplies
    @myreplies = Reply.where(user_digest: current_user.digest)
                .order(created_at: :desc)
                .paginate(page: params[:page],per_page: 10)
  end

  private

    def reply_params
      params.require(:reply).permit(:content)
    end
end
