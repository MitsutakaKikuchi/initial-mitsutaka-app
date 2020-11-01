class Arrive < ApplicationRecord
    has_many :users, through: :users2s, foreign_key: 'arrive_id'


    
    default_scope -> { order(user_id: :asc) }
    validates :arrive_id, {presence: true, uniqueness: true}
    validates :pick_up, presence: true
end
