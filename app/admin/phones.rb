# encoding: utf-8
ActiveAdmin.register Phone do
  menu :label => "Внешние", :parent => "Номера", :priority => 2
  
  scope :all, :default => true
  scope "Активные", :active
  scope "Заблокированны", :blocked
  
  filter :client, :label => "Клиент"
  filter :number, :label => "Номеру"

  index do 
    column :number
    column "Клиент", :client
    column "Статус" do |phone|
       status_tag ( phone.blocked ? "Заблокирован" : "Активен" ), ( phone.blocked ? :error : :ok )
    end  
    
    default_actions
  end
  
  form do |f|
      f.inputs do 
        f.input :client, :label => "Клиент"
        f.input :number, :label => "Номер"
        f.input :blocked, :label => "Заблокирован" 
        f.input :operator_id, :label => "Оператор", :as => :select, :collection => Operator.find(:all)       
      end  
      f.inputs "Услуги" do
        f.input :record, :label => "Запись разговоров"
      end
      f.buttons
  end
  
  show do
    attributes_table do
      row("Номер") { phone.number }
      row("Клиент") { link_to phone.client.name, admin_client_path(phone.client) }
      row("Статус") { status_tag ( phone.blocked ? "Заблокирован" : "Активен" ), ( phone.blocked ? :error : :ok ) }
      row("Оператор") { |operator| phone.operator.name unless phone.operator.nil? }
      table_for phone.with_this_aon_sip_accounts do |t|
        t.column("Внутренний номер") { |sip_account|  sip_account.name unless sip_account.nil? }
        t.column("Активных линий") { |sip_account|  sip_account.call_limit unless sip_account.nil? }
      end
    end
    
    attributes_table do
     row("Запись разговоров") { status_tag ( phone.record ? "Включена" : "Выключена" ), ( phone.record ? :ok : :error ) }
    end
    active_admin_comments
  end
  
  
   action_item :only => [:show] do
     link_to('Создать', :action => :new)
   end
end