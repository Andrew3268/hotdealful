class CreatePicksTags < ActiveRecord::Migration[6.1]
  def change
    create_table :picks_tags, :id => false do |t|
      t.references :pick, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
