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
      row("Телефон отдела продаж") { operator.sales_phone }
      row("Почта отдела продаж") { operator.sales_mail }
      row("Телефон отдела технической поддержки") { operator.support_phone }
      row("Почта отдела технической поддержки") { operator.support_mail }
    end
    table_for operator.phones do |t|
      t.column("Предоставленные номера") { |phone|  phone.name unless phone.nil? }
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Имя оператора"
      f.input :connection_type, :label => "Тип стыка", :as => :select, :collection => ["Е1", "h.323", "SIP"]
      f.input :sales_phone, :label => "Телефон отдела продаж"
      f.input :sales_mail, :label => "Почта отдела продаж"
      f.input :support_phone, :label => "Телефон отдела технической поддержки"
      f.input :support_mail, :label => "Почта отдела технической поддержки"
      f.input :our_manager, :label => "Ответственный менеджер"
      f.input :their_manager, :label => "Менеджер со стороны оператора"
      
    end
    f.buttons
  end
end
