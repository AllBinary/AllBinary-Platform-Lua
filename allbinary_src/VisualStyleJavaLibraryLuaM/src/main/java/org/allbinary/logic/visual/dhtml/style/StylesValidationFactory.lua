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
-- package org.allbinary.logic.visual.dhtml.style

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local NameSpaceRequestParamData = require("org.allbinary.logic.communication.http.request.NameSpaceRequestParamData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CssElementData = require("org.allbinary.logic.visual.dhtml.style.css.CssElementData")
local CssElementsValidationFactory = require("org.allbinary.logic.visual.dhtml.style.css.CssElementsValidationFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
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

local StylesValidationFactory = {}
StylesValidationFactory.__index = StylesValidationFactory
StylesValidationFactory.className = "StylesValidationFactory"

function StylesValidationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StylesValidationFactory.getInstance()
        return StylesValidationFactory.instance
end


function StylesValidationFactory.new()
    local self = setmetatable({}, StylesValidationFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function StylesValidationFactory:getInstance(document)
        local commonStrings = CommonStrings.getInstance()
        local nodeList = document:getElementsByTagName(StylesData.getInstance().NAME)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Style Present: " .. XmlDocumentHelper.toString(document), self, commonStrings.GET_INSTANCE)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Styles Present: " .. tostring(nodeList:getLength()), self, commonStrings.GET_INSTANCE)
        end
        for index = 0, nodeList:getLength() - 1 do
            local stylesNode = nodeList:item(index)
            local styleNodeList = DomSearchHelper.getAllNodes(StyleData.getInstance().NAME, stylesNode:getChildNodes())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Number Of Style Nodes Present: " .. tostring(styleNodeList:size()), self, commonStrings.GET_INSTANCE)
            end
            for styleNodesIndex = 0, styleNodeList:size() - 1 do
                local styleNode = styleNodeList:get(styleNodesIndex)
                local cssElementStyleNodeList = DomSearchHelper.getAllNodes(CssElementData.getInstance().NAME, styleNode:getChildNodes())
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("Number Of Element Nodes Present: " .. tostring(cssElementStyleNodeList:size()), self, commonStrings.GET_INSTANCE)
                end
                return CssElementsValidationFactory.getInstance(cssElementStyleNodeList)
            end
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("No Style Present", self, commonStrings.GET_INSTANCE)
        end
        return BasicArrayListD.new()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function StylesValidationFactory.getInstance(hashMap)
        local stylesDocument = hashMap:get(NameSpaceRequestParamData.DOCUMENT)
        return StylesValidationFactory.getInstance():getInstance(stylesDocument)
end

StylesValidationFactory.instance = StylesValidationFactory.new()

return StylesValidationFactory

