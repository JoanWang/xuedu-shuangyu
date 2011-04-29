class Classroom < ActiveRecord::Base
  belongs_to :school
  delegate :school_name, :school_code, :to => :school

  #关联课程
  has_many :subjects

  validates_presence_of :name, :code

  named_scope :active, :conditions => { :is_deleted => false}
  named_scope :deleted, :conditions => { :is_deleted => true }

  def full_name
    "#{school_code} - #{school_name}  #{name}"
  end

  def inactivate
    update_attribute(:is_deleted, true)
  end
end
