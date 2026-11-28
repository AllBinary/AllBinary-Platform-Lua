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
-- package org.allbinary.media.graphics.geography.map.topview

local BasicTopViewGeographicMapCellTypeFactory = {}
package.loaded["org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory"] = BasicTopViewGeographicMapCellTypeFactory

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local RaceTrackGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local BasicTopViewGeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellType")
local BasicTopViewGeographicMapStrings = java_lazy("org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapStrings")

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

-- class table BasicTopViewGeographicMapCellTypeFactory is declared before the requires
BasicTopViewGeographicMapCellTypeFactory.__index = BasicTopViewGeographicMapCellTypeFactory
BasicTopViewGeographicMapCellTypeFactory.className = "BasicTopViewGeographicMapCellTypeFactory"
BasicTopViewGeographicMapCellTypeFactory.javaClassName = "org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory"
setmetatable(BasicTopViewGeographicMapCellTypeFactory, {__index = GeographicMapCellTypeFactory})

function BasicTopViewGeographicMapCellTypeFactory:_init_fields()
    if self.BLOCK_CELL_TYPE == nil then self.BLOCK_CELL_TYPE = nil end
    if self.OFF_MAP_CELL_TYPE == nil then self.OFF_MAP_CELL_TYPE = nil end
    if self.FLOOR_CELL_TYPE == nil then self.FLOOR_CELL_TYPE = nil end
    if self.DOOR_CELL_TYPE == nil then self.DOOR_CELL_TYPE = nil end
    if self.STAIRS_UP_CELL_TYPE == nil then self.STAIRS_UP_CELL_TYPE = nil end
    if self.STAIRS_DOWN_CELL_TYPE == nil then self.STAIRS_DOWN_CELL_TYPE = nil end
    if self.OTHER_CELL_TYPE == nil then self.OTHER_CELL_TYPE = nil end
    if self.maxTileId == nil then self.maxTileId = 0 end
end


function BasicTopViewGeographicMapCellTypeFactory._jinit(self, tileTypeToTileIdsMap, maxTileId)
    java_super_init(GeographicMapCellTypeFactory, self)
    BasicTopViewGeographicMapCellTypeFactory._init_fields(self)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        self.maxTileId = maxTileId
        local basicTopViewGeographicMapStrings = BasicTopViewGeographicMapStrings.getInstance()
        local geographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance()
        local geographicMapCellTypeArray = geographicMapCellTypeFactory:getGeographicMapCellTypeArray()
        local type = 0
        if rawequal(geographicMapCellTypeArray[type + 1], nil) then
            RaceTrackGeographicMapCellType.new(CommonStrings.getInstance().UNKNOWN, type, 999, 0)
        else
        end
        local BLOCK_CELL_TYPE = BasicTopViewGeographicMapCellType.createType(basicTopViewGeographicMapStrings.DEFAULT, 1, 1)
        local OFF_MAP_CELL_TYPE = BLOCK_CELL_TYPE
        local FLOOR_CELL_TYPE = BLOCK_CELL_TYPE
        local DOOR_CELL_TYPE = BLOCK_CELL_TYPE
        local STAIRS_UP_CELL_TYPE = BLOCK_CELL_TYPE
        local STAIRS_DOWN_CELL_TYPE = BLOCK_CELL_TYPE
        local OTHER_CELL_TYPE = BLOCK_CELL_TYPE
        local keyArray = HashtableUtil.getInstance():getKeysAsArray(tileTypeToTileIdsMap)
        local size = (keyArray.n or #keyArray)
        local idsWithTypeList = nil
        local key = nil
        local basicPlatormGeographicMapCellType = nil
        for index = 0, size - 1 do
            key = keyArray[index + 1]
            idsWithTypeList = tileTypeToTileIdsMap:get(key)
            if (key == basicTopViewGeographicMapStrings.WALL) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.WALL, idsWithTypeList, 1000)
                BLOCK_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.OFF_MAP) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.OFF_MAP, idsWithTypeList, 1001)
                OFF_MAP_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.FLOOR) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.FLOOR, idsWithTypeList, 1)
                FLOOR_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.DOOR) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.DOOR, idsWithTypeList, 1)
                DOOR_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.STAIRS_UP) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.STAIRS_UP, idsWithTypeList, 1)
                STAIRS_UP_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.STAIRS_DOWN) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.STAIRS_DOWN, idsWithTypeList, 1)
                STAIRS_DOWN_CELL_TYPE = basicPlatormGeographicMapCellType
            elseif (key == basicTopViewGeographicMapStrings.OTHER) then
                basicPlatormGeographicMapCellType = BasicTopViewGeographicMapCellType.new(basicTopViewGeographicMapStrings.OTHER, idsWithTypeList, 1)
                OTHER_CELL_TYPE = basicPlatormGeographicMapCellType
            end
        end
        self.BLOCK_CELL_TYPE = BLOCK_CELL_TYPE
        self.OFF_MAP_CELL_TYPE = OFF_MAP_CELL_TYPE
        self.FLOOR_CELL_TYPE = FLOOR_CELL_TYPE
        self.DOOR_CELL_TYPE = DOOR_CELL_TYPE
        self.STAIRS_UP_CELL_TYPE = STAIRS_UP_CELL_TYPE
        self.STAIRS_DOWN_CELL_TYPE = STAIRS_DOWN_CELL_TYPE
        self.OTHER_CELL_TYPE = OTHER_CELL_TYPE
        type = self.maxTileId - 1
        if rawequal(geographicMapCellTypeArray[type + 1], nil) then
            RaceTrackGeographicMapCellType.new(commonStrings.START, type, 1, 0)
        else
        end
        type = self.maxTileId - 2
        if rawequal(geographicMapCellTypeArray[type + 1], nil) then
            RaceTrackGeographicMapCellType.new(commonStrings.START, type, 1, 0)
        else
        end
    return self
end

function BasicTopViewGeographicMapCellTypeFactory.new(...)
    local self = setmetatable({}, BasicTopViewGeographicMapCellTypeFactory)
    BasicTopViewGeographicMapCellTypeFactory._jinit(self, ...)
    return self
end


function BasicTopViewGeographicMapCellTypeFactory:getStartType()
        return self.maxTileId - 1
end
java_overload(BasicTopViewGeographicMapCellTypeFactory, "getStartType", 0)


function BasicTopViewGeographicMapCellTypeFactory:getEndType()
        return self.maxTileId - 2
end
java_overload(BasicTopViewGeographicMapCellTypeFactory, "getEndType", 0)


function BasicTopViewGeographicMapCellTypeFactory:getEmptyType()
        return self.FLOOR_CELL_TYPE:getTypes()[1]
end
java_overload(BasicTopViewGeographicMapCellTypeFactory, "getEmptyType", 0)


function BasicTopViewGeographicMapCellTypeFactory:isPath(cellType)
        if self.FLOOR_CELL_TYPE:isType(cellType) then
            return true
        end
        return false
end
java_overload(BasicTopViewGeographicMapCellTypeFactory, "isPath", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellType")) end)


function BasicTopViewGeographicMapCellTypeFactory:toString()
        return tostring(StringMaker.new():append("key: WALL/BLOCK_CELL_TYPE: "):append(tostring(self.BLOCK_CELL_TYPE)):append("key: FLOOR_CELL_TYPE: "):append(tostring(self.FLOOR_CELL_TYPE)):append("key: OTHER_CELL_TYPE: "):append(tostring(self.OTHER_CELL_TYPE)):append("key: OFF_MAP_CELL_TYPE: "):append(tostring(self.OFF_MAP_CELL_TYPE)):append("key: DOOR_CELL_TYPE: "):append(tostring(self.DOOR_CELL_TYPE)):append("key: STAIRS_DOWN_CELL_TYPE: "):append(tostring(self.STAIRS_DOWN_CELL_TYPE)):append("key: STAIRS_UP_CELL_TYPE: "):append(tostring(self.STAIRS_UP_CELL_TYPE)))
end
java_overload(BasicTopViewGeographicMapCellTypeFactory, "toString", 0)
BasicTopViewGeographicMapCellTypeFactory.__tostring = function(self) return self:toString() end

return BasicTopViewGeographicMapCellTypeFactory

