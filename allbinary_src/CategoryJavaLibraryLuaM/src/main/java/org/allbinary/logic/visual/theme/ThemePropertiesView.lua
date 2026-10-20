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
-- package org.allbinary.logic.visual.theme

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

local ThemePropertiesView = {}
ThemePropertiesView.__index = ThemePropertiesView
ThemePropertiesView.className = "ThemePropertiesView"

function ThemePropertiesView:_init_fields()
    self.themeInterface = nil
end


function ThemePropertiesView.new(themeInterface)
    local self = setmetatable({}, ThemePropertiesView)
    self:_init_fields()
        self.themeInterface = themeInterface
    return self
end


-- throws Exception
function ThemePropertiesView:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, ThemeData.getInstance().NAME, self.themeInterface:toHashMap())
        return node
end

return ThemePropertiesView

