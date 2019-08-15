require 'chat'

describe Chat do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO messages (text) VALUES ('Hello');")
      connection.exec("INSERT INTO messages (text) VALUES('How are you?');")
      connection.exec("INSERT INTO messages (text) VALUES('Ruby is fantastic!');")

      messages = Chat.all

      expect(messages).to include("Hello")
      expect(messages).to include("How are you?")
      expect(messages).to include("Ruby is fantastic!")
    end
  end
  describe '.create' do
    it 'creates a new message' do
      Chat.create(text: 'nice to meet you')

      expect(Chat.all).to include 'nice to meet you'
    end
  end
end

