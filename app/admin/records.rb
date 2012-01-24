# encoding: utf-8
ActiveAdmin.register Record do
  menu :label => "Записи разговоров"
  
  filter :client, :label => "По Клиенту"
  filter :called,  :label => "По исходящему номеру телефона", :as => :select, :collection =>  Phone.where('record is true')
  filter :calling,  :label => "По входящему номеру телефона", :as => :select, :collection =>  Phone.where('record is true')
  
  index do
    column "Клиент", :client
    column "Направление", :name
    column "Инициатор вызова", :called
    column "Назначение вызова", :calling
    column "Детализация" do |record|
      link_to "Скачать", record.link
    end
    
  end

  
end
