comp = require "component"
event = require "event"
serialization = require "serialization"
m = comp.modem
r = comp.br_reactor
r_data = {}

hub_adress = "e853c07a-6923-49e9-97fe-63c9dd1ed497"

while true do
    r_data[1] = r.getActive()
    r_data[2] = r.getFuelAmount()
    r_data[3] = r.getWasteAmount()
    r_data[4] = math.floor(r.getEnergyProducedLastTick())
    r_data[5] = r.getFuelAmountMax()
    m.send(hub_adress, 8000, serialization.serialize(r_data))
    os.sleep(1)
end
