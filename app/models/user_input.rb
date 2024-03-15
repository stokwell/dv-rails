class UserInput < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, allow_blank: false
  default_scope { order(created_at: :desc) }
  scope :today, -> { where("created_at >= ?", Time.now.beginning_of_day) }
  scope :yesterday, -> { where(created_at: Time.now.yesterday.beginning_of_day..Time.now.yesterday.end_of_day) }
end
