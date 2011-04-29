#特定财经费用
class CreateFinanceFeeParticulars < ActiveRecord::Migration
  def self.up
    create_table :finance_fee_particulars do |t|
      t.string      :name, :comment => "名称"
      t.text        :description, :comment => "描述"
      t.decimal     :amount, :precision => 8, :scale => 2, :comment => "数量"
      t.references  :finance_fee_category, :comment => "关联财经费用类别"
      t.references  :student_category, :comment => "关联学生类别"
      t.string      :admission_no, :comment => "学号"
      t.references  :student, :comment => "关联学生"
      t.boolean     :is_deleted, :null => false, :default => false, :comment => "是否删除"
      t.timestamps
    end
  end

  def self.down
    drop_table :finance_fee_particulars
  end
end
