--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
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

local PCGameKey = {}
PCGameKey.__index = PCGameKey
PCGameKey.className = "PCGameKey"
setmetatable(PCGameKey, {__index = Input})


function PCGameKey.new(keyCode, name)
    local self = setmetatable(Input.new(keyCode, name), PCGameKey)
        -- super(...) made self above
        local id = self:getId()
        if id >= 0 then
            InputFactory.getInstance():add(id, self)
        end
    return self
end


function PCGameKey:toString()
        return "PCGameKey: " .. tostring(Input)
end
PCGameKey.__tostring = function(self) return self:toString() end


function PCGameKey.getString(keyCode)
        local input = InputFactory.getInstance():getInstanceById(keyCode)
        if input ~= nil then
            return input:getName()
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end

return PCGameKey

