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
-- package org.allbinary.logic.visual.dhtml.style.css

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CssElementsValidationFactory = {}
CssElementsValidationFactory.__index = CssElementsValidationFactory
CssElementsValidationFactory.className = "CssElementsValidationFactory"


function CssElementsValidationFactory.new()
    local self = setmetatable({}, CssElementsValidationFactory)
    return self
end


-- throws Exception
function CssElementsValidationFactory.getInstance(cssElementStyleNodeList)
        local styles = BasicArrayListD.new()
        local size = cssElementStyleNodeList:size()
        local cssElementStyleNode = nil
        local cssValidationInterface = nil
        for index = 0, size - 1 do
            cssElementStyleNode = cssElementStyleNodeList:get(index)
            cssValidationInterface = CssElementValidationFactory.getInstance(cssElementStyleNode)
            styles:add(cssValidationInterface)
        end
        return styles
end


-- Java overloaded method: Lua keeps the last definition
function CssElementsValidationFactory.getInstance(hashMap)
        local styles = BasicArrayListD.new()
        return styles
end

return CssElementsValidationFactory

