class House < ApplicationRecord
  belongs_to :category
  belongs_to :user, class_name:"Owner"
end
