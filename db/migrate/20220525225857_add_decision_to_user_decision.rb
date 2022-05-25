class AddDecisionToUserDecision < ActiveRecord::Migration[7.0]
  def change
    add_column :user_decisions, :decision, :string
  end
end
