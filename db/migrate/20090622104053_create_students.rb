#学生信息
class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string     :admission_no, :comment => "学号"
      t.string     :class_roll_no, :comment => "班级"
      t.date       :admission_date, :comment => "入学时间"

      t.string     :first_name, :comment => "姓氏"
      t.string     :middle_name, :comment => "中间名"
      t.string     :last_name, :comment => "名"

      t.references :batch, :comment => "关联学期"
      t.date       :date_of_birth, :comment => "出生日期"
      t.string     :gender, :comment => "性别"
      t.string     :blood_group, :comment => "血型"
      t.string     :birth_place, :comment => "出身地"
      t.integer    :nationality_id, :comment => "国籍"
      t.string     :language, :comment => "语言"
      t.string     :religion, :comment => "信仰"
      t.references :student_category, :comment => "关联学生类别"

      t.string     :address_line1, :comment => "地址1"
      t.string     :address_line2, :comment => "地址2"
      t.string     :city, :comment => "城市"
      t.string     :state, :comment => "州"
      t.string     :pin_code, :comment => "Pin码"
      t.integer    :country_id, :comment => "国家"

      t.string     :phone1, :comment => "电话1"
      t.string     :phone2, :comment => "电话2"
      t.string     :email, :comment => "email"

      t.references :immediate_contact, :comment => "关联即时联系人/监护人"
      t.boolean    :is_sms_enabled, :default=>true, :comment => "是否启用短信"

      t.string     :photo_filename, :comment => "上传照片名称"
      t.string     :photo_content_type, :comment => "照片类型"
      t.binary     :photo_data, :limit => 75.kilobytes, :comment => "照片大小"

      t.string     :status_description, :comment => "状态描述"
      t.boolean    :is_active, :default => true, :comment => "是否在校"
      t.boolean    :is_deleted, :default => false, :comment => "是否删除"

      t.timestamps
    end

    # Student categories

    create_table :student_categories do |t|
      t.string  :name, :comment => "名称"
      t.boolean :is_deleted, :comment => "是否删除"
    end
  end

  def self.down
    drop_table :student_categories
    drop_table :students
  end

end
