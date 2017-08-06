class ThingToDo < ApplicationRecord
  serialize  :attending
  belongs_to :user
end
