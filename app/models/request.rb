require 'telegram/bot'
require 'tg'
class Request < ActiveRecord::Base
	belongs_to :client

	serialize :days, Array
	before_save :handle_info


	def handle_info
		days.delete("0")
    TG.send info
	end

  def info
    "Вы получили заявку \n" +
    "от id:#{client.id} | #{client.name}, phone: #{client.phone}, email: #{client.email} \n" +
    "с коментарием: #{comment} \n" +
    "пожелание клиента по времени \n" +
    "дни #{days} \n" +
    "время #{from} - #{to} \n"
  end
end


