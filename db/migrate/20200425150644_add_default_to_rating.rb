class AddDefaultToRating < ActiveRecord::Migration[6.0]
  def change
    change_column_default :restaurants, :rating, 5
  end
end
