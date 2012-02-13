# encoding: utf-8
ActiveAdmin.register Operator do
  menu :label => "Операторы"
  
  index do
    column "Название", :name
    column "Тип стыка", :connection_type
    default_actions
  end
  
  show do
    attributes_table do
      row("Название") { operator.name }
      row("Тип стыка") { operator.connection_type }
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Имя оператора", :as => :select, :collection => ["Нетлайн", "Westcall", "Смартел"]
      f.input :connection_type, :label => "Тип стыка", :as => :select, :collection => ["Е1", "h.323", "SIP"]
    end
    f.buttons
  end
end
