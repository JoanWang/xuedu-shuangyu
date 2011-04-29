class School < ActiveRecord::Base
  validates_presence_of :school_name, :school_code
  validate :presence_of_initial_classroom, :on => :create

  #添加classrooms属性
  has_many :classrooms
  accepts_nested_attributes_for :classrooms

  named_scope :active, :conditions => { :is_deleted => false }, :order => 'school_name asc'
  named_scope :deleted, :conditions => { :is_deleted => true }, :order => 'school_name asc'

  def presence_of_initial_classroom
    errors.add_to_base "Should have an initial classroom" if classrooms.length == 0
  end

  #删除记录
  def inactivate
    update_attribute(:is_deleted, true)
  end

  def full_name
    "#{school_name} #{school_code}"
  end
end
