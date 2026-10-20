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
-- package org.allbinary.logic.visual.dhtml.style.css.property

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CssPropertiesValidationFactory = {}
CssPropertiesValidationFactory.__index = CssPropertiesValidationFactory
CssPropertiesValidationFactory.className = "CssPropertiesValidationFactory"


function CssPropertiesValidationFactory.new()
    local self = setmetatable({}, CssPropertiesValidationFactory)
    return self
end


-- throws Exception
function CssPropertiesValidationFactory.getInstance(nodeList)
        local propertiesVector = BasicArrayListD.new()
        for index = 0, nodeList:getLength() - 1 do
            local node = nodeList:item(index)
            if node:getNodeName():compareTo(CssPropertyData.getInstance().NAME) == 0 then
                local cssPropertyValidationInterface = CssPropertyValidationFactory.getInstance(node)
                propertiesVector:add(cssPropertyValidationInterface)
            end
        end
        return propertiesVector
end


-- Java overloaded method: Lua keeps the last definition
function CssPropertiesValidationFactory.getInstance(hashMap)
        local styles = BasicArrayListD.new()
        return styles
end

return CssPropertiesValidationFactory

