class ItemsController < ApplicationController
  before_action :set_character

  def new
    @item = @character.items.build
  end

  def show
    @item = Item.find_by(id: params[:id])
    return unless @item.nil?

    redirect_to root_path, alert: 'Item not found'
  end

  def create
    @item = @character.items.build(item_params)

    if @item.save
      redirect_to items_character_path(@character), notice: 'Item was successfully created.'

    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to character_item_path(@character, @item), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to character_path(params[:character_id])
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
