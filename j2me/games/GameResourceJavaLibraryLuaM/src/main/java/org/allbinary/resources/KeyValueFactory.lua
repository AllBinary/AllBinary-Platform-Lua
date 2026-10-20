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
-- package org.allbinary.resources

local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyValueFactory = {}
KeyValueFactory.__index = KeyValueFactory
KeyValueFactory.className = "KeyValueFactory"

function KeyValueFactory:_init_fields()
    self.MAP = StdUtil.getInstance():createHashtable()
end

function KeyValueFactory.new()
    local self = setmetatable({}, KeyValueFactory)
    self:_init_fields()
    return self
end


function KeyValueFactory.getInstance()
        return KeyValueFactory.instance
end


function KeyValueFactory:get(key)
        local value = self.MAP:get(key)
        if value == nil then
            return key
        end
        return value
end

KeyValueFactory.instance = KeyValueFactory.new()

return KeyValueFactory

