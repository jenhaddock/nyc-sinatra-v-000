class ChangeLandmarks < ActiveRecord::Migration
  def change
    rename_column :landmarks, :year, :year_completed
  end
end
