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
      @reply.save
      redirect_to end_reply_path
    else
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
    @replies = Reply.where(user_digest: current_user.digest)
  end

  private

    def reply_params
      params.require(:reply).permit(:content)
    end
end
