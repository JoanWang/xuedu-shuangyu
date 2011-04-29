#职员信息
class CreateArchivedEmployees < ActiveRecord::Migration
  def self.up
    create_table :archived_employees do |t|
      t.references :employee_category, :comment => "类型"
      t.string     :employee_number, :comment => "数目"
      t.date       :joining_date, :comment => "入职时间"
      t.string     :first_name, :comment => "姓"
      t.string     :middle_name, :comment => "中间名"
      t.string     :last_name, :comment => "名字"
      t.boolean    :gender, :comment => "性别"
      t.string     :job_title, :comment => "头衔"
      t.references :employee_position, :comment => "所属职位"
      t.references :employee_department, :comment => "所属部门"
      t.integer    :reporting_manager_id, :comment => "上级"
      t.references :employee_grade, :comment => "所属等级"
      t.string     :qualification, :comment => "资格"
      t.text       :experience_detail, :comment => "工作经历"
      t.integer    :experience_year, :comment => "工作年份"
      t.integer    :experience_month, :comment => "工作月份"
      t.boolean    :status, :comment => "状态"
      t.string     :status_description, :comment => "详细描述状态"

      t.date       :date_of_birth, :comment => "出生日期"
      t.string     :marital_status, :comment => "婚姻状况"
      t.integer    :children_count, :comment => "子女个数"
      t.string     :father_name, :comment => "父亲姓名"
      t.string     :mother_name, :comment => "母亲姓名"
      t.string     :husband_name, :comment => "配偶姓名"
      t.string     :blood_group, :comment => "血型"
      t.references :nationality, :comment => "国籍"


      t.string     :home_address_line1, :comment => "住址1"
      t.string     :home_address_line2, :comment => "住址2"
      t.string     :home_city, :comment => "所在城市"
      t.string     :home_state, :comment => "所在州"
      t.integer    :home_country_id, :comment => "所在国家"
      t.string    :home_pin_code, :comment => "国家代码"

      t.string     :office_address_line1, :comment => "公司地址1"
      t.string     :office_address_line2, :comment => "公司地址2"
      t.string     :office_city, :comment => "工作地点"
      t.string     :office_state, :comment => "工作州"
      t.integer    :office_country_id, :comment => "工作国家"
      t.string    :office_pin_code, :comment => "工作地点代码"

      t.string     :office_phone1, :comment => "公司电话1"
      t.string     :office_phone2, :comment => "公司电话2"
      t.string     :mobile_phone, :comment => "手机号码"
      t.string     :home_phone, :comment => "固定电话"
      t.string     :email, :comment => "email"
      t.string     :fax, :comment => "传真"

      t.column   :photo_filename,       :string, :comment => "上传照片名称"
      t.column   :photo_content_type,   :string, :comment => "照片类型"
      t.column   :photo_data,           :binary, :limit => 5.megabytes, :comment => "照片大小"
      t.timestamps
    end
  end

  def self.down
    drop_table :archived_employees
  end
end
