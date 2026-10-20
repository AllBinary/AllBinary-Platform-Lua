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
-- package org.allbinary.logic.visual.transform.info.template


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoTemplateData = {}
TransformInfoTemplateData.__index = TransformInfoTemplateData
TransformInfoTemplateData.className = "TransformInfoTemplateData"

function TransformInfoTemplateData:_init_fields()
    self.UNCRYPTED_EXTENSION = "xsl"
    self.ENCRYPTED_EXTENSION = "abv"
end


function TransformInfoTemplateData.getInstance()
        return TransformInfoTemplateData.instance
end


function TransformInfoTemplateData.new()
    local self = setmetatable({}, TransformInfoTemplateData)
    self:_init_fields()
    return self
end

TransformInfoTemplateData.instance = TransformInfoTemplateData.new()

return TransformInfoTemplateData

