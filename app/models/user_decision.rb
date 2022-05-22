# frozen_string_literal: true

class UserDecision < ApplicationRecord
  validates :age, presence: true
  validates :gender, presence: true
  validates :educational_level, presence: true
  validates :martial_status, presence: true
  validates :professional_area, presence: true
  validates :family_size, numericality: { only_integer: true, greater_or_equal_to: 0 }, presence: true
end
