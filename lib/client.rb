class Client
  attr_reader(:id, :name)

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id] || nil
  end

  def == (another_client)
    self.name == another_client.name && self.id == another_client.id
  end

  def Client.all
    results = DB.exec("SELECT * FROM clients;")
    clients = []
    results.each do |client|
      name = client['name']
      id = client['id'].to_i
      clients.push(Client.new({name: name, id: id}))
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def Client.find_by_id (id)
    result = DB.exec("SELECT * FROM clients WHERE id = #{id};").first
    name = result['name']
    id = result['id'].to_i
    Client.new({name: name, id: id})
  end

  def update (attributes)
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")

    hair_stylist_id = attributes[:hair_stylist_id]
    if hair_stylist_id
      DB.exec("UPDATE clients SET hair_stylist_id = #{hair_stylist_id} WHERE id = #{@id};")
    end
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{@id};")
  end

  def Client.find_by_hair_stylist_id (hair_stylist_id)
    results = DB.exec("SELECT * FROM clients WHERE hair_stylist_id = #{hair_stylist_id};")
    clients = []
    results.each do |client|
      name = client['name']
      id = client['id'].to_i
      clients.push(Client.new({name: name, id: id}))
    end
    clients
  end
end
