class Task < ApplicationRecord
  validates_presence_of :task, :details, :due_date

  scope :completed, -> { where(:completed => true)}

  scope :todo, -> { where(:completed => false)}
  
end


