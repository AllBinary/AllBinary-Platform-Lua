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
-- package org.allbinary.business.time.created

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

local TimeCreatedView = {}
TimeCreatedView.__index = TimeCreatedView
TimeCreatedView.className = "TimeCreatedView"

function TimeCreatedView:_init_fields()
    self.timeCreated = nil
end

function TimeCreatedView.new(...)
    local count = select("#", ...)
    if count == 1 then return TimeCreatedView._new1(...)
    elseif count == 1 then return TimeCreatedView._new1(...)
    end
end


function TimeCreatedView._new1(timeCreated)
    local self = setmetatable({}, TimeCreatedView)
    self:_init_fields()
        self:setTimeCreated(timeCreated)
    return self
end


function TimeCreatedView._new1(node)
    local self = setmetatable({}, TimeCreatedView)
    self:_init_fields()
        self:setTimeCreated(TimeCreated.new(DomNodeHelper.getTextNodeValue(node)))
    return self
end


-- throws Exception
function TimeCreatedView:toXmlNode(document)
        return ModDomHelper.createTextNode(document, EntryData.getInstance().TIMECREATED, tostring(self:getTimeCreated()))
end


function TimeCreatedView:getTimeCreated()
        return self.timeCreated
end


function TimeCreatedView:setTimeCreated(timeCreated)
        self.timeCreated = timeCreated
end

return TimeCreatedView

