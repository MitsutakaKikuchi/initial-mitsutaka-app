class Arrive < ApplicationRecord


    
    default_scope -> { order(user_id: :asc) }
    validates :arrive_id, {presence: true, uniqueness: true}
    validates :pick_up, presence: true
end
