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
-- package org.allbinary.logic.visual.transform.template.customizer.bodies


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BodyData = {}
BodyData.__index = BodyData
BodyData.className = "BodyData"

function BodyData:_init_fields()
    self.NAME = "BODY_NAME"
    self.VIEWNAMEKEY = "Body"
    self.MIN = 0
end


function BodyData.new()
    local self = setmetatable({}, BodyData)
    self:_init_fields()
    return self
end


function BodyData.getInstance()
        return BodyData.instance
end

BodyData.instance = BodyData.new()

return BodyData

