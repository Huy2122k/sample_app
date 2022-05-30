class ApplicationController < ActionController::Base
    def hello
      return render html: 'hello'
    end
end
