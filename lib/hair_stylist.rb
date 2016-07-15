class Hair_stylist
  attr_reader(:id, :name)

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def == |another_hair_stylist|
    self.name == another_hair_stylist.name && self.id == another_hair_stylist.id
  end

  def Hair_stylist.all
    results = DB.exec("SELECT * FROM hair_stylists")
    hair_stylists = []
    results.each do |hair_stylist|
      name = hair_stylist['name']
      id = hair_stylist['id']
      hair_stylists.push Hair_stylist.new {name: name, id: id}
    end
    hair_stylists
  end

  def save
    result = DB.exec("INSERT INTO hair_stylists (name) VALUES '(#{@name})' RETURNING id;")
    @id = result.first['id'].to_i
  end

  def find_by_id (id)
    result = DB.exec("SELECT * FROM hair_stylists WHERE id = #{id}").first
    name = result['name']
    id = result['id']
    Hair_stylist.new {name: name, id: id}
  end
end
