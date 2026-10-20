-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Input = require("org.allbinary.game.input.Input")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidGameKey = {}
AndroidGameKey.__index = AndroidGameKey
AndroidGameKey.className = "AndroidGameKey"
setmetatable(AndroidGameKey, {__index = Input})


function AndroidGameKey.new(keyCode, name)
    local self = setmetatable(Input.new(keyCode, name), AndroidGameKey)
        -- super(...) made self above
        local inputFactory = InputFactory.getInstance()
        inputFactory.inputIntegerArray[self:getId() + 1] = self
    return self
end


function AndroidGameKey:toString()
        return "AndroidGameKey: " .. tostring(Input)
end
AndroidGameKey.__tostring = function(self) return self:toString() end


function AndroidGameKey.getString(keyCode)
        local input = InputFactory.getInstance():getInstanceById(keyCode)
        if input ~= nil then
            return input:getName()
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end

return AndroidGameKey

