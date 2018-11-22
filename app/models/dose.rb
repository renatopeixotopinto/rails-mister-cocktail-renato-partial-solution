class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates_associated :cocktail, :ingredient
  validates_uniqueness_of :cocktail, scope: :ingredient
end

