-- Generated Code Do Not Modify
-- package org.allbinary.game


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicGameInfoFactory = {}
BasicGameInfoFactory.__index = BasicGameInfoFactory
BasicGameInfoFactory.className = "BasicGameInfoFactory"

function BasicGameInfoFactory:_init_fields()
    self.currentReleaseIndex = 0
    self.currentDestroyIndex = 0
    self.total = 0
end


function BasicGameInfoFactory.getInstance()
        return BasicGameInfoFactory.SINGLETON
end


function BasicGameInfoFactory.new()
    local self = setmetatable({}, BasicGameInfoFactory)
    self:_init_fields()
    return self
end


function BasicGameInfoFactory:init(total)
        self.currentReleaseIndex = 0
        self.currentDestroyIndex = 0
        self.total = total
end


function BasicGameInfoFactory:isPeaked()
        if self.currentDestroyIndex >= self.total then
            return true
        else
            return false
        end
end


function BasicGameInfoFactory:howManyLeft()
        return self.total - self.currentDestroyIndex
end

BasicGameInfoFactory.SINGLETON = BasicGameInfoFactory.new()

return BasicGameInfoFactory

