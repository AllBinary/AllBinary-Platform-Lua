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
-- package org.allbinary.layer

local AllBinaryLayer = {}
package.loaded["org.allbinary.layer.AllBinaryLayer"] = AllBinaryLayer

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicGroupFactory = java_lazy("org.allbinary.game.identification.BasicGroupFactory")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local ViewPositionEvent = java_lazy("org.allbinary.view.event.ViewPositionEvent")
local Layer = require("org.allbinary.layer.Layer")
local LayerInterface = require("org.allbinary.layer.LayerInterface")

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

-- class table AllBinaryLayer is declared before the requires
AllBinaryLayer.__index = AllBinaryLayer
AllBinaryLayer.className = "AllBinaryLayer"
AllBinaryLayer.javaClassName = "org.allbinary.layer.AllBinaryLayer"
setmetatable(AllBinaryLayer, {__index = Layer})
AllBinaryLayer.java_implements = " LayerInterface "
AllBinaryLayer.java_interfaces = function() return {LayerInterface} end

function AllBinaryLayer:_init_fields()
    self.viewPositionEvent = ViewPositionEvent.new(self)
    if self.halfWidth == nil then self.halfWidth = 0 end
    if self.halfHeight == nil then self.halfHeight = 0 end
    if self.name_f == nil then self.name_f = nil end
    self.viewPosition = ViewPositionBase.NULL_VIEW_POSITION
end


function AllBinaryLayer._jinit(self, name, rectangle, viewPosition)
    java_super_init(Layer, self, rectangle:getWidth(), rectangle:getHeight())
    AllBinaryLayer._init_fields(self)
        -- super(...) made self above
        local localName = nil
        localName = tostring(StringMaker.new():append(name):append(CommonSeps.getInstance().COLON):append(string.format("%x", TsUtil.getInstance():hashCode(self))))
        self.name_f = localName
        local point = rectangle:getPoint()
        self:setPosition(point:getX(), point:getY(), point:getZ())
        self:setHalfWidth((((self:getWidth()) // (1 << (1)))))
        self:setHalfHeight((((self:getHeight()) // (1 << (1)))))
        self.viewPosition = viewPosition
        self.viewPosition:setAllbinaryLayer(self)
    return self
end

function AllBinaryLayer.new(...)
    local self = setmetatable({}, AllBinaryLayer)
    AllBinaryLayer._jinit(self, ...)
    return self
end


function AllBinaryLayer:setPosition(x, y, z)
        java_super(Layer, "setPosition", 3)(self, x, y, z)
end
java_overload(AllBinaryLayer, "setPosition", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function AllBinaryLayer:moveDXYZ(dx, dy, dz)
        java_super(Layer, "moveDXYZ", 3)(self, dx, dy, dz)
end
java_overload(AllBinaryLayer, "moveDXYZ", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function AllBinaryLayer:getXP()
        return java_super(Layer, "getXP", 0)(self)
end
java_overload(AllBinaryLayer, "getXP", 0)


function AllBinaryLayer:getYP()
        return java_super(Layer, "getYP", 0)(self)
end
java_overload(AllBinaryLayer, "getYP", 0)


function AllBinaryLayer:getZP()
        return java_super(Layer, "getZP", 0)(self)
end
java_overload(AllBinaryLayer, "getZP", 0)


function AllBinaryLayer:getWidth()
        return java_super(Layer, "getWidth", 0)(self)
end
java_overload(AllBinaryLayer, "getWidth", 0)


function AllBinaryLayer:getHeight()
        return java_super(Layer, "getHeight", 0)(self)
end
java_overload(AllBinaryLayer, "getHeight", 0)


function AllBinaryLayer:setVisible(visible)
        java_super(Layer, "setVisible", 1)(self, visible)
end
java_overload(AllBinaryLayer, "setVisible", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function AllBinaryLayer:isVisible()
        return java_super(Layer, "isVisible", 0)(self)
end
java_overload(AllBinaryLayer, "isVisible", 0)


function AllBinaryLayer:paint(graphics)
        java_super(Layer, "paint", 1)(self, graphics)
end
java_overload(AllBinaryLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function AllBinaryLayer:onChangeEvent(layerManagerEvent)
end
java_overload(AllBinaryLayer, "onChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ViewPositionEvent")) end)


function AllBinaryLayer:paintThreed(graphics)
end
java_overload(AllBinaryLayer, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryLayer:getX2()
        return self:getXP() + self:getWidth()
end
java_overload(AllBinaryLayer, "getX2", 0)


function AllBinaryLayer:getY2()
        return self:getYP() + self:getHeight()
end
java_overload(AllBinaryLayer, "getY2", 0)


function AllBinaryLayer:getZ2()
        return java_int((self:getZP() + self:getDepth()))
end
java_overload(AllBinaryLayer, "getZ2", 0)


function AllBinaryLayer:getName()
        return self.name_f
end
java_overload(AllBinaryLayer, "getName", 0)


function AllBinaryLayer:setHalfWidth(halfWidth)
        self.halfWidth = halfWidth
end
java_overload(AllBinaryLayer, "setHalfWidth", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryLayer:getHalfWidth()
        return self.halfWidth
end
java_overload(AllBinaryLayer, "getHalfWidth", 0)


function AllBinaryLayer:setHalfHeight(halfHeight)
        self.halfHeight = halfHeight
end
java_overload(AllBinaryLayer, "setHalfHeight", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryLayer:getHalfHeight()
        return self.halfHeight
end
java_overload(AllBinaryLayer, "getHalfHeight", 0)


function AllBinaryLayer:getHalfDepth()
        return java_idiv(java_int(self:getDepth()), 2)
end
java_overload(AllBinaryLayer, "getHalfDepth", 0)


function AllBinaryLayer:getViewPosition()
        return self.viewPosition
end
java_overload(AllBinaryLayer, "getViewPosition", 0)


function AllBinaryLayer:setViewPosition(viewPosition)
        self.viewPosition = viewPosition
end
java_overload(AllBinaryLayer, "setViewPosition", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ViewPositionBase")) end)


function AllBinaryLayer:getGroupInterface()
        return BasicGroupFactory.getInstance().NONE_ARRAY
end
java_overload(AllBinaryLayer, "getGroupInterface", 0)


function AllBinaryLayer:implmentsTickableInterface()
        return false
end
java_overload(AllBinaryLayer, "implmentsTickableInterface", 0)


function AllBinaryLayer:implmentsGameInputInterface()
        return false
end
java_overload(AllBinaryLayer, "implmentsGameInputInterface", 0)


function AllBinaryLayer:implmentsArtificialIntelligenceCompositeInterface()
        return false
end
java_overload(AllBinaryLayer, "implmentsArtificialIntelligenceCompositeInterface", 0)


function AllBinaryLayer:implmentsCollidableInterface()
        return false
end
java_overload(AllBinaryLayer, "implmentsCollidableInterface", 0)


function AllBinaryLayer:implementsThreedInterface()
        return OpenGLFeatureUtil.getInstance():isAnyThreed()
end
java_overload(AllBinaryLayer, "implementsThreedInterface", 0)


function AllBinaryLayer:getType()
        return -1
end
java_overload(AllBinaryLayer, "getType", 0)


function AllBinaryLayer:getMultiPlayerType()
        return -1
end
java_overload(AllBinaryLayer, "getMultiPlayerType", 0)


function AllBinaryLayer:toStringAppend(stringBuffer)
        local commonSeps = CommonSeps.getInstance()
        local positionStrings = PositionStrings.getInstance()
        local commonLabels = CommonLabels.getInstance()
        stringBuffer:append(self:getName())
        stringBuffer:append(commonSeps.COLON)
        stringBuffer:append(AllBinaryLayer.TYPE)
        stringBuffer:appendint(self:getType())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:appendint(self:getXP())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:appendint(self:getYP())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:appendint(self:getZP())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(self:getWidth())
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(self:getHeight())
end
java_overload(AllBinaryLayer, "toStringAppend", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StringMaker")) end)


function AllBinaryLayer:toString()
        local stringBuffer = StringMaker.new()
        self:toStringAppend(stringBuffer)
        return tostring(stringBuffer)
end
java_overload(AllBinaryLayer, "toString", 0)
AllBinaryLayer.__tostring = function(self) return self:toString() end

AllBinaryLayer.NULL_ALLBINARY_LAYER = AllBinaryLayer.new(StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION)
AllBinaryLayer.TYPE = "Type: "

return AllBinaryLayer

