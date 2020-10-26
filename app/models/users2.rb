class Users2 < ApplicationRecord
    def to_param
        arrive_id.to_s
    end
    belongs_to :holder, class_name: 'User', foreign_key: 'user_id'
    validates :name, presence: true
    validates :kana, presence: true
    validates :grade, presence: true
    validates :arrive_id, {presence: true, uniqueness: true}
end
