class Arrive < ApplicationRecord
    has_many :users, through: :users2s 
    # default_scope -> { order(user_id: :asc) }

    scope :recent, -> { order(time: :asc) }

    validates :arrive_id, {presence: true, uniqueness: true}
    validates :pick_up, presence: true
end
