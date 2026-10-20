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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.title

-- local HashMap = require("java.util.HashMap")
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
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

local TitleView = {}
TitleView.__index = TitleView
TitleView.className = "TitleView"

function TitleView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.title = nil
end

function TitleView.new(...)
    local count = select("#", ...)
    if count == 0 then return TitleView._new0(...)
    elseif count == 1 then return TitleView._new1(...)
    elseif count == 1 then return TitleView._new1(...)
    end
end


function TitleView._new0()
    local self = setmetatable({}, TitleView)
    self:_init_fields()
        self.title = TitleView.NAME
    return self
end


function TitleView._new1(node)
    local self = setmetatable({}, TitleView)
    self:_init_fields()
        local titleTextNode = DomSearchHelper.getNode(TitleData.getInstance().TEXT, node:getChildNodes())
        local valueNode = DomSearchHelper.getNode(DomData.VALUE, titleTextNode:getChildNodes())
        self.title = DomNodeHelper.getTextNodeValue(valueNode)
        if StringValidationUtil.getInstance():isEmpty(self.title) then
            self.title = TitleView.NAME
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Title: " .. tostring(self:getTitle()), self, "Consructor()")
        end
    return self
end


function TitleView._new1(hashMap)
    local self = setmetatable({}, TitleView)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("HashMap: " .. tostring(hashMap), self, self.commonStrings.CONSTRUCTOR)
        end
        self:getFormData(hashMap)
    return self
end


function TitleView:getTitle()
        return self.title
end


function TitleView:getFormData(hashMap)
        self.title = hashMap:get(TitleData.getInstance().TEXT)
        if StringValidationUtil.getInstance():isEmpty(self.title) then
            self.title = TitleView.NAME
        end
end


function TitleView:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(TitleData.getInstance().TEXT, self:getTitle())
        return hashMap
end


-- throws Exception
function TitleView:toXmlNode(document)
        local hashMap = self:toHashMap()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("TitleView HashMap: " .. tostring(hashMap), self, "toXmlNode()")
        end
        return ModDomHelper.createNameValueNodes(document, TitleData.getInstance().NAME, hashMap)
end

TitleView.NAME = "None"

return TitleView

