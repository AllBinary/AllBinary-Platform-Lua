-- Generated Code Do Not Modify
-- package org.allbinary.game.input.analog

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnalogLocationInputFactory = {}
AnalogLocationInputFactory.__index = AnalogLocationInputFactory
AnalogLocationInputFactory.className = "AnalogLocationInputFactory"

function AnalogLocationInputFactory:_init_fields()
    self.list = BasicArrayListD.new()
end


function AnalogLocationInputFactory.getInstance()
        return AnalogLocationInputFactory.instance
end


function AnalogLocationInputFactory.new()
    local self = setmetatable({}, AnalogLocationInputFactory)
    self:_init_fields()
    return self
end


function AnalogLocationInputFactory:addPlayer(playerInputId)
        local analogLocationInput = AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT
        if playerInputId < self.list:size() then
            analogLocationInput = self.list:get(playerInputId)
        end
        if analogLocationInput == AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT then
            analogLocationInput = AnalogLocationInput.new(playerInputId)
            self.list:add(analogLocationInput)
        end
end


function AnalogLocationInputFactory:getInstanceForPlayer(playerInputId)
        return self.list:get(playerInputId)
end


function AnalogLocationInputFactory:getList()
        return self.list
end

AnalogLocationInputFactory.instance = AnalogLocationInputFactory.new()

return AnalogLocationInputFactory

