# encoding: utf-8
ActiveAdmin.register Client do
  menu :label => "Клиенты", :priority => 1
  
  scope :all, :default => true
  scope "Люди", :people
  scope "Организации" ,:companies
  
  index do
    column "Клиент", :name
    default_actions
  end

  show do 
    panel "Подробности" do
       attributes_table_for client do
        row( client.company ? "Организация" : "ФИО" ) { client.name }
        (row("Детализация") { link_to "Скачать", 'http://89.255.64.94:8081/avaya/', {:target => "_new"} }) if client.id == 7 
       end     
    end
    
    (panel "Номера" do
      table_for client.phones do |t|
        t.column("Номер") { |phone| link_to phone.number, admin_phone_path(phone) }
        t.column("Статус") do |phone|
           status_tag ( phone.blocked ? "Заблокирован" : "Активен" ), ( phone.blocked ? :error : :ok )
        end
      end
    end) unless client.phones.empty?
    
    (panel "Устройства" do
      table_for client.devices do |t|
        t.column("Модель") { |device| link_to device.device_type.name, admin_device_type_path(device) }
        t.column("Серийный номер") { |device| device.name }
      end
    end) unless client.devices.empty?
    
    active_admin_comments
  end

  form do |f|
    f.inputs do 
      f.input :name, :label => ( f.object.company ? "Организация" : "ФИО" )
      f.input :company, :label => "Организация"
    end  
    f.buttons
  end  
end