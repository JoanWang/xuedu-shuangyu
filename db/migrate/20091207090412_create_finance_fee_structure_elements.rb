#财经费用结构成份
class CreateFinanceFeeStructureElements < ActiveRecord::Migration
  def self.up
    create_table :finance_fee_structure_elements do |t|
      t.decimal    :amount, :precision => 8, :scale => 2, :comment => "数量"
      t.string     :label, :comment => "标签"
      t.references :batch, :comment => "关联学期"
      t.references :student_category, :comment => "关联学生类别"
      t.references :student, :comment => "关联学生"
      t.references :parent, :comment => "关联父级"
      t.references :fee_collection, :comment => "费用集"
      t.boolean    :deleted, :default => false, :comment => "是否删除"
    end
  end

  def self.down
    drop_table :finance_fee_structure_elements
  end
end
