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
-- package org.allbinary.logic.visual.dhtml.style.css

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CssPropertiesValidationFactory = require("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertiesValidationFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local CssElementView = {}
CssElementView.__index = CssElementView
CssElementView.className = "CssElementView"

function CssElementView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TITLE = "title"
    self.DESCRIPTION = "description"
    self.value = nil
    self.title = nil
    self.description = nil
    self.cssElementVector = nil
    self.cssPropertyVector = nil
end

function CssElementView.new(...)
    local count = select("#", ...)
    if count == 0 then return CssElementView._new0(...)
    elseif count == 1 then return CssElementView._new1(...)
    end
end


function CssElementView._new0()
    local self = setmetatable({}, CssElementView)
    self:_init_fields()
        self.cssPropertyVector = BasicArrayListD.new()
        local stringUtil = StringUtil.getInstance()
        self.title = stringUtil.EMPTY_STRING
        self.description = stringUtil.EMPTY_STRING
        self.value = stringUtil.EMPTY_STRING
    return self
end


function CssElementView._new1(node)
    local self = setmetatable({}, CssElementView)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local valueNode = DomSearchHelper.getNode(DomData.VALUE, node:getChildNodes())
            self.value = DomNodeHelper.getTextNodeValue(valueNode)
            local titleValueNode = DomSearchHelper.getNodeNoThrow(self.TITLE, node:getChildNodes())
            if titleValueNode ~= nil then
                self.title = DomNodeHelper.getTextNodeValue(titleValueNode)
            else
                local stringUtil = StringUtil.getInstance()
                self.title = stringUtil.EMPTY_STRING
            end
            local descriptionValueNode = DomSearchHelper.getNodeNoThrow(self.DESCRIPTION, node:getChildNodes())
            if descriptionValueNode ~= nil then
                self.description = DomNodeHelper.getTextNodeValue(descriptionValueNode)
            else
                self.description = StringUtil.getInstance().EMPTY_STRING
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(tostring(StringMaker.new():append("Value: "):append(self.value):append("\nTitle: "):append(self.title):append("\nDescription: "):append(self.description)), self, self.commonStrings.CONSTRUCTOR)
            end
            local cssElementStyleNodeVector = DomSearchHelper.getAllNodes(CssElementData.getInstance().NAME, node:getChildNodes())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Child Css Elements: " .. tostring(cssElementStyleNodeVector:size()), self, "CssElementView()")
            end
            self.cssElementVector = CssElementsValidationFactory.getInstance(cssElementStyleNodeVector)
            local nodeList = node:getChildNodes()
            self.cssPropertyVector = CssPropertiesValidationFactory.getInstance(nodeList)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(tostring(StringMaker.new():append("Value: "):append(self.value):append("\nTitle: "):append(self.title):append("\nDescription: "):append(self.description)), self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(java_exception("Exception", "CssElementView"), 0)
        end
    return self
end


function CssElementView:getValue()
        return self.value
end


function CssElementView:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(DomData.VALUE, self.value)
        hashMap:put(self.TITLE, self.title)
        hashMap:put(self.DESCRIPTION, self.description)
        return hashMap
end


-- throws Exception
function CssElementView:toXmlNode(document)
        local hashMap = self:toHashMap()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("CssView HashMap: " .. tostring(hashMap), self, "toXmlNode")
        end
        local node = ModDomHelper.createNodeWithValueNodes(document, CssElementData.getInstance().NAME, hashMap)
        local size = self.cssPropertyVector:size()
        for index = 0, size - 1 do
            local cssPropertyDomNodeInterface = self.cssPropertyVector:get(index)
            node:appendChild(cssPropertyDomNodeInterface:toXmlNode(document))
        end
        local size2 = self.cssElementVector:size()
        for index = 0, size2 - 1 do
            local cssElementDomNodeInterface = self.cssElementVector:get(index)
            node:appendChild(cssElementDomNodeInterface:toXmlNode(document))
        end
        return node
end

return CssElementView

