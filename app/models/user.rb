class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  belongs_to :organisation
  has_many :notification_subscriptions
  has_many :notifications, as: :recipient
  validates :organisation, presence: true
end
