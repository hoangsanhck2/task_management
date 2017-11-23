class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validate :task_params

  STATUS = { "to_do": 0, "doing": 1, "done": 2}

end
