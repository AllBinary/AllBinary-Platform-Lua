-- Generated Code Do Not Modify
-- package org.allbinary.game.configuration.feature


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultiPlayerGameFeatureFactory = {}
MultiPlayerGameFeatureFactory.__index = MultiPlayerGameFeatureFactory
MultiPlayerGameFeatureFactory.className = "MultiPlayerGameFeatureFactory"


function MultiPlayerGameFeatureFactory.getInstance()
        return MultiPlayerGameFeatureFactory.instance
end


function MultiPlayerGameFeatureFactory.new()
    local self = setmetatable({}, MultiPlayerGameFeatureFactory)
    return self
end


function MultiPlayerGameFeatureFactory:addCommands(anyType)
end

MultiPlayerGameFeatureFactory.instance = MultiPlayerGameFeatureFactory.new()

return MultiPlayerGameFeatureFactory

