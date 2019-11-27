class TG
  Token = '978070548:AAHlVAw0YIo9vB4dOv3kr5JS4V7E5JQtPso'
  @@chat_id = 329449539

  def self.send text
    Telegram::Bot::Client.run(Token) do |bot|
      bot.api.send_message(chat_id: @@chat_id, text: text)
    end
  end
end