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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local TransformInfoObjectConfigInterface = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface"] = TransformInfoObjectConfigInterface

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomDocumentMappingInterface = require("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

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
-- class table TransformInfoObjectConfigInterface is declared before the requires
TransformInfoObjectConfigInterface.__index = TransformInfoObjectConfigInterface
TransformInfoObjectConfigInterface.className = "TransformInfoObjectConfigInterface"
TransformInfoObjectConfigInterface.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface"
setmetatable(TransformInfoObjectConfigInterface, {__index = DomDocumentMappingInterface})
TransformInfoObjectConfigInterface.java_interfaces = function() return {DomDocumentMappingInterface} end


function TransformInfoObjectConfigInterface:containsView(transformInfoInterface)
    error("abstract method containsView")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getName()
    error("abstract method getName")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getTransformsGroup(group)
    error("abstract method getTransformsGroup")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getTransforms()
    error("abstract method getTransforms")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getParentTransforms()
    error("abstract method getParentTransforms")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getGroupTransforms()
    error("abstract method getGroupTransforms")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getOutputTypeName()
    error("abstract method getOutputTypeName")
end


function TransformInfoObjectConfigInterface:setOutputTypeName(value)
    error("abstract method setOutputTypeName")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getInputOutputTypeName()
    error("abstract method getInputOutputTypeName")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getInputOutputTypeFile()
    error("abstract method getInputOutputTypeFile")
end


-- throws Exception
function TransformInfoObjectConfigInterface:getImportUriPath()
    error("abstract method getImportUriPath")
end


function TransformInfoObjectConfigInterface:toString()
    error("abstract method toString")
end
TransformInfoObjectConfigInterface.__tostring = function(self) return self:toString() end

return TransformInfoObjectConfigInterface

