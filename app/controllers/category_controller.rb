class CategoryController < ApplicationController
  def index
    @section = Section.find(params[:id])
    @items = Item.where(:id => @section.node_ids).order('id desc').limit(20)
    @tags = []
  end
end
