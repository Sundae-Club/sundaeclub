class Channel < ApplicationRecord
  belongs_to :site
  has_many :videos

  validates :site, presence: true
end
