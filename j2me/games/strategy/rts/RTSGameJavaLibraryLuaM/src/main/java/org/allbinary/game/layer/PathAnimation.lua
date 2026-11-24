-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

local PathAnimation = {}
package.loaded["org.allbinary.game.layer.PathAnimation"] = PathAnimation

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
local Animation = require("org.allbinary.animation.Animation")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local LinePathAnimation = java_lazy("org.allbinary.game.layer.LinePathAnimation")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")

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

-- class table PathAnimation is declared before the requires
PathAnimation.__index = PathAnimation
PathAnimation.className = "PathAnimation"
PathAnimation.javaClassName = "org.allbinary.game.layer.PathAnimation"
setmetatable(PathAnimation, {__index = Animation})

function PathAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.linePathAnimation == nil then self.linePathAnimation = nil end
    if self.pathFindingLayer == nil then self.pathFindingLayer = nil end
    self.allBinaryGameLayerManagerP = AllBinaryGameLayerManager.getNullInstance()
    self.startColor = BasicColorFactory.getInstance().RED
    self.middleColor = BasicColorFactory.getInstance().BLUE
    self.endColor = BasicColorFactory.getInstance().GREEN
end


function PathAnimation._jinit(self, pathFindingLayer, linePathAnimation)
    java_super_init(Animation, self)
    PathAnimation._init_fields(self)
        self.pathFindingLayer = pathFindingLayer
        self.linePathAnimation = linePathAnimation
    return self
end

function PathAnimation.new(...)
    local self = setmetatable({}, PathAnimation)
    PathAnimation._jinit(self, ...)
    return self
end


-- throws Exception
function PathAnimation:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.allBinaryGameLayerManagerP = allBinaryGameLayerManager
end
java_overload(PathAnimation, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


-- throws Exception
function PathAnimation:nextFrame()
end
java_overload(PathAnimation, "nextFrame", 0)


function PathAnimation:paintXY(graphics, x, y)
        local try_ok, try_error, try_value = pcall(function()
            local waypointBehaviorBase = self.pathFindingLayer:getWaypointBehavior()
            if waypointBehaviorBase ~= nil then
                local geographicMapCellHistory = waypointBehaviorBase:getCurrentGeographicMapCellHistory()
                local list = geographicMapCellHistory:getTracked()
                local size = list:size()
                if size > 0 then
                    local geographicMapCompositeInterface = self.allBinaryGameLayerManagerP
                    local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
                    local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
                    local geographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                    local nextPoint = nil
                    local point = nil
                    local start = size - 2
                    for index = 0, size - 1 - 1 do
                        if index == start then
                            self:setBasicColorP(self.startColor)
                            self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
                        elseif geographicMapCellHistory:isVisited(geographicMapCellPosition) then
                            self:setBasicColorP(self.endColor)
                            self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
                        else
                            self:setBasicColorP(self.middleColor)
                            self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
                        end
                        geographicMapCellPosition = list:get(index)
                        point = geographicMapCellPosition:getMidPoint()
                        geographicMapCellPosition = list:get(index + 1)
                        nextPoint = geographicMapCellPosition:getMidPoint()
                        self.linePathAnimation:paint(graphics, point, nextPoint, tiledLayer)
                    end
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF("Cleared Target", self, CanvasStrings.getInstance().PAINT)
        end
end
java_overload(PathAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return PathAnimation

