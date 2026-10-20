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
-- package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local StyleData = require("org.allbinary.logic.visual.dhtml.style.StyleData")
local StylesData = require("org.allbinary.logic.visual.dhtml.style.StylesData")
local ColorsView = require("org.allbinary.logic.visual.dhtml.style.color.ColorsView")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CssStyleValidation = require("org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EditCssStyleValidation = {}
EditCssStyleValidation.__index = EditCssStyleValidation
EditCssStyleValidation.className = "EditCssStyleValidation"
setmetatable(EditCssStyleValidation, {__index = CssStyleValidation})

function EditCssStyleValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return EditCssStyleValidation._new0(...)
    elseif count == 1 then return EditCssStyleValidation._new1(...)
    elseif count == 1 then return EditCssStyleValidation._new1(...)
    end
end


function EditCssStyleValidation._new0()
    local self = setmetatable(CssStyleValidation.new(), EditCssStyleValidation)
    return self
end


function EditCssStyleValidation._new1(document)
    local self = setmetatable(CssStyleValidation.new(document), EditCssStyleValidation)
        -- super(...) made self above
    return self
end


function EditCssStyleValidation._new1(hashMap)
    local self = setmetatable(CssStyleValidation.new(hashMap), EditCssStyleValidation)
        -- super(...) made self above
    return self
end


function EditCssStyleValidation:isValid()
        return CssStyleValidation.isValid(self)
end


function EditCssStyleValidation:validationInfo()
        return CssStyleValidation.validationInfo(self)
end


function EditCssStyleValidation:toValidationInfoDoc()
        return nil
end


function EditCssStyleValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function EditCssStyleValidation:toXmlNode(document)
        local node = document:createElement(StylesData.getInstance().NAME)
        local styleNode = document:createElement(StyleData.getInstance().NAME)
        node:appendChild(styleNode)
        styleNode:appendChild(ColorsView.new():toXmlNode(document))
        local size = self.cssStyleElementVector:size()
        for i = 0, size - 1 do
            local styleDomNodeInterface = self.cssStyleElementVector:get(i)
            styleNode:appendChild(styleDomNodeInterface:toXmlNode(document))
        end
        return node
end

return EditCssStyleValidation

