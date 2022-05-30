class StaticPageController < ApplicationController
  def home
  end

  def help
  end

  def about
    return render html: 'about'
  end
end
