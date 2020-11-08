class Site < ApplicationRecord
  belongs_to :organisation
  has_many :channels
end
