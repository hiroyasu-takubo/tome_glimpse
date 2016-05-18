# coding: utf-8
class TagSearchController < ApplicationController
  def new
  end

  def index
    tag = Tag.find_by(id: params[:tag_search][:tag_ids])
    
    if tag.books.exists?
      flash[:danger] = 'タグに関連する本がありません。'
      render 'new'
    else
      @books = tag.books
      render 'index'
    end
    # render text: params
  end
end