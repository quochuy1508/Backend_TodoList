class Todo < ApplicationRecord
  validates_presence_of :title, :created_by
end
