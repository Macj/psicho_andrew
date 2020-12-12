require 'telegram/bot'
require 'tg'
class Request < ActiveRecord::Base
	belongs_to :client

	serialize :days, Array
	before_save :handle_info


	def handle_info
    TG.send info
	end

  def info
    "Вы получили заявку \n" +
    "от id:#{client.id} | #{client.name}, phone: #{client.phone}, email: #{client.email} \n" +
    "с коментарием: #{request} \n" +
    "пожелание клиента по месенджеру: \n" +
    "#{"telegram \n"  if telegram}" +
    "#{"viber \n"     if viber}" +
    "#{"whatsapp \n"  if whatsapp}"
  end
end


