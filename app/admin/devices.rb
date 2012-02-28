# encoding: utf-8
ActiveAdmin.register Device do
  
  scope :all, :default => true
  scope "В наличии", :avaliable
  scope "Установлено клиентам", :unavaliable
  
  filter :device_type_id, :label => "Модели", :as => :select, :collection => DeviceType.find(:all)
  filter :name, :label => "Серийному номеру"
  
  menu :label => "Оборудование", :priority => 1
  
  index do
    #column "Модель", :model 
    column "Модель" do |device|
      link_to device.model, admin_device_path(device)
    end
    column "Серийный номер", :name
    #column "Доступность", :avaliability
    #column "Свободен" do |device|
    #   status_tag ( device.client_id ? "Занят" : "Свободен" ), ( device.client_id ? :warning : :ok )
    #end
    #default_actions
  end
  
  show do
    h1 device.model
    attributes_table_for device do
      #row("Модель") { link_to device.device_type.name, admin_device_type_path(device.device_type) }
      row("Серийный номер") { device.name }
      (row("Установлен клиенту") { link_to device.client.name, admin_client_path(device.client) }) if device.client_id != nil
    end
    attributes_table_for device.device_type do
      row("Общее количество телефонных линий (FXS-порты)") { device.device_type.fxs }
      row("Функции роутера") { device.device_type.router ? "Есть" : "Нет" }
      (row("Wi-Fi") { device.device_type.wifi ? "Есть" : "Нет" }) if device.device_type.router == true
      row("Количество Ethernet-портов") { device.device_type.lan }
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
