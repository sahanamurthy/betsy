class Merchant < ApplicationRecord
  has_many :products
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.from_github(auth_hash)
    merchant = Merchant.new
    merchant.username = auth_hash["info"]["nickname"]
    merchant.name = auth_hash["info"]["name"]
    merchant.email = auth_hash["info"]["email"]
    merchant.oauth_uid = auth_hash["uid"]
    merchant.oauth_provider = "github"
    return merchant
  end
end
