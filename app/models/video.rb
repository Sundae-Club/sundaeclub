class Video < ApplicationRecord
  has_paper_trail

  belongs_to :channel
end
