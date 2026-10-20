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
-- package org.allbinary.business.time.modified

local EntryData = require("org.allbinary.business.entry.EntryData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local Document = require("org.w3c.dom.Document")
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

local TimeLastModifiedView = {}
TimeLastModifiedView.__index = TimeLastModifiedView
TimeLastModifiedView.className = "TimeLastModifiedView"

function TimeLastModifiedView:_init_fields()
    self.timeLastModified = nil
end

function TimeLastModifiedView.new(...)
    local count = select("#", ...)
    if count == 1 then return TimeLastModifiedView._new1(...)
    elseif count == 1 then return TimeLastModifiedView._new1(...)
    end
end


function TimeLastModifiedView._new1(timeLastModified)
    local self = setmetatable({}, TimeLastModifiedView)
    self:_init_fields()
        self:setTimeLastModified(timeLastModified)
    return self
end


function TimeLastModifiedView._new1(node)
    local self = setmetatable({}, TimeLastModifiedView)
    self:_init_fields()
        self:setTimeLastModified(TimeLastModified.new(DomNodeHelper.getTextNodeValue(node)))
    return self
end


-- throws Exception
function TimeLastModifiedView:toXmlNode(document)
        return ModDomHelper.createTextNode(document, EntryData.getInstance().TIMECREATED, tostring(self:getTimeLastModified()))
end


function TimeLastModifiedView:getTimeLastModified()
        return self.timeLastModified
end


function TimeLastModifiedView:setTimeLastModified(timeLastModified)
        self.timeLastModified = timeLastModified
end

return TimeLastModifiedView

