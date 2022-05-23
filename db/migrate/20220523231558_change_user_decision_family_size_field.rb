class ChangeUserDecisionFamilySizeField < ActiveRecord::Migration[7.0]
  def change
    change_column(:user_decisions, :family_size, :string)
  end
end
