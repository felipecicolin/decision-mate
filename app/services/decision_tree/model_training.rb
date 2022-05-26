# frozen_string_literal: true

module DecisionTree
  class ModelTraining < ApplicationService
    def initialize(customer_attributes)
      super()

      @training = [
        ["Male", "Baby", "Basic", "Single", "Other", "3", "Sports and Adventure"],
        ["Female", "Kid", "Medium", "Married", "Communications", "2", "Beauty"],
        ["Male", "Teen", "Advanced", "Other", "Science and technology", "3", "Games"],
        ["Other", "Young Adult", "Very Advanced", "Married", "Arts, culture an entertainment", "2", "Technology"],
        ["Female", "Adult", "Advanced", "Engaged", "Architecture and engineering", "3", "Home Appliances"],
        ["Male", "Elder", "Median", "Married", "Business, management and administration", "3", "Clothes"],
        ["Male", "Adult", "Advanced", "Divorced", "Community and social services", "1", "Pets"],
        ["Other", "Adult", "Median", "Engaged", "Education", "3", "Auto Parts"],
        ["Female", "Kid", "Very Advanced", "Married", "Science and technology", "3", "Books"],
        ["Other", "Baby", "Basic", "Divorced", "Science and technology", "4", "Babies"],
      ]

      @attributes = ["Gender", "Age", "Educational Level", "Marital Status", "Professional Area", "Family Size"]

      @customer_attributes = customer_attributes
    end

    def call
      tree = DecisionTree::ID3Tree.new(@attributes, @training, 1, :discrete)
      tree.train
      prediction = tree.predict(@customer_attributes)
    end
  end
end
