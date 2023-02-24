class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

# before_action :set_restaurant, only: %i[new create]

# def create
#   @review = Review.new(review_params)
#   @review.restaurant = @restaurant
#   @review.save

#   if @review.save
#     redirect_to restaurant_path(@restaurant)
#   else
#     render :new, status: :unprocessable_entity
#   end
# end

# private

# def set_restaurant
#   @restaurant = Restaurant.find(params[:restaurant_id])
# end

# def review_params
#   params.require(:review).permit(:rating, :content)
# end
