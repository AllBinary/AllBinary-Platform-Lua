-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer.capital.event

local Group = require("org.allbinary.game.identification.Group")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CapitalEventHandlerFactory = {}
CapitalEventHandlerFactory.__index = CapitalEventHandlerFactory
CapitalEventHandlerFactory.className = "CapitalEventHandlerFactory"

function CapitalEventHandlerFactory.new()
    local self = setmetatable({}, CapitalEventHandlerFactory)
    return self
end


function CapitalEventHandlerFactory.getInstance(groupInterface)
        return CapitalEventHandlerFactory.capitalEventHandlerArray[java_int(groupInterface:getGroupId()) + 1]
end


function CapitalEventHandlerFactory.removeAll()
        for index = (CapitalEventHandlerFactory.capitalEventHandlerArray.n or #CapitalEventHandlerFactory.capitalEventHandlerArray) - 1, 0, -1 do
            CapitalEventHandlerFactory.capitalEventHandlerArray[index + 1]:removeAllListeners()
        end
end

CapitalEventHandlerFactory.capitalEventHandlerArray = nil


do -- Java static initializer
        CapitalEventHandlerFactory.capitalEventHandlerArray = java_new_array(nil, 10)
        for index = (CapitalEventHandlerFactory.capitalEventHandlerArray.n or #CapitalEventHandlerFactory.capitalEventHandlerArray) - 1, 0, -1 do
            CapitalEventHandlerFactory.capitalEventHandlerArray[index + 1] = CapitalEventHandler.new()
        end
end

return CapitalEventHandlerFactory

