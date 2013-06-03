class Todo < ActiveRecord::Base
  attr_accessible :description, :finished, :list_id

  belongs_to :list

end
