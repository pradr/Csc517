class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @comment = Comment.new
    end
     Micropost.find(:all).each { |x| x.weight = 1000 + x.votes.count * 100; x.weight -=((Time.now.to_i - x.created_at.to_i)/60) ; x.save}

     if (params[:word]) 
             @search_key = "%" + params[:word] + "%"
     else
             @search_key = "%%"
     end

     @feed_items = Micropost.where("content LIKE ?", @search_key).paginate(:page => params[:page])
  end
end
