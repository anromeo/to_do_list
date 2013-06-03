class List < ActiveRecord::Base
  attr_accessible :title

  has_many :todos
end
