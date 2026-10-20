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

-- local HashMap = require("java.util.HashMap")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local Document = require("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local TransformInfoInterface = {}
TransformInfoInterface.__index = TransformInfoInterface
TransformInfoInterface.className = "TransformInfoInterface"
setmetatable(TransformInfoInterface, {__index = TableMappingInterface})


function TransformInfoInterface:log()
    error("abstract method log")
end


-- throws Exception
function TransformInfoInterface:override(hashMap)
    error("abstract method override")
end


function TransformInfoInterface:getName()
    error("abstract method getName")
end


function TransformInfoInterface:setStoreName(value)
    error("abstract method setStoreName")
end


function TransformInfoInterface:getStoreName()
    error("abstract method getStoreName")
end


function TransformInfoInterface:getObjectFile()
    error("abstract method getObjectFile")
end


function TransformInfoInterface:getObject()
    error("abstract method getObject")
end


-- throws Exception
function TransformInfoInterface:getTemplateFilePath()
    error("abstract method getTemplateFilePath")
end


function TransformInfoInterface:getTemplateFile()
    error("abstract method getTemplateFile")
end


function TransformInfoInterface:getTemplate()
    error("abstract method getTemplate")
end


-- throws Exception
function TransformInfoInterface:getDataFilePath()
    error("abstract method getDataFilePath")
end


function TransformInfoInterface:getDataFile()
    error("abstract method getDataFile")
end


-- throws Exception
function TransformInfoInterface:getDataDocument()
    error("abstract method getDataDocument")
end


function TransformInfoInterface:setName(value)
    error("abstract method setName")
end


function TransformInfoInterface:setObjectFile(value)
    error("abstract method setObjectFile")
end


function TransformInfoInterface:setObject(anyType)
    error("abstract method setObject")
end


-- throws Exception
function TransformInfoInterface:setObjectConfigInterface(transformInfoObjectConfigInterface)
    error("abstract method setObjectConfigInterface")
end


-- throws Exception
function TransformInfoInterface:getObjectConfigInterface()
    error("abstract method getObjectConfigInterface")
end


function TransformInfoInterface:setTemplateFile(value)
    error("abstract method setTemplateFile")
end


function TransformInfoInterface:setTemplate(value)
    error("abstract method setTemplate")
end


function TransformInfoInterface:setDataFile(value)
    error("abstract method setDataFile")
end


function TransformInfoInterface:setData(value)
    error("abstract method setData")
end


function TransformInfoInterface:setChild()
    error("abstract method setChild")
end


function TransformInfoInterface:isChild()
    error("abstract method isChild")
end

return TransformInfoInterface

