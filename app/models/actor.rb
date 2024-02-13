class Actor < ApplicationRecord
    has_many :locations
    has_many :movies, through: :locations
end
