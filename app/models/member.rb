class Member < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :user_id, :presence => true 
  validates :group_id, :presence => true	
  
  # avoid in memory duplicates. also need to add unique index to db
  validates :user_id, :uniqueness => {:scope => [:user_id, :group_id]}

end