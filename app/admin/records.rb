# encoding: utf-8
ActiveAdmin.register Record do
  menu :label => "Записи разговоров"
  
  #filter :client, :label => "По Клиенту", :as => :select, :collection => Client.where('phone.record is true')
  filter :called,  :label => "По инициатору вызова"
  filter :calling,  :label => "По назначению вызова"
  filter :created_at, :label => "По дате"
  filter :name, :label => "По направлению", :as => :select, :collection => ["Outgoing", "Incoming"]
  
  index do
    column "Дата", :created_at
    column "Клиент", :client
    column "Направление", :name
    column "Инициатор вызова", :called
    column "Назначение вызова", :calling
    column "Запись" do |record|
      link_to "Скачать", record.link
    end
    
  end

  
end
