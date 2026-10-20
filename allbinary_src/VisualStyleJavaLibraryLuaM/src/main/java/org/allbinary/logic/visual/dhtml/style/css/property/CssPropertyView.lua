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

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local CssPropertyView = {}
CssPropertyView.__index = CssPropertyView
CssPropertyView.className = "CssPropertyView"

function CssPropertyView:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.cssProperty = nil
end

function CssPropertyView.new(...)
    local count = select("#", ...)
    if count == 1 then return CssPropertyView._new1(...)
    elseif count == 1 then return CssPropertyView._new1(...)
    end
end


function CssPropertyView._new1(name)
    local self = setmetatable({}, CssPropertyView)
    self:_init_fields()
        self.cssProperty = CssProperty.new(name)
    return self
end


function CssPropertyView._new1(node)
    local self = setmetatable({}, CssPropertyView)
    self:_init_fields()
        self.cssProperty = CssProperty.new(node)
    return self
end


function CssPropertyView:getProperty()
        return self.cssProperty
end


-- throws Exception
function CssPropertyView:toXmlNode(document)
        return self.cssProperty:toXmlNode(document)
end

return CssPropertyView

