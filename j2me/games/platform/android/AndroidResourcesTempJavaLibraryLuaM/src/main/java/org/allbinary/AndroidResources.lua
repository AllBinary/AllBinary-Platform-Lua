-- Generated Code Do Not Modify
-- package org.allbinary

local R = require("org.allbinary.game.testgamedemo.R")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidResources = {}
AndroidResources.__index = AndroidResources
AndroidResources.className = "AndroidResources"

function AndroidResources:_init_fields()
    self.drawable = drawable.new()
    self.id = id.new()
    self.layout = layout.new()
    self.raw = raw.new()
    self.string = string.new()
end

function AndroidResources.new()
    local self = setmetatable({}, AndroidResources)
    self:_init_fields()
    return self
end


function AndroidResources.getInstance()
        return AndroidResources.instance
end

AndroidResources.instance = AndroidResources.new()

return AndroidResources

