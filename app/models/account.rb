class Account < ActiveRecord::Base
  has_many :employee, :dependent => :destroy

  validates_presence_of :name,
                        :message => "must not be empty"
  validates_length_of :name,
                      :maximum => 255
  validates_uniqueness_of :name,
                          :case_sensitive => false,
                          :message => "already exists"

  validates_presence_of :bank_name,
                        :message => "must not be empty"
  validates_length_of :bank_name,
                      :maximum => 255

  def count_employees
    employee.count
  end

end
