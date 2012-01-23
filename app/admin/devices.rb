# encoding: utf-8
ActiveAdmin.register Device do
  menu :label => "Оборудование", :priority => 1
  
  index do
    column :name
    
    default_actions
  end
  
  show do
    attributes_table_for device do
      row("Модель") { device.device_type.name }
      row("Серийный номер") { device.name }
      (row("Установлен клиенту") { device.client.name }) if device.client_id != nil
    end
  end
  
  form do |f|
    f.inputs do
      f.input :client_id, :as => :select, :collection => Client.find(:all)
      f.input :device_type_id, :as => :select, :collection => DeviceType.find(:all)
      f.input :name, :label => "Серийный номер"
      f.buttons
    end
  end
end
