# encoding: utf-8
ActiveAdmin.register Phone do
  menu :label => "Номера", :priority => 1
  
  scope :all, :default => true
  scope "Используемые", :active
  scope "Неиспользуемые", :blocked
  scope "Активированные оператором", :ordered
  scope "Требующие активации", :notordered
  
  filter :client, :label => "Клиенту"
  filter :operator_id, :label => "Оператору", :as => :select, :collection => Operator.find(:all)
  filter :number, :label => "Номеру"

  index do 
   # column "Номер", :number
    column "Номер" do |phone|
      link_to phone.number, admin_phone_path(phone)
    end
    column "Клиент", :client 
    column "Активирован оператором" do |phone|
       status_tag ( phone.ordered ? "Активирован" : "Требует активации" ), ( phone.ordered ? :ok : :error )
    end
    column "Блокирован" do |phone|
       status_tag ( phone.blocked ? "Заблокирован" : "Используется" ), ( phone.blocked ? :error : :ok )
    end
    
    #default_actions
  end
  
  form do |f|
      f.inputs do 
        f.input :client, :label => "Клиент"
        f.input :number, :label => "Номер"
        f.input :blocked, :label => "Заблокирован"
        f.input :ordered, :label => "Активирован оператором"
        f.input :reserved, :label => "Забронирован клиентом"
        f.input :operator_id, :label => "Оператор", :as => :select, :collection => Operator.find(:all)
      end  
      f.inputs "Услуги" do
        f.input :redirection, :label => "Безусловная переадресация"
        f.input :redirect_number, :label => "Номер для переадресации вида 8xxxxxxxxxx"
        f.input :timeout, :label => "Таймаут"
        f.input :congestion, :label => "При перегрузке"
        f.input :chanunavail, :label => "При проблемах в сети"
        f.input :noanswer, :label => "При длительном отсутствии ответа"
        f.input :busy, :label => "При занятой линии"
      end
      f.buttons
  end
  
  show do
    h1 phone.number
    attributes_table do
      #row("Номер") { phone.number }
      (row("Забронирован для") { phone.reserved }) unless phone.client
      (row("Клиент") { link_to phone.client.name, admin_client_path(phone.client) }) unless phone.client.nil?
      row("Статус") { status_tag ( phone.blocked ? "Заблокирован" : "Активен" ), ( phone.blocked ? :error : :ok ) }
      row("Оператор") { |operator| phone.operator.name unless phone.operator.nil? }
      row("Активирован оператором") { status_tag ( phone.ordered ? "Активирован" : "Требует активации" ), ( phone.ordered ? :ok : :error ) }
      table_for phone.with_this_aon_sip_accounts do |t|
        t.column("Внутренний номер") { |sip_account|  sip_account.name unless sip_account.nil? }
        t.column("Активных линий") { |sip_account|  sip_account.call_limit unless sip_account.nil? }
      end
    end
    
    attributes_table do
     row("Безусловная переадресация") { status_tag ( phone.redirection ? "Включена" : "Выключена" ), ( phone.redirection ? :ok : :error ) }
     row("Переадресация при перегрузке канала") { status_tag ( phone.congestion ? "Включена" : "Выключена" ), ( phone.congestion ? :ok : :error ) }
     row("Переадресация при проблемах в сети") { status_tag ( phone.chanunavail ? "Включена" : "Выключена" ), ( phone.chanunavail ? :ok : :error ) }
     row("Переадресация при длительном отсутствии ответа") { status_tag ( phone.noanswer ? "Включена" : "Выключена" ), ( phone.noanswer ? :ok : :error ) }
     row("Переадресация при занятой линии") { status_tag ( phone.busy ? "Включена" : "Выключена" ), ( phone.busy ? :ok : :error ) }
     row("Номер для переадресации") { phone.redirect_number }
    end
    active_admin_comments
  end
  
  
   action_item :only => [:show] do
     link_to('Создать', :action => :new)
   end
end