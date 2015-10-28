class Exercise < ActiveRecord::Base
  belongs_to :user
  validates :duration_in_min, presence: true, numericality: {only_integer: true}
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true
end
