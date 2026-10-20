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
-- package org.allbinary.game.input

local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local SelectRTSLayerVisitorFactoryInterface = require("org.allbinary.game.input.SelectRTSLayerVisitorFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SelectRTSLayerVisitorFactory = {}
SelectRTSLayerVisitorFactory.__index = SelectRTSLayerVisitorFactory
SelectRTSLayerVisitorFactory.className = "SelectRTSLayerVisitorFactory"


function SelectRTSLayerVisitorFactory.getInstance()
        return SelectRTSLayerVisitorFactory.instance
end


function SelectRTSLayerVisitorFactory.new()
    local self = setmetatable({}, SelectRTSLayerVisitorFactory)
    return self
end


function SelectRTSLayerVisitorFactory:create(selectedRTSLayersPlayerGameInput)
        return SelectRTSLayerVisitor.new()
end

SelectRTSLayerVisitorFactory.instance = SelectRTSLayerVisitorFactory.new()

return SelectRTSLayerVisitorFactory

