require "test_helper"

describe ReviewsController do

  describe "index" do

    it "is successful when there are many reviews" do
      Review.count.must_be :>, 0
      get reviews_path
      must_respond_with :success
    end

    it "is successful when there are zero reviews" do
      Review.destroy_all
      get reviews_path
      must_respond_with :success
    end

  end

  describe "new" do

    it "runs successfully" do
      get new_review_path
      must_respond_with :success
    end

  end

  describe "create" do

    it "creates a new review" do
      start_count = Review.count

      review_data = {
        review: {
          rating: 1,
          product_id: 1
        }
      }

      post reviews_path, params: review_data
      must_redirect_to reviews_path

      end_count = Review.count
      end_count.must_equal start_count + 1

      review = Review.last
      review.rating.must_equal review_data[:review] [:rating]
    end

    it "responds with bad_request for icky data" do
      start_count = Review.count

      review_data = {
        review: {
          blah: -6
        }
      }

      post reviews_path, params: review_data
      must_respond_with :bad_request

      end_count = Review.count
      end_count.must_equal start_count
    end
  end

  describe "show" do

    it "finds a review that exists" do
      review_id = reviews(:one).id
      get review_path(review_id)
      must_respond_with :success
    end

    it "returns 404 for a classroom that does not exist" do
      review_id = Review.last.id + 1
      get review_path(review_id)
      must_respond_with :not_found
    end
  end

  describe "edit" do

    it "finds a review that exists" do
      review_id = reviews(:two)
      get edit_review_path(review_id)
      must_respond_with :success
    end

    it "returns 404 for a review that does not exist" do
      review_id = Review.last.id + 1
      get edit_review_path(review_id)
      must_respond_with :not_found
    end
  end

  describe "update" do

    it "updates the review" do
      review = reviews(:one)
      review_data = {
        review: {
          name: "sahana"
        }
      }

      patch review_path(review), params: review_data
      must_redirect_to review_path(review)
      review.reload

      review.name.must_equal review_data[:review][:name]
    end

    it "responds with bad_request for icky data" do
      review = reviews(:one)
      review_data = {
        review: {
          rating: 0
        }
      }

      patch review_path(review), params: review_data
      must_respond_with :bad_request

      review.rating.must_equal review.rating
    end

    it "returns 404 for a review that does not exist" do
      review_data = {
        review: {
          name: "sahana"
        }
      }

      review_id = Review.last.id + 1
      patch review_path(review_id), params: review_data
      must_respond_with :not_found
    end

  end

  describe "destroy" do
    it "destroys a review that exists" do
      start_count = Review.count

      review = reviews(:one)
      delete review_path(review)
      must_redirect_to reviews_path

      end_count = Review.count
      end_count.must_equal start_count - 1
    end

    it "returns 404 for a review that DNE" do
      start_count = Review.count

      review_id = Review.last.id + 1
      delete review_path(review_id)
      must_respond_with :not_found

      end_count = Review.count
      end_count.must_equal start_count
    end 
  end
end
