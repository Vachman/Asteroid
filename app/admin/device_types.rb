# encoding: utf-8
ActiveAdmin.register DeviceType do
  
  filter :router, :label => "Роутер", :as => :select 
  filter :protocol, :label => "Протокол", :as => :select,  :collection => ["SIP", "h.323", "E1"]
  filter :fxs, :label => "Количество телефонных линий"
  filter :wifi, :label => "Наличие Wi-fi", :as => :select
  filter :lan, :label => "Количество портов для сетевых устройств (ПК, ТВ-приставки)" 

  menu :label => "Типы оборудования", :parent => "Оборудование", :priority => 2
  
  index do
    column "Модель" do |device_type|
      link_to device_type.name, admin_device_type_path(device_type)
    end
    #column ("Модель"), :name
    column ("В наличии"), :avaliable
    column ("Стоимость"), :price
    #default_actions
  end
  
  show do
    h2 device_type.name
    attributes_table_for device_type do
      #row("Модель") { device_type.name }
      row("Количество линий") { device_type.fxs }
      row("Функции роутера") { device_type.router ? "Есть" : "Нет" }

      (row("Wi-Fi") { device_type.wifi ? "Есть" : "Нет" }) if device_type.router == true
      row("В наличии") { device_type.avaliable }
      row("Установлено абонентам") { device_type.unavaliable }
      row("Стоимость (рублей)")  { device_type.price }   
    end
  end
  
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Модель"
      f.input :fxs, :label => "Количество линий"
      f.input :lan, :label => "Количество ethernet портов"
      f.input :protocol, :label => "Протокол", :as => :select, :collection => ["SIP", "h.323", "E1"]
      f.input :router, :label => "Маршрутизатор"
      f.input :wifi, :label => "Наличие Wi-Fi"
      f.input :price, :label => "Стоимость"
    end
    f.buttons
  end
  
end
