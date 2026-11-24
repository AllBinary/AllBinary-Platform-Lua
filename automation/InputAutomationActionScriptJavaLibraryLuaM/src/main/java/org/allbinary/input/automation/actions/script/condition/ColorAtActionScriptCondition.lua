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

local ColorAtActionScriptCondition = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition"] = ColorAtActionScriptCondition

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Color = require("java.awt.Color")
-- local Point = require("java.awt.Point")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local HashMap = java_lazy("java.util.HashMap")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local ColorCacheFactory = java_lazy("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = java_lazy("org.allbinary.graphics.color.ColorCacheable")
local CapturedBufferedImagesCacheSingleton = java_lazy("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local ColorRange = java_lazy("org.allbinary.media.image.analysis.ColorRange")
local ColorRangeInterface = java_lazy("org.allbinary.media.image.analysis.ColorRangeInterface")
local BufferedImageFrameCacheable = java_lazy("org.allbinary.media.image.cache.BufferedImageFrameCacheable")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local BasicProfileActionScriptCondition = require("org.allbinary.input.automation.actions.script.condition.BasicProfileActionScriptCondition")
local ColorAtActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionInterface")
local ColorAtActionScriptConditionData = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionData")
local ColorAtActionScriptConditionJPanel = java_lazy("org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptConditionJPanel")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ColorAtActionScriptCondition is declared before the requires
ColorAtActionScriptCondition.__index = ColorAtActionScriptCondition
ColorAtActionScriptCondition.className = "ColorAtActionScriptCondition"
ColorAtActionScriptCondition.javaClassName = "org.allbinary.input.automation.actions.script.condition.ColorAtActionScriptCondition"
setmetatable(ColorAtActionScriptCondition, {__index = BasicProfileActionScriptCondition})
ColorAtActionScriptCondition.java_implements = " ColorAtActionScriptConditionInterface "
ColorAtActionScriptCondition.java_interfaces = function() return {ColorAtActionScriptConditionInterface} end

function ColorAtActionScriptCondition:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.colorAtActionScriptConditionJPanel == nil then self.colorAtActionScriptConditionJPanel = nil end
    if self.point == nil then self.point = nil end
    self.colorRangeInterface = ColorRange.new()
end

function ColorAtActionScriptCondition._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return ColorAtActionScriptCondition._new1(self, ...)
    elseif count == 0 then return ColorAtActionScriptCondition._new0(self, ...)
    end
    error("No constructor of ColorAtActionScriptCondition takes " .. count .. " arguments")
end

function ColorAtActionScriptCondition.new(...)
    local self = setmetatable({}, ColorAtActionScriptCondition)
    ColorAtActionScriptCondition._jinit(self, ...)
    return self
end


function ColorAtActionScriptCondition._new1(self, node)
    java_super_init(BasicProfileActionScriptCondition, self, ColorAtActionScriptCondition.NAME, node)
    ColorAtActionScriptCondition._init_fields(self)
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
                    local string_ = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMinRed(tostring(string_))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MAX_RED) == 0 then
                    local string_ = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMaxRed(tostring(string_))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MIN_GREEN) == 0 then
                    local string_ = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMinGreen(tostring(string_))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MAX_GREEN) == 0 then
                    local string_ = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMaxGreen(tostring(string_))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MIN_BLUE) == 0 then
                    local string_ = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMinBlue(tostring(string_))
                elseif childNode:getNodeName():compareTo(ColorAtActionScriptConditionData.MAX_BLUE) == 0 then
                    local string_ = DomNodeHelper.getTextNodeValue(childNode)
                    self:getColorRangeInterface():setMaxBlue(tostring(string_))
                end
            end
        else
            error(require("java.lang.Exception").new("Color At Action Script Condition Node Null"), 0)
        end
        self:init()
    return self
end


function ColorAtActionScriptCondition._new0(self)
    java_super_init(BasicProfileActionScriptCondition, self, ColorAtActionScriptCondition.NAME)
    ColorAtActionScriptCondition._init_fields(self)
        -- super(...) made self above
        self.point = Point.new(0, 0)
        self:init()
    return self
end


function ColorAtActionScriptCondition:init()
        self.colorAtActionScriptConditionJPanel = ColorAtActionScriptConditionJPanel.new(self)
end
java_overload(ColorAtActionScriptCondition, "init", 0)


function ColorAtActionScriptCondition:getPoint()
        return self.point
end
java_overload(ColorAtActionScriptCondition, "getPoint", 0)


function ColorAtActionScriptCondition:setPoint(point)
        self.point = point
end
java_overload(ColorAtActionScriptCondition, "setPoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Point")) end)


function ColorAtActionScriptCondition:showDialog()
        self.colorAtActionScriptConditionJPanel:getColorAtActionJDialog():setVisible(true)
end
java_overload(ColorAtActionScriptCondition, "showDialog", 0)


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
java_overload(ColorAtActionScriptCondition, "toHashMap", 0)


-- throws Exception
function ColorAtActionScriptCondition:toXmlNode(document)
        local node = java_super(BasicProfileActionScriptCondition, "toXmlNode", 1)(self, document)
        node:appendChild(ModDomHelper.createNodeWithValueNodes(document, ColorAtActionScriptConditionData.NAME, self:toHashMap()))
        return node
end
java_overload(ColorAtActionScriptCondition, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function ColorAtActionScriptCondition:shouldProcess(frame)
        local capturedBufferedImageCacheable = (CapturedBufferedImagesCacheSingleton.getInstance()):get(tostring(frame))
        local bufferedImage = capturedBufferedImageCacheable:getBufferedImage()
        local automaticCacheInterface = ColorCacheFactory.getInstance()
        local colorInteger = tostring(bufferedImage:getRGB(self:getPoint().x, self:getPoint().y))
        local colorCacheable = automaticCacheInterface:get(colorInteger)
        local color = colorCacheable:getColor()
        if self.colorRangeInterface:isInRange(color) then
            return java_super(BasicProfileActionScriptCondition, "shouldProcess", 1)(self, frame)
        end
        return false
end
java_overload(ColorAtActionScriptCondition, "shouldProcess", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ColorAtActionScriptCondition:log()
        local message = tostring(StringMaker.new():append("getPoint(): "):append(tostring(self:getPoint())):append(CommonSeps.getInstance().NEW_LINE):append(tostring(self:getColorRangeInterface())))
        self.logUtil:putF(message, self, "log")
end
java_overload(ColorAtActionScriptCondition, "log", 0)


function ColorAtActionScriptCondition:getColorRangeInterface()
        return self.colorRangeInterface
end
java_overload(ColorAtActionScriptCondition, "getColorRangeInterface", 0)


function ColorAtActionScriptCondition:setColorRangeInterface(colorRangeInterface)
        self.colorRangeInterface = colorRangeInterface
end
java_overload(ColorAtActionScriptCondition, "setColorRangeInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ColorRangeInterface")) end)

ColorAtActionScriptCondition.NAME = "If Color At"

return ColorAtActionScriptCondition

