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
-- package org.allbinary.logic.visual.transform

local DomDocumentMappingInterface = require("org.allbinary.data.tree.dom.document.mapping.DomDocumentMappingInterface")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")
local CompositeTransformInfoInterface = require("org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface")

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
local TransformInterface = {}
TransformInterface.__index = TransformInterface
TransformInterface.className = "TransformInterface"
setmetatable(TransformInterface, {__index = DomDocumentMappingInterface})


function TransformInterface:getTypeId()
    error("abstract method getTypeId")
end


function TransformInterface:setTransformDocumentInterface(viewDocumentInterface)
    error("abstract method setTransformDocumentInterface")
end


function TransformInterface:getTransformDocumentInterface()
    error("abstract method getTransformDocumentInterface")
end


-- throws Exception
function TransformInterface:view()
    error("abstract method view")
end

return TransformInterface

