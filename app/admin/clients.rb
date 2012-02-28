# encoding: utf-8
ActiveAdmin.register Client do
  menu :label => "Клиенты", :priority => 1
  
  filter :name, :label => "Имя"
  filter :date_ot_inclusion, :label => "Дата включения"
  
  scope :all, :default => true
  scope "Люди", :people
  scope "Организации" ,:companies
  
  index do
    #column "Клиент", :name
    column "Клиент" do |client|
      link_to client.name, admin_client_path(client)
    end
    column "Дата включения", :date_ot_inclusion
    column "Дата отключения", :off_date
    #default_actions
  end

  show do 
    h1 client.name
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
        t.column("Запись") do |phone|
           status_tag ( phone.blocked ? "Включена" : "Выключена" ), ( phone.blocked ? :ok : :error )
        end
      end
    end) unless client.phones.empty?
    
    (panel "Устройства" do
      table_for client.devices do |t|
        t.column("Модель") { |device| link_to device.device_type.name, admin_device_type_path(device.device_type) }
        t.column("Серийный номер") { |device| device.name }
      end
    end) unless client.devices.empty?
    
    panel "Включения" do
      attributes_table_for client do
        row("Дата включения") { client.date_ot_inclusion }
        row("Дата отключения") { client.off_date }
      end
    end
    
    active_admin_comments
  end

  form do |f|
    f.inputs do 
      f.input :name, :label => ( f.object.company ? "Организация" : "ФИО" )
      f.input :company, :label => "Организация"
      f.input :date_ot_inclusion, :label => "Дата включения"
      f.input :off_date, :label => "Дата отключения"
    end  
    f.buttons
  end
        
end