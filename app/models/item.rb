class Item < ApplicationRecord
  has_one_attached :item_image
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  ## 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end
end
