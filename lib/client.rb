class Client
  attr_reader(:id, :name)

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id] || nil
  end

  def == |another_client|
    self.name == another_client.name && self.id == another_client.id
  end

  def Client.all
    results = DB.exec("SELECT * FROM clients")
    clients = []
    results.each do |client|
      name = client['name']
      id = client['id']
      clients.push Client.new {name: name, id: id}
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients (name) VALUES '(#{@name})' RETURNING id;")
    @id = result.first['id'].to_i
  end

  def Client.find_by_id (id)
    result = DB.exec("SELECT * FROM clients WHERE id = #{id}").first
    name = result['name']
    id = result['id']
    Client.new {name: name, id: id}
  end
end
