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
-- package org.allbinary.input.automation.actions.script.condition

-- local Color = require("java.awt.Color")
-- local Point = require("java.awt.Point")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local HashMap = require("java.util.HashMap")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local ColorCacheFactory = require("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = require("org.allbinary.graphics.color.ColorCacheable")
local CapturedBufferedImagesCacheSingleton = require("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local ColorRange = require("org.allbinary.media.image.analysis.ColorRange")
local ColorRangeInterface = require("org.allbinary.media.image.analysis.ColorRangeInterface")
local BufferedImageFrameCacheable = require("org.allbinary.media.image.cache.BufferedImageFrameCacheable")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local BasicProfileActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition")
local ColorAtActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionInterface")

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

local ColorAtActionScriptCondition = {}
ColorAtActionScriptCondition.__index = ColorAtActionScriptCondition
ColorAtActionScriptCondition.className = "ColorAtActionScriptCondition"
setmetatable(ColorAtActionScriptCondition, {__index = BasicProfileActionScriptCondition})

function ColorAtActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.colorAtActionScriptConditionJPanel = nil
    self.point = nil
    self.colorRangeInterface = ColorRange.new()
end

function ColorAtActionScriptCondition.new(...)
    local count = select("#", ...)
    if count == 1 then return ColorAtActionScriptCondition._new1(...)
    elseif count == 0 then return ColorAtActionScriptCondition._new0(...)
    end
end


function ColorAtActionScriptCondition._new1(node)
    local self = setmetatable(BasicProfileActionScriptCondition.new(ColorAtActionScriptCondition.NAME, node), ColorAtActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        self.point = Point.new(0, 0)
        local actionNode = DomSearchHelper.getNode(ColorAtActionScriptConditionData.NAME, node:getChildNodes())
        if actionNode ~= nil then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.LOCATION_X) == 0 then
                    local locationX = DomNodeHelper.getTextNodeValue(childNode)
                    self.point.x = tostring(locationX)
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.LOCATION_Y) == 0 then
                    local locationY = DomNodeHelper.getTextNodeValue(childNode)
                    self.point.y = tostring(locationY)
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MIN_RED) == 0 then
                    local string = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMinRed(tostring(string))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MAX_RED) == 0 then
                    local string = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMaxRed(tostring(string))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MIN_GREEN) == 0 then
                    local string = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMinGreen(tostring(string))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MAX_GREEN) == 0 then
                    local string = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMaxGreen(tostring(string))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MIN_BLUE) == 0 then
                    local string = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMinBlue(tostring(string))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MAX_BLUE) == 0 then
                    local string = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMaxBlue(tostring(string))
                end
            end
        else
            error(java_exception("Exception", "Color At Action Script Condition Node Null"), 0)
        end
        self:init()
    return self
end


function ColorAtActionScriptCondition._new0()
    local self = setmetatable(BasicProfileActionScriptCondition.new(ColorAtActionScriptCondition.NAME), ColorAtActionScriptCondition)
    self:_init_fields()
        -- super(...) made self above
        self.point = Point.new(0, 0)
        self:init()
    return self
end


function ColorAtActionScriptCondition:init()
        self.colorAtActionScriptConditionJPanel = ColorAtActionScriptConditionJPanel.new(self)
end


function ColorAtActionScriptCondition:getPoint()
        return self.point
end


function ColorAtActionScriptCondition:setPoint(point)
        self.point = point
end


function ColorAtActionScriptCondition:showDialog()
        self.colorAtActionScriptConditionJPanel:getColorAtActionJDialog():setVisible(true)
end


function ColorAtActionScriptCondition:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(ColorAtActionScriptConditionData.LOCATION_X, tostring(self:getPoint().x))
        hashMap:put(ColorAtActionScriptConditionData.LOCATION_Y, tostring(self:getPoint().y))
        hashMap:put(ColorAtActionScriptConditionData.MIN_RED, tostring(self:getColorRangeInterface():getMinRed()))
        hashMap:put(ColorAtActionScriptConditionData.MAX_RED, tostring(self:getColorRangeInterface():getMaxRed()))
        hashMap:put(ColorAtActionScriptConditionData.MIN_GREEN, tostring(self:getColorRangeInterface():getMinGreen()))
        hashMap:put(ColorAtActionScriptConditionData.MAX_GREEN, tostring(self:getColorRangeInterface():getMaxGreen()))
        hashMap:put(ColorAtActionScriptConditionData.MIN_BLUE, tostring(self:getColorRangeInterface():getMinBlue()))
        hashMap:put(ColorAtActionScriptConditionData.MAX_BLUE, tostring(self:getColorRangeInterface():getMaxBlue()))
        self.logUtil:putF("HashMap: " .. tostring(hashMap), self, "toHashMap()")
        return hashMap
end


-- throws Exception
function ColorAtActionScriptCondition:toXmlNode(document)
        local node = BasicProfileActionScriptCondition.toXmlNode(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, ColorAtActionScriptConditionData.NAME, self:toHashMap()))
        return node
end


-- throws Exception
function ColorAtActionScriptCondition:shouldProcess(frame)
        local capturedBufferedImageCacheable = (CapturedBufferedImagesCacheSingleton.getInstance()):get(tostring(frame))
        local bufferedImage = capturedBufferedImageCacheable:getBufferedImage()
        local automaticCacheInterface = ColorCacheFactory.getInstance()
        local colorInteger = tostring(bufferedImage:getRGB(self:getPoint().x, self:getPoint().y))
        local colorCacheable = automaticCacheInterface:get(colorInteger)
        local color = colorCacheable:getColor()
        if self.colorRangeInterface:isInRange(color) then
            return BasicProfileActionScriptCondition.shouldProcess(self, frame)
        end
        return false
end


function ColorAtActionScriptCondition:log()
        local message = tostring(StringMaker.new():append("getPoint(): "):append(tostring(self:getPoint())):append(CommonSeps.getInstance().NEW_LINE):append(tostring(self:getColorRangeInterface())))
        self.logUtil:putF(message, self, "log")
end


function ColorAtActionScriptCondition:getColorRangeInterface()
        return self.colorRangeInterface
end


function ColorAtActionScriptCondition:setColorRangeInterface(colorRangeInterface)
        self.colorRangeInterface = colorRangeInterface
end

ColorAtActionScriptCondition.NAME = "If Color At"

return ColorAtActionScriptCondition

