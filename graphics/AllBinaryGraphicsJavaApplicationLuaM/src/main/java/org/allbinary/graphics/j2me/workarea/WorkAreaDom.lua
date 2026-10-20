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
-- package org.allbinary.graphics.j2me.workarea

local DomHelper = require("org.allbinary.dom.DomHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WorkAreaDom = {}
WorkAreaDom.__index = WorkAreaDom
WorkAreaDom.className = "WorkAreaDom"

function WorkAreaDom:_init_fields()
    self.name = nil
    self.canvasNodeList = nil
end


function WorkAreaDom.new(document)
    local self = setmetatable({}, WorkAreaDom)
    self:_init_fields()
        local workAreaNodeList = document:getElementsByTagName(self.WORKAREA)
        if workAreaNodeList ~= nil then
            local numberOfworkAreas = workAreaNodeList:getLength()
            if numberOfworkAreas == 1 then
                local numberOfNodes = workAreaNodeList:getLength()
                local nameNode = DomHelper.getInstance():searchNodeList(self.NAME, workAreaNodeList:item(0):getChildNodes())
                local nameTextNode = nameNode:getFirstChild()
                self.name = nameTextNode:getNodeValue()
            else
                error(java_exception("Exception", "Wrong Number of WorkAreas: " .. tostring(numberOfworkAreas)), 0)
            end
            self.canvasNodeList = DomHelper.getInstance():getChildrenWithoutTextNodes(WorkAreaDom.FRAMES, workAreaNodeList:item(0):getChildNodes())
        else
            error(java_exception("Exception", "workArea Node Not Found"), 0)
        end
    return self
end


function WorkAreaDom:getName()
        return self.name
end


function WorkAreaDom:getCanvasNodes()
        return self.canvasNodeList
end

WorkAreaDom.WORKAREA = "workArea"
WorkAreaDom.NAME = "name"
WorkAreaDom.FRAMES = "frames"

return WorkAreaDom

