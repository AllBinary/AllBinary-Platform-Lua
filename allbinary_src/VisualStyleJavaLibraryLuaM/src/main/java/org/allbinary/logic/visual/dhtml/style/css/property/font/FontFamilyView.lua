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
-- package org.allbinary.logic.visual.dhtml.style.css.property.font

local CssPropertyView = require("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyView")
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

local FontFamilyView = {}
FontFamilyView.__index = FontFamilyView
FontFamilyView.className = "FontFamilyView"
setmetatable(FontFamilyView, {__index = CssPropertyView})

function FontFamilyView.new(...)
    local count = select("#", ...)
    if count == 0 then return FontFamilyView._new0(...)
    elseif count == 1 then return FontFamilyView._new1(...)
    end
end


function FontFamilyView._new0()
    local self = setmetatable(CssPropertyView.new(FontFamilyData.getInstance().VALUE), FontFamilyView)
        -- super(...) made self above
    return self
end


function FontFamilyView._new1(node)
    local self = setmetatable(CssPropertyView.new(node), FontFamilyView)
        -- super(...) made self above
    return self
end

return FontFamilyView

