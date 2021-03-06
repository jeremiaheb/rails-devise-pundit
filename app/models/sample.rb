class Sample < ApplicationRecord

  belongs_to :trip, inverse_of: :samples

  has_many :drops, inverse_of: :sample, dependent: :destroy
  accepts_nested_attributes_for :drops, allow_destroy: true


  has_many :catches, dependent: :destroy
  accepts_nested_attributes_for :catches, allow_destroy: true
  has_many :animals, through: :catches

  
  validates :drops, length: { minimum: 1 }
  validates :catches, length: { minimum: 1 }

  validates :grid_number, :wind_speed, :wave_height, presence: true, numericality: { only_integer: true } 
  validates :current_speed, presence: true

end
