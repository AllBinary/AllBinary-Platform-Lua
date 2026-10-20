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

local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local FontFamilyValidation = require("org.allbinary.logic.visual.dhtml.style.css.property.font.FontFamilyValidation")
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

local CssPropertyValidationFactory = {}
CssPropertyValidationFactory.__index = CssPropertyValidationFactory
CssPropertyValidationFactory.className = "CssPropertyValidationFactory"


function CssPropertyValidationFactory.new()
    local self = setmetatable({}, CssPropertyValidationFactory)
    return self
end


-- throws Exception
function CssPropertyValidationFactory.getInstance(node)
        return FontFamilyValidation.new(node)
end

return CssPropertyValidationFactory

