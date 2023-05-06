class AddBlogcolumnsToBloggers < ActiveRecord::Migration[6.1]
  def change
    add_column :bloggers, :bl_is_price_01, :decimal
    add_column :bloggers, :bl_is_price_02, :decimal
    add_column :bloggers, :bl_is_price_03, :decimal
    add_column :bloggers, :bl_is_price_04, :decimal
    add_column :bloggers, :bl_is_price_05, :decimal
    add_column :bloggers, :bl_was_price_01, :decimal
    add_column :bloggers, :bl_was_price_02, :decimal
    add_column :bloggers, :bl_was_price_03, :decimal
    add_column :bloggers, :bl_was_price_04, :decimal
    add_column :bloggers, :bl_was_price_05, :decimal
    add_column :bloggers, :bl_rating_01, :float
    add_column :bloggers, :bl_rating_02, :float
    add_column :bloggers, :bl_rating_03, :float
    add_column :bloggers, :bl_rating_04, :float
    add_column :bloggers, :bl_rating_05, :float
    add_column :bloggers, :bl_review_01, :float
    add_column :bloggers, :bl_review_02, :float
    add_column :bloggers, :bl_review_03, :float
    add_column :bloggers, :bl_review_04, :float
    add_column :bloggers, :bl_review_05, :float
    add_column :bloggers, :bl_rating_code_01, :integer
    add_column :bloggers, :bl_rating_code_02, :integer
    add_column :bloggers, :bl_rating_code_03, :integer
    add_column :bloggers, :bl_rating_code_04, :integer
    add_column :bloggers, :bl_rating_code_05, :integer
  end
end
