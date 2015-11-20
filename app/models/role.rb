class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
            
  #might need to enforce in the database layer as well            
  validates_uniqueness_of :name, case_sensitive: false, scope: [:resource_type, :resource_id]

  scopify
  
end
