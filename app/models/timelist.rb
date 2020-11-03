class Timelist < ApplicationRecord
    scope :order_title, -> { order('time COLLATE "C" ASC') }
end
