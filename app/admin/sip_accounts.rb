# encoding: utf-8
ActiveAdmin.register SipAccount do
  menu :label => "SIP-аккаунты", :parent => "Номера", :priority => 2
  
  scope :all, :default => true 
  scope "Доступные", :available
  scope "Недоступные", :unavailable
  scope "Выключенные", :turned_off
  
  filter :name, :label => "Номеру"
  filter :client, :label => "Клиенту"
  filter :phone,  :label => "Номеру телефона"  
  
  
  index do
    column "Номер", :name 
    column ("Клиент") { |sip_account| sip_account.phone.client.name if sip_account.phone and sip_account.phone.client }
    column ("Статус") { |sip_account| status_tag sip_account.status, sip_account.status_tag  } 
    default_actions
  end
  
  form do |f|
    f.inputs do
     f.input :phone, :label => "АОН", :as => :select, :collection => Phone.find(:all)
     f.input :name, :label => "Имя"
     f.input :username, :label => "Логин"
     f.input :context, :label => "Контекст"
     f.input :secret, :label => "Пароль"
     f.input :host, :label => "Хост"
     f.input :allow, :label => "Кодеки"
     f.input :permit, :label =>"Разрешенные адреса"
     f.input :deny, :label => "Запрещенные адреса"
     f.input :nat, :label => "NAT"
     f.input :call_limit, :label => "Количество линий"
   end
   f.buttons
  end
  
  show do
    panel "Подробности" do
      attributes_table_for sip_account do
        row("Клиент") { sip_account.phone.client.name if sip_account.phone and sip_account.phone.client }
        row("Статус") { status_tag sip_account.status, sip_account.status_tag }
      end
        attributes_table_for sip_account do
        row("Имя линии") { sip_account.name }
        row("Разрешенные адреса") { sip_account.permit }
        row("Контекст") { sip_account.context }
        row("Имя подключенного устройства") { sip_account.useragent }
      end
    end
    
    active_admin_comments
  end
end
