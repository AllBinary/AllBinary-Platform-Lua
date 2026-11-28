-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.behavior.topview

local PlayerTopViewCharacterBehavior = {}
package.loaded["org.allbinary.game.behavior.topview.PlayerTopViewCharacterBehavior"] = PlayerTopViewCharacterBehavior

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

local Direction = java_lazy("org.allbinary.direction.Direction")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local TrackingEventCircularStaticPool = java_lazy("org.allbinary.game.tracking.TrackingEventCircularStaticPool")
local TrackingEventHandler = java_lazy("org.allbinary.game.tracking.TrackingEventHandler")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapUtil = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local TopViewCharacterBehavior = require("org.allbinary.game.behavior.topview.TopViewCharacterBehavior")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table PlayerTopViewCharacterBehavior is declared before the requires
PlayerTopViewCharacterBehavior.__index = PlayerTopViewCharacterBehavior
PlayerTopViewCharacterBehavior.className = "PlayerTopViewCharacterBehavior"
PlayerTopViewCharacterBehavior.javaClassName = "org.allbinary.game.behavior.topview.PlayerTopViewCharacterBehavior"
setmetatable(PlayerTopViewCharacterBehavior, {__index = TopViewCharacterBehavior})

function PlayerTopViewCharacterBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function PlayerTopViewCharacterBehavior._jinit(self)
    java_super_init(TopViewCharacterBehavior, self)
    PlayerTopViewCharacterBehavior._init_fields(self)
    return self
end

function PlayerTopViewCharacterBehavior.new()
    return PlayerTopViewCharacterBehavior._jinit(setmetatable({}, PlayerTopViewCharacterBehavior))
end


-- throws Exception
function PlayerTopViewCharacterBehavior:terrainEvent(layer, direction, x, y, geographicMapInterfaceArray, geographicMapCellPosition)
        TrackingEventHandler.getInstance():fireEvent(TrackingEventCircularStaticPool.getInstance():getNextInstance(layer))
end
java_overload(PlayerTopViewCharacterBehavior, "terrainEvent", 6, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or java_is(java_a2, "Direction")) and type(java_a3) == "number" and type(java_a4) == "number" and (java_a5 == nil or (type(java_a5) == "table" and getmetatable(java_a5) == nil and java_a5.jt == nil and (java_a5[1] == nil or type(java_a5[1]) == "table"))) and (java_a6 == nil or java_is(java_a6, "GeographicMapCellPosition")) end)


function PlayerTopViewCharacterBehavior:terrainMove(layer, geographicMapInterfaceArray, x, y)
        local basicGeographicMapUtil = BasicGeographicMapUtil.getInstance()
        basicGeographicMapUtil:setPosition(geographicMapInterfaceArray, x, y)
end
java_overload(PlayerTopViewCharacterBehavior, "terrainMove", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and type(java_a3) == "number" and type(java_a4) == "number" end)


function PlayerTopViewCharacterBehavior:moveIfOnScreen(layer, ax, ay)
end
java_overload(PlayerTopViewCharacterBehavior, "moveIfOnScreen", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayer")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function PlayerTopViewCharacterBehavior:isTiledLayerMoveable(terrainTiledLayer, x, y)
        return (terrainTiledLayer:getXP() + DisplayInfoSingleton.getInstance():getLastWidth() < terrainTiledLayer:getWidth() or x < 0) and (terrainTiledLayer:getXP() > 0 or x > 0)
end
java_overload(PlayerTopViewCharacterBehavior, "isTiledLayerMoveable", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryTiledLayer")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return PlayerTopViewCharacterBehavior

