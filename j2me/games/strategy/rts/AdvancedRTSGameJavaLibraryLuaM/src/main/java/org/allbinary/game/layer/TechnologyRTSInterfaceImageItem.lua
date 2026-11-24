-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer

local TechnologyRTSInterfaceImageItem = {}
package.loaded["org.allbinary.game.layer.TechnologyRTSInterfaceImageItem"] = TechnologyRTSInterfaceImageItem

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local ABCustomImageItem = require("org.allbinary.graphics.form.item.ABCustomImageItem")
local CharArrayFactory = java_lazy("org.allbinary.logic.java.character.CharArrayFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local PrimitiveLongUtil = java_lazy("org.allbinary.logic.math.PrimitiveLongUtil")

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

-- class table TechnologyRTSInterfaceImageItem is declared before the requires
TechnologyRTSInterfaceImageItem.__index = TechnologyRTSInterfaceImageItem
TechnologyRTSInterfaceImageItem.className = "TechnologyRTSInterfaceImageItem"
TechnologyRTSInterfaceImageItem.javaClassName = "org.allbinary.game.layer.TechnologyRTSInterfaceImageItem"
setmetatable(TechnologyRTSInterfaceImageItem, {__index = ABCustomImageItem})
TechnologyRTSInterfaceImageItem.java_implements = " UpdateMyFontInterface "
TechnologyRTSInterfaceImageItem.java_interfaces = function() return {UpdateMyFontInterface} end

function TechnologyRTSInterfaceImageItem:_init_fields()
    if self.rtsInterface == nil then self.rtsInterface = nil end
    self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000)
    self.LEVEL = "Level"
    self.COST = "Cost"
    self.DOLLAR = "$"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.costString = CharArrayFactory.getInstance():getZeroCharArray()
    if self.costLength == nil then self.costLength = 0 end
    self.levelString = CharArrayFactory.getInstance():getZeroCharArray()
    if self.levelLength == nil then self.levelLength = 0 end
    if self.adjustedCostLabelY == nil then self.adjustedCostLabelY = 0 end
    if self.adjustedCostX == nil then self.adjustedCostX = 0 end
    if self.adjustedCostY == nil then self.adjustedCostY = 0 end
    if self.adjustedLevelX == nil then self.adjustedLevelX = 0 end
    if self.adjustedLevelY == nil then self.adjustedLevelY = 0 end
end


function TechnologyRTSInterfaceImageItem._jinit(self, label, img, layout, altText, basicColor, rtsInterface)
    java_super_init(ABCustomImageItem, self, label, img, layout, altText, basicColor, 0)
    TechnologyRTSInterfaceImageItem._init_fields(self)
        -- super(...) made self above
        self.rtsInterface = rtsInterface
        self:update()
    return self
end

function TechnologyRTSInterfaceImageItem.new(...)
    local self = setmetatable({}, TechnologyRTSInterfaceImageItem)
    TechnologyRTSInterfaceImageItem._jinit(self, ...)
    return self
end


function TechnologyRTSInterfaceImageItem:updateMeasurement(graphics)
        local font = graphics:getFont()
        local fontHeight = font:getHeight()
        local imageHeight = 0
        local image = self:getImage()
        if image ~= NullImage.NULL_IMAGE then
            imageHeight = image:getHeight()
        end
        self.adjustedCostLabelY = -self.yOffset + imageHeight - (3 * fontHeight)
        self.adjustedCostY = -self.yOffset + imageHeight - (2 * fontHeight)
        self.adjustedCostX = 2 + (#self.DOLLAR * (fontHeight - 1))
        self.adjustedLevelY = -self.yOffset + imageHeight - fontHeight
        self.adjustedLevelX = 2 + (#self.LEVEL * (fontHeight - 1))
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(TechnologyRTSInterfaceImageItem, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function TechnologyRTSInterfaceImageItem:getRtsInterface()
        return self.rtsInterface
end
java_overload(TechnologyRTSInterfaceImageItem, "getRtsInterface", 0)


function TechnologyRTSInterfaceImageItem:update()
        self.costString = self.primitiveLongUtil:getCharArray(self:getRtsInterface():getUpgradeCost())
        self.levelString = self.primitiveLongUtil:getCharArray(self:getRtsInterface():getLevel())
end
java_overload(TechnologyRTSInterfaceImageItem, "update", 0)


function TechnologyRTSInterfaceImageItem:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        java_super(ABCustomImageItem, "paintXY", 3)(self, graphics, x, y)
        local xa = x + 2
        graphics:drawString(self.COST, xa, y + self.adjustedCostLabelY, 0)
        graphics:drawString(self.DOLLAR, xa, y + self.adjustedCostY, 0)
        graphics:drawChars(self.costString, 0, self.costLength, x + self.adjustedCostX, y + self.adjustedCostY, 0)
        graphics:drawString(self.LEVEL, xa, y + self.adjustedLevelY, 0)
        graphics:drawChars(self.levelString, 0, self.levelLength, x + self.adjustedLevelX, y + self.adjustedLevelY, 0)
end
java_overload(TechnologyRTSInterfaceImageItem, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return TechnologyRTSInterfaceImageItem

