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

local TransformInfoInterface = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoInterface"] = TransformInfoInterface

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local Document = java_lazy("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
-- class table TransformInfoInterface is declared before the requires
TransformInfoInterface.__index = TransformInfoInterface
TransformInfoInterface.className = "TransformInfoInterface"
TransformInfoInterface.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoInterface"
setmetatable(TransformInfoInterface, {__index = TableMappingInterface})
TransformInfoInterface.java_interfaces = function() return {TableMappingInterface} end


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

