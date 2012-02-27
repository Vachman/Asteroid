# encoding: utf-8
ActiveAdmin.register Device do
  
  scope :all, :default => true
  scope "В наличии", :avaliable
  scope "Установлено клиентам", :unavaliable
  
  filter :device_type_id, :label => "Модели", :as => :select, :collection => DeviceType.find(:all)
  filter :name, :label => "Серийному номеру"
  
  menu :label => "Оборудование", :priority => 1
  
  index do
    column "Модель", :model 
    column "Серийный номер", :name
    
    default_actions
  end
  
  show do
    attributes_table_for device do
      row("Модель") { link_to device.device_type.name, admin_device_type_path(device.device_type) }
      row("Серийный номер") { device.name }
      (row("Установлен клиенту") { link_to device.client.name, admin_client_path(device.client) }) if device.client_id != nil
      #(row("Номер телефона") { device.client.phone.number }) if device.client 
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
