class StaticPageController < ApplicationController
  def home
    if user_signed_in?
      @micropost = current_user.microposts.build
    end
    @q = Micropost.ransack(params[:q])
    @feed_items = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
