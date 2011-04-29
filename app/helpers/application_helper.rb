module ApplicationHelper
  def get_stylesheets
    stylesheets = [] unless stylesheets
    ["#{controller.controller_path}/#{controller.action_name}"].each do |ss|
      stylesheets << ss
    end
  end

  def observe_fields(fields, options)
	  with = ""                          #prepare a value of the :with parameter
	  for field in fields
		  with += "'"
		  with += "&" if field != fields.first
		  with += field + "='+escape($('" + field + "').value)"
		  with += " + " if field != fields.last
	  end

	  ret = "";      #generate a call of the observer_field helper for each field
	  for field in fields
		  ret += observe_field(field,	options.merge( { :with => with }))
	  end
	  ret
  end

  def shorten_string(string, count)
    if string.length >= count
      shortened = string[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
    else
      string
    end
  end

  def currency
    Configuration.find_by_config_key("CurrencyType").config_value
  end
  
  #获取I18n实体属性名称
  #since 2011-04-13
  #author wangqun
  def tt(path)
    t("activerecord.attributes.#{path}")
  end

  #教室下拉框(用于subjects/new)
  #author by wangqun
  #since 2011-04-02
  def select_classroom_option(list = Classroom.active, param_hash = {})
    options = [["选择一个教室", ""]]
    list.each do |c|
      options += [[c.full_name, c.id]]
    end
    options
  end
end
