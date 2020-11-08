class Organisation < ApplicationRecord
  has_many :channels
  has_many :users
end
