class FaqsController < ApplicationController

  def new
    @faq = Faq.new
  end

  def index
    redirect_to new_faq_path
    #renderした後ブラウザ更新するとno routes matchなので付け加えました
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      SendingMailMailer.contact.deliver_now
      redirect_to faqs_thanks_path
    else
      flash.now[:notice] = "用件を入れてね"
      render 'new'
    end
  end

  private

    def faq_params
      params.require(:faq).permit(:content)
    end
end

#ひんと：うまくクリエイト出来ない場合
#1.createに!付けて例外発生させて理由を見る
#2.params.requireをプライベートに置く(世間ではStrongParameterといいます)
