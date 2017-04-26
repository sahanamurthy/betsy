class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to product_reviews_path
    else
      render :new, status: :bad_request
      flash[:review_not_saved] = "Unable to save review"
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
    if @review.nil?
      head :not_found
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    if @review.nil?
      head :not_found
    end
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review.nil?
      head :not_found
    else
      @review.update_attributes(review_params)
      if @review.save
        redirect_to product_review_path(@review)
        flash[:messages] = "Review # #{@review.id} has been updated"
      else
        render :edit, status: :bad_request
      end
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review.nil?
      head :not_found
    else
      @review.destroy
      redirect_to product_reviews_path
    end
  end

  private
  def review_params
    return params.require(:review).permit(:name, :rating, :comment, :product_id)
  end
end
