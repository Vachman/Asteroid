# encoding: utf-8
ActiveAdmin.register OperatorContact do
  menu :label => "Контакты", :parent => "Операторы", :priority => 2
  
  index do
    column "Контакт", :name
    column "Телефон коммерческого отдела", :manager_phone
    column "Телефон отдела технической поддержки", :support_phone
    default_actions
  end
  
  show do
    attributes_table do
      row("Договор номер") { operator_contact.name }
      row("Дата подписания") { operator_contact.name }
      row("Ответственный менеджер") { operator_contact.our_manager_id }
      row("Телефон коммерческого отдела") { operator_contact.manager_phone }
      row("Почта коммерческого отдела") { operator_contact.manager_mail }
      row("Телефон отдела технической поддержки") { operator_contact.support_phone }
      row("Почта отдела технической поддержки") { operator_contact.support_mail }
    end
  end
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Название"
      f.input :manager_phone, :label => "Телефон коммерческого отдела"
      f.input :manager_mail, :label => "Почта коммерческого отдела"
      f.input :support_phone, :label => "Телефон отдела технической поддержки"
      f.input :support_mail, :label => "Почта отдела технической поддержки"
      f.input :our_manager_id, :lbael => "Ответственный менеджер"
    end
    f.buttons
  end
end

