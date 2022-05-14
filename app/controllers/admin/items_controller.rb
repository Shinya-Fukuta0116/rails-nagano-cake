class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private

    def item_params
      params.require(:item).permit(:name, :image, :is_active, :price, :introduction, :genre_id)
    end
end
