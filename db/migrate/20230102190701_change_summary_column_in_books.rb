class ChangeSummaryColumnInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :summary, :text
  end
end
