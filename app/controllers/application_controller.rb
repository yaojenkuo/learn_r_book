class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :chapters

  def chapters(post)
      post.content.split("\n").select {|x| x =~ /^###\s(.*)/ }
  end
end
