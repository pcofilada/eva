parking_lots = ActiveSupport::JSON.decode(File.read('db/parkings.json'))

parking_lots.each do |parking|
  Parking.create(
    name: parking['name'],
    address: parking['address'],
    slots: parking['slots'],
    contact: parking['contact'],
    initial_rate: parking['initial_rate'],
    succeeding_rate: parking['succeeding_rate'],
    lat: parking['lat'],
    long: parking['lng']
  )
end
