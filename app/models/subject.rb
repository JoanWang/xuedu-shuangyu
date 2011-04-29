class Subject < ActiveRecord::Base

  #期次
  belongs_to :batch
  #选修
  belongs_to :elective_group
  #教室
  belongs_to :classroom
  #关联职员
  has_and_belongs_to_many :employees

  validates_presence_of :name, :max_weekly_classes, :code
  validates_numericality_of :max_weekly_classes

  named_scope :for_batch, lambda { |b| { :conditions => { :batch_id => b.to_i, :is_deleted => false } } }
  named_scope :without_exams, :conditions => { :no_exams => false, :is_deleted => false }

  def inactivate
    update_attribute(:is_deleted, true)
  end

  #枚举显示
  def YN_as_text
    return '否' if no_exams == true
    return '是' if no_exams == false
    nil
  end
end
