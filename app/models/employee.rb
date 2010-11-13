class Employee < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :first_name,
                        :message => "must not be empty"
  validates_length_of :first_name,
                      :maximum => 255

  validates_presence_of :last_name,
                        :message => "must not be empty"
  validates_length_of :last_name,
                      :maximum => 255

  validates_presence_of :salary,
                        :message => "must not be empty"
  validates_numericality_of :salary,
                            :only_integer => true                            

  validates_presence_of :account_id,
                        :message => "didn't get associated"

end
