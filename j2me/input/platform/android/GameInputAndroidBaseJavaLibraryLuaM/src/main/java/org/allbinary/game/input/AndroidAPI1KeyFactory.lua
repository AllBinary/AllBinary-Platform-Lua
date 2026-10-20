-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local NullUtil = require("org.allbinary.logic.NullUtil")
local AndroidKeyFactory = require("org.allbinary.game.input.AndroidKeyFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidAPI1KeyFactory = {}
AndroidAPI1KeyFactory.__index = AndroidAPI1KeyFactory
AndroidAPI1KeyFactory.className = "AndroidAPI1KeyFactory"
setmetatable(AndroidAPI1KeyFactory, {__index = AndroidKeyFactory})


function AndroidAPI1KeyFactory.getInstance()
        if AndroidAPI1KeyFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            AndroidAPI1KeyFactory.instance = AndroidAPI1KeyFactory.new()
        end
        return AndroidAPI1KeyFactory.instance
end


function AndroidAPI1KeyFactory.new()
    local self = setmetatable(AndroidKeyFactory.new(), AndroidAPI1KeyFactory)
    return self
end

AndroidAPI1KeyFactory.instance = NullUtil.getInstance().NULL_OBJECT

return AndroidAPI1KeyFactory

