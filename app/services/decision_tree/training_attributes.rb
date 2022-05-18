# frozen_string_literal: true

module DecisionTree
  class TrainingAttributes < ApplicationService
    def initialize
      super()
      @attributes = ["Gender", "Age", "Educational Level", "Marital Status", "Professional Area", "Family Size"]
    end

    def call
      training = [
        ["36-55", "Masters", "High", "Single", 1],
        ["18-35", "High School", "Low", "Single", 0],
        ["< 18", "High School", "Low", "Married", 1]
      ]
    end
  end
end
