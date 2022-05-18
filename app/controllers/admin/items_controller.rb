class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # byebug

    if @item.save
      redirect_to admin_item_path(@item)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

    def item_params
      params.require(:item).permit(:name, :image, :is_active, :price, :introduction, :genre_id)
    end
end
