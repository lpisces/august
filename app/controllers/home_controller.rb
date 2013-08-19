class HomeController < ApplicationController
  def index
    @items = Item.limit(20).order('id desc')
    @sections = Section.all
    @tags = Tag.where('highlight = ?', true).order('sort desc').limit(20)
  end
end
