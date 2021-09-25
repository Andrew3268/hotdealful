class CreateCouponsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons_tags, :id => false do |t|
      t.references :coupon, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
