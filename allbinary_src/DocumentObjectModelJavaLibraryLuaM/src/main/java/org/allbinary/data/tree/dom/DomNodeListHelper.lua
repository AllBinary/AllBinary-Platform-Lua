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
-- package org.allbinary.data.tree.dom

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
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

local DomNodeListHelper = {}
DomNodeListHelper.__index = DomNodeListHelper
DomNodeListHelper.className = "DomNodeListHelper"

function DomNodeListHelper.new()
    local self = setmetatable({}, DomNodeListHelper)
    return self
end


function DomNodeListHelper.getVector(nodeList)
        local vector = BasicArrayListD.new()
        local size = nodeList:getLength()
        for index = 0, size - 1 do
            vector:add(DomNodeHelper.getTextNodeValue(nodeList:item(index)))
        end
        return vector
end

return DomNodeListHelper

