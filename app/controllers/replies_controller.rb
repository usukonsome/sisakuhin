class RepliesController < ApplicationController
  def edit
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  def update
    @reply = Reply.new(reply_params)
    if @reply
      @reply.post_id = (params[:post_id])
      @reply.user_digest = current_user.digest
      @reply.save
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Reply.find(params[:id]).destroy
    redirect_to root_path
  end

  def myreplies
    @replies = Reply.where(user_digest: current_user.digest)
  end

  private

    def reply_params
      params.require(:reply).permit(:content)
    end
end
