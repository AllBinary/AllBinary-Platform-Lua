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

local TransformInfoProperties = {}
TransformInfoProperties.__index = TransformInfoProperties
TransformInfoProperties.className = "TransformInfoProperties"

function TransformInfoProperties:_init_fields()
    self.name = nil
    self.label = nil
    self.description = nil
    self.objectFileName = nil
    self.objectConfigFileName = nil
    self.templateFileName = nil
end


function TransformInfoProperties.new(name, label, description, objectFileName, objectConfigFileName, templateFileName)
    local self = setmetatable({}, TransformInfoProperties)
    self:_init_fields()
        self.name = name
        self.label = label
        self.description = description
        self.objectFileName = objectFileName
        self.templateFileName = templateFileName
        self.objectConfigFileName = objectConfigFileName
    return self
end


function TransformInfoProperties:setName(value)
        self.name = value
end


function TransformInfoProperties:setDescription(value)
        self.description = value
end


function TransformInfoProperties:setViewFile(value)
        self.objectFileName = value
end


function TransformInfoProperties:setTemplateFile(value)
        self.templateFileName = value
end


function TransformInfoProperties:setObjectConfigFile(value)
        self.objectConfigFileName = value
end


function TransformInfoProperties:getName()
        return self.name
end


function TransformInfoProperties:getLabel()
        return self.label
end


function TransformInfoProperties:getDescription()
        return self.description
end


function TransformInfoProperties:getViewFile()
        return self.objectFileName
end


function TransformInfoProperties:getTemplateFile()
        return self.templateFileName
end


function TransformInfoProperties:getObjectConfigFile()
        return self.objectConfigFileName
end

return TransformInfoProperties

