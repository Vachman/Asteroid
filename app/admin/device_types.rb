# encoding: utf-8
ActiveAdmin.register DeviceType do
  
  filter :router, :label => "Роутер", :as => :select 
  filter :wifi, :label => "Наличие Wi-fi", :as => :select 
  filter :fxs, :label => "Количество телефонных линий", :as => :select,  :collection => ["2", "4", "8", "30"]
  filter :protocol, :label => "Протокол", :as => :select,  :collection => ["SIP", "h.323", "E1"]

  
  menu :label => "Типы оборудования", :parent => "Оборудование", :priority => 2
  
  index do
    column ("Модель"), :name
    column ("В наличии"), :avaliable
    column ("Стоимость"), :price
    default_actions
  end
  
  show do
    attributes_table_for device_type do
      row("Модель") { device_type.name }
      row("Количество линий") { device_type.fxs }
      row("Функции роутера") { device_type.router ? "Есть" : "Нет" }

      (row("Wi-Fi") { device_type.wifi ? "Есть" : "Нет" }) if device_type.router == true
      row("В наличии") { device_type.avaliable }      
    end
  end
  
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Модель"
      f.input :fxs, :label => "Количество линий", :as => :select, :collection => ["2", "4", "8", "30"]
      f.input :lan, :label => "Количество ethernet портов", :as => :select, :collection => ["1", "4"]
      f.input :protocol, :label => "Протокол", :as => :select, :collection => ["SIP", "h.323", "E1"]
      f.input :router, :label => "Маршрутизатор"
      f.input :wifi, :label => "Наличие Wi-Fi"
      f.input :price, :label => "Стоимость"
    end
    f.buttons
  end
  
end
