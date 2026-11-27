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
-- package org.allbinary.media.graphics.geography.map.racetrack

local CustomMapGenerator = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator"] = CustomMapGenerator

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

local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local WaypointLayer = java_lazy("org.allbinary.game.layer.waypoint.WaypointLayer")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local CustomMapGeneratorBase = require("org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBase")
local RaceTrackGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table CustomMapGenerator is declared before the requires
CustomMapGenerator.__index = CustomMapGenerator
CustomMapGenerator.className = "CustomMapGenerator"
CustomMapGenerator.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.CustomMapGenerator"
setmetatable(CustomMapGenerator, {__index = CustomMapGeneratorBase})

function CustomMapGenerator:_init_fields()
    if self.customMapArray == nil then self.customMapArray = nil end
    if self.raceTrackGeographicMap == nil then self.raceTrackGeographicMap = nil end
    if self.geographicMapCellTypeFactory == nil then self.geographicMapCellTypeFactory = nil end
    self.dropCellPositionHistory = DropCellPositionHistory.getInstance()
end


function CustomMapGenerator._jinit(self, raceTrackGeographicMap)
    java_super_init(CustomMapGeneratorBase, self)
    CustomMapGenerator._init_fields(self)
        self.raceTrackGeographicMap = raceTrackGeographicMap
        self.geographicMapCellTypeFactory = self.raceTrackGeographicMap:getGeographicMapCellTypeFactory()
        local mapArray = raceTrackGeographicMap:getRaceTrackData():getMapArray()
        local size2 = (mapArray[1].n or #mapArray[1])
        self.customMapArray = java_new_array(0, (mapArray.n or #mapArray), size2)
        if (mapArray.n or #mapArray) ~= (self.customMapArray.n or #self.customMapArray) or (mapArray[1].n or #mapArray[1]) ~= (self.customMapArray[1].n or #self.customMapArray[1]) then
            error(require("java.lang.Exception").new("Array Incorrect"), 0)
        end
    return self
end

function CustomMapGenerator.new(...)
    local self = setmetatable({}, CustomMapGenerator)
    CustomMapGenerator._jinit(self, ...)
    return self
end


-- throws Exception
function CustomMapGenerator:copyMapIntoCustomMap()
        local mapArray = self.raceTrackGeographicMap:getRaceTrackData():getMapArray()
        local startIndex2 = (mapArray[1].n or #mapArray[1]) - 1
        for index = (mapArray.n or #mapArray) - 1, 0, -1 do
            for index2 = startIndex2, 0, -1 do
                self.customMapArray[index + 1][index2 + 1] = self:getCustomType(index2, index, mapArray[index + 1][index2 + 1])
            end
        end
end
java_overload(CustomMapGenerator, "copyMapIntoCustomMap", 0)


-- throws Exception
function CustomMapGenerator:getCustomType(column, row, currentType)
        local emptyType = self.geographicMapCellTypeFactory:getEmptyType()
        local geographicMapCellPositionFactory = self.raceTrackGeographicMap:getGeographicMapCellPositionFactory()
        local cellPosition = geographicMapCellPositionFactory:getAt(column, row)
        if self.dropCellPositionHistory:isCellPositionWithDrop(cellPosition) then
            local layer = self.dropCellPositionHistory:getLayerInterface(cellPosition)
            if layer == AllBinaryLayer.NULL_ALLBINARY_LAYER then
                return emptyType
            end
            local rtsLayer = layer
            if not rtsLayer:getType() == WaypointLayer.getStaticType() then
                return emptyType
            end
        end
        return currentType
end
java_overload(CustomMapGenerator, "getCustomType", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function CustomMapGenerator:getCustomMapArray()
        return self.customMapArray
end
java_overload(CustomMapGenerator, "getCustomMapArray", 0)

return CustomMapGenerator

