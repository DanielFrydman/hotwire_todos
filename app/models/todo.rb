# app/models/todo.rb
class Todo < ApplicationRecord
  validates :title, presence: true
  validates :user_name, presence: true

  scope :pending, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  # This is the entire real-time implementation
  after_create_commit { broadcast_prepend_to "todos", partial: "todos/todo", locals: { todo: self } }
  after_update_commit { broadcast_replace_to "todos", partial: "todos/todo", locals: { todo: self } }
  after_destroy_commit { broadcast_remove_to "todos" }
end
