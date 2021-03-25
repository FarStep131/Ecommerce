class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: {greater_than_or_equal_to: 0}
    validates :genre
    validates :sales_status
  end

  enum genre: {
    スフレ: 0,
    ベイクド: 1,
    ニューヨーク: 2,
    レア: 3
  }

  enum sales_status: {
    準備中: 0,
    販売可: 1,
    在庫切れ: 2,
    販売終了: 3
  }

end
