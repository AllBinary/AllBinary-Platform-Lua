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
-- package org.allbinary.logic.visual.transform.info


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfosData = {}
TransformInfosData.__index = TransformInfosData
TransformInfosData.className = "TransformInfosData"

function TransformInfosData:_init_fields()
    self.NAME = "TRANSFORM_INFOS_NAME"
    self.GROUP = "TRANSFORM_INFOS_GROUP"
    self.ALL = "TRANSFORM_INFOS_ALL"
    self.PREVIEW = "TRANSFORM_INFOS_PREVIEW"
    self.SMALL_PREVIEW = "TRANSFORM_INFOS_SMALL_PREVIEW"
end


function TransformInfosData.new()
    local self = setmetatable({}, TransformInfosData)
    self:_init_fields()
    return self
end


function TransformInfosData.getInstance()
        return TransformInfosData.instance
end

TransformInfosData.instance = TransformInfosData.new()

return TransformInfosData

