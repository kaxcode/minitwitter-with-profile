class Tweet < ApplicationRecord
  has_many :hearts
  validates :text, length: { maximum: 140 }, presence: true
  belongs_to :user

  def not_hearted_already?(user)
    hearts.where(user: user).count == 0
  end
end
