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

local AdvancedPlayerOwnedRTSLayers = {}
package.loaded["org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers"] = AdvancedPlayerOwnedRTSLayers

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local PlayerOwnedRTSLayers = require("org.allbinary.game.layer.PlayerOwnedRTSLayers")
local AllBinaryGameLayer = java_lazy("org.allbinary.game.layer.AllBinaryGameLayer")
local RTSLayer = java_lazy("org.allbinary.game.layer.RTSLayer")

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

-- class table AdvancedPlayerOwnedRTSLayers is declared before the requires
AdvancedPlayerOwnedRTSLayers.__index = AdvancedPlayerOwnedRTSLayers
AdvancedPlayerOwnedRTSLayers.className = "AdvancedPlayerOwnedRTSLayers"
AdvancedPlayerOwnedRTSLayers.javaClassName = "org.allbinary.game.layer.AdvancedPlayerOwnedRTSLayers"
setmetatable(AdvancedPlayerOwnedRTSLayers, {__index = PlayerOwnedRTSLayers})

function AdvancedPlayerOwnedRTSLayers:_init_fields()
    self.unitsList = BasicArrayListD.new()
    self.waypointsList = BasicArrayListD.new()
    self.buildingList = BasicArrayListD.new()
    self.baseList = BasicArrayListD.new()
    self.garrisonList = BasicArrayListD.new()
    self.houseList = BasicArrayListD.new()
    self.labList = BasicArrayListD.new()
    self.factoryList = BasicArrayListD.new()
end

function AdvancedPlayerOwnedRTSLayers._jinit(self)
    java_super_init(PlayerOwnedRTSLayers, self)
    AdvancedPlayerOwnedRTSLayers._init_fields(self)
    return self
end

function AdvancedPlayerOwnedRTSLayers.new()
    return AdvancedPlayerOwnedRTSLayers._jinit(setmetatable({}, AdvancedPlayerOwnedRTSLayers))
end


function AdvancedPlayerOwnedRTSLayers:addUnit(rtsLayer)
        self.unitsList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addUnit", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:addWaypoint(rtsLayer)
        self.waypointsList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addWaypoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:addBase(rtsLayer)
        self.baseList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addBase", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:addGarrison(rtsLayer)
        self.garrisonList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addGarrison", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:addHouse(rtsLayer)
        self.houseList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addHouse", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:addLab(rtsLayer)
        self.labList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addLab", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:addFactory(rtsLayer)
        self.factoryList:add(rtsLayer)
        self.buildingList:add(rtsLayer)
        self.rtsLayerList:add(rtsLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "addFactory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "RTSLayer")) end)


function AdvancedPlayerOwnedRTSLayers:removeUnit(gameLayer)
        self.unitsList:remove(gameLayer)
        self.rtsLayerList:remove(gameLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "removeUnit", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayer")) end)


function AdvancedPlayerOwnedRTSLayers:removeWaypoint(gameLayer)
        self.waypointsList:remove(gameLayer)
        self.rtsLayerList:remove(gameLayer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "removeWaypoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayer")) end)


function AdvancedPlayerOwnedRTSLayers:getUnitsList()
        return self.unitsList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getUnitsList", 0)


function AdvancedPlayerOwnedRTSLayers:getWaypointsList()
        return self.waypointsList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getWaypointsList", 0)


function AdvancedPlayerOwnedRTSLayers:getBaseList()
        return self.baseList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getBaseList", 0)


function AdvancedPlayerOwnedRTSLayers:getGarrisonList()
        return self.garrisonList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getGarrisonList", 0)


function AdvancedPlayerOwnedRTSLayers:getHouseList()
        return self.houseList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getHouseList", 0)


function AdvancedPlayerOwnedRTSLayers:getLabList()
        return self.labList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getLabList", 0)


function AdvancedPlayerOwnedRTSLayers:getFactoryList()
        return self.factoryList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getFactoryList", 0)


function AdvancedPlayerOwnedRTSLayers:getTotalBuildings()
        return self.baseList:size() + self.garrisonList:size() + self.houseList:size() + self.labList:size() + self.factoryList:size()
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getTotalBuildings", 0)


function AdvancedPlayerOwnedRTSLayers:removeBuilding(layerInterface)
        self.buildingList:add(layerInterface)
        if self:getBaseList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getFactoryList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getGarrisonList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getLabList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        elseif self:getHouseList():remove(layerInterface) then
            self.rtsLayerList:remove(layerInterface)
        end
end
java_overload(AdvancedPlayerOwnedRTSLayers, "removeBuilding", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayer")) end)


function AdvancedPlayerOwnedRTSLayers:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(PlayerOwnedRTSLayers))
        stringBuffer:append(" Bases: ")
        stringBuffer:appendint(self:getBaseList():size())
        stringBuffer:append(" Factory: ")
        stringBuffer:appendint(self:getFactoryList():size())
        stringBuffer:append(" Garrison: ")
        stringBuffer:appendint(self:getGarrisonList():size())
        stringBuffer:append(" Labs: ")
        stringBuffer:appendint(self:getLabList():size())
        stringBuffer:append(" Houses: ")
        stringBuffer:appendint(self:getHouseList():size())
        stringBuffer:append(" Waypoints: ")
        stringBuffer:appendint(self:getWaypointsList():size())
        stringBuffer:append(" Units: ")
        stringBuffer:appendint(self:getUnitsList():size())
        return tostring(stringBuffer)
end
java_overload(AdvancedPlayerOwnedRTSLayers, "toString", 0)
AdvancedPlayerOwnedRTSLayers.__tostring = function(self) return self:toString() end


function AdvancedPlayerOwnedRTSLayers:getBuildingList()
        return self.buildingList
end
java_overload(AdvancedPlayerOwnedRTSLayers, "getBuildingList", 0)

return AdvancedPlayerOwnedRTSLayers

