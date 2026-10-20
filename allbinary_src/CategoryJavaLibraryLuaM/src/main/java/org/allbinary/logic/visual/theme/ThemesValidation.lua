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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
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

local ThemesValidation = {}
ThemesValidation.__index = ThemesValidation
ThemesValidation.className = "ThemesValidation"
setmetatable(ThemesValidation, {__index = Validation})

function ThemesValidation:_init_fields()
    self.themeVector = nil
end

function ThemesValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return ThemesValidation._new0(...)
    elseif count == 1 then return ThemesValidation._new1(...)
    elseif count == 1 then return ThemesValidation._new1(...)
    end
end


function ThemesValidation._new0()
    local self = setmetatable(Validation.new(), ThemesValidation)
    self:_init_fields()
        self.themeVector = BasicArrayListD.new()
    return self
end


function ThemesValidation._new1(node)
    local self = setmetatable(Validation.new(), ThemesValidation)
    self:_init_fields()
    return self
end


function ThemesValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), ThemesValidation)
    self:_init_fields()
    return self
end


function ThemesValidation:isValid()
        return true
end


function ThemesValidation:validationInfo()
        return nil
end


function ThemesValidation:toValidationInfoDoc()
        return nil
end


function ThemesValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function ThemesValidation:toXmlNode(document)
        local node = document:createElement(ThemesData.getInstance().NAME)
        local size = self.themeVector:size()
        for i = 0, size - 1 do
            local themeDomNodeInterface = self.themeVector:get(i)
            node:appendChild(themeDomNodeInterface:toXmlNode(document))
        end
        return node
end

return ThemesValidation

