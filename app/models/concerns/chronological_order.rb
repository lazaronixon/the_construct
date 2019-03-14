module ChronologicalOrder
  extend ActiveSupport::Concern

  included do
    scope :chronologically, -> { order :created_at, :id }
    scope :reverse_chronologically, -> { order created_at: :desc, id: :desc }
  end
end
