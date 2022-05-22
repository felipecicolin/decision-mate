class ChangeUserDecisionAgeField < ActiveRecord::Migration[7.0]
  def change
    change_column(:user_decisions, :age, :string)
  end
end
