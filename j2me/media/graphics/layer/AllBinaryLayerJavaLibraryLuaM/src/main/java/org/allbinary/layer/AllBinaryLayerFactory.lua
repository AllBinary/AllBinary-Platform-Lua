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
-- package org.allbinary.layer

local Rectangle = require("org.allbinary.graphics.Rectangle")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ViewPosition = require("org.allbinary.view.ViewPosition")
local AllBinaryLayerFactoryInterface = require("org.allbinary.layer.AllBinaryLayerFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryLayerFactory = {}
AllBinaryLayerFactory.__index = AllBinaryLayerFactory
AllBinaryLayerFactory.className = "AllBinaryLayerFactory"

function AllBinaryLayerFactory:_init_fields()
    self.rectangle = nil
end


function AllBinaryLayerFactory.new(rectangle)
    local self = setmetatable({}, AllBinaryLayerFactory)
    self:_init_fields()
        self.rectangle = rectangle
    return self
end


function AllBinaryLayerFactory:getInstance()
        return AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, self.rectangle, ViewPosition.getInstanceD())
end

return AllBinaryLayerFactory

