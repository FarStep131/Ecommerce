class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  enum production_status: {
    製作中: 0,
    製作完了: 1
  }
end
