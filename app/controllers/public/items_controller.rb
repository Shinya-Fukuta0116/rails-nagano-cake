class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
      @genre = Genre.find(params[:genre_id])
    else
    @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
    #新しいアイテムを入れる
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :is_active, :price, :introduction, :genre_id)
  end

end
