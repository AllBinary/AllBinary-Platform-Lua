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
-- package org.allbinary.media.graphics.geography.map

local BasicGeographicMap = {}
package.loaded["org.allbinary.media.graphics.geography.map.BasicGeographicMap"] = BasicGeographicMap

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

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local Layer = java_lazy("org.allbinary.layer.Layer")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local SimpleGeographicMap = require("org.allbinary.media.graphics.geography.map.SimpleGeographicMap")
local GeographicMapInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapInterface")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellPositionBaseFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory")
local GeographicMapCellPositionFactoryInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionFactoryInterface")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")

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

-- class table BasicGeographicMap is declared before the requires
BasicGeographicMap.__index = BasicGeographicMap
BasicGeographicMap.className = "BasicGeographicMap"
BasicGeographicMap.javaClassName = "org.allbinary.media.graphics.geography.map.BasicGeographicMap"
setmetatable(BasicGeographicMap, {__index = SimpleGeographicMap})
BasicGeographicMap.java_implements = " GeographicMapInterface "
BasicGeographicMap.java_interfaces = function() return {GeographicMapInterface} end

function BasicGeographicMap:_init_fields()
    self.mathUtil = MathUtil.getInstance()
    if self.geographicMapCellPositionFactory == nil then self.geographicMapCellPositionFactory = nil end
    if self.geographicMapCellPositionFactoryInterface == nil then self.geographicMapCellPositionFactoryInterface = nil end
    if self.geographicMapCellTypeFactory == nil then self.geographicMapCellTypeFactory = nil end
end


function BasicGeographicMap._jinit(self, id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor, geographicMapCellPositionFactoryInterface, geographicMapCellPositionBaseFactory, geographicMapCellTypeFactory)
    java_super_init(SimpleGeographicMap, self, id, name, cellTypeIdToGeographicMapCellType, tiledLayer, foregroundBasicColor, backgroundBasicColor)
    BasicGeographicMap._init_fields(self)
        -- super(...) made self above
        self.geographicMapCellPositionFactoryInterface = geographicMapCellPositionFactoryInterface
        self.geographicMapCellPositionFactory = geographicMapCellPositionBaseFactory:getInstance(self)
        self.geographicMapCellTypeFactory = geographicMapCellTypeFactory
    return self
end

function BasicGeographicMap.new(...)
    local self = setmetatable({}, BasicGeographicMap)
    BasicGeographicMap._jinit(self, ...)
    return self
end


-- throws Exception
function BasicGeographicMap:getCellPosition(direction, oldGeographicMapCellPosition)
        do
            local switch_value = direction
            if switch_value == 0 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() - 1, oldGeographicMapCellPosition:getRow())
            elseif switch_value == 1 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() + 1, oldGeographicMapCellPosition:getRow())
            elseif switch_value == 2 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() - 1)
            elseif switch_value == 3 then
                return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
            else
                error(require("java.lang.Exception").new("Only Four Directions"), 0)
            end
        end
end
java_overload(BasicGeographicMap, "getCellPosition", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function BasicGeographicMap:getCellPositionNoThrow(direction, oldGeographicMapCellPosition)
        do
            local switch_value = direction
            if switch_value == 0 then
                if oldGeographicMapCellPosition:getColumn() - 1 >= 0 then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() - 1, oldGeographicMapCellPosition:getRow())
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                if oldGeographicMapCellPosition:getColumn() + 1 < self:getAllBinaryTiledLayer():getColumns() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() + 1, oldGeographicMapCellPosition:getRow())
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                if oldGeographicMapCellPosition:getRow() - 1 >= 0 then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() - 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                if oldGeographicMapCellPosition:getRow() + 1 < self:getAllBinaryTiledLayer():getRows() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            elseif switch_value == 1 then
                if oldGeographicMapCellPosition:getColumn() + 1 < self:getAllBinaryTiledLayer():getColumns() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn() + 1, oldGeographicMapCellPosition:getRow())
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                if oldGeographicMapCellPosition:getRow() - 1 >= 0 then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() - 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                if oldGeographicMapCellPosition:getRow() + 1 < self:getAllBinaryTiledLayer():getRows() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            elseif switch_value == 2 then
                if oldGeographicMapCellPosition:getRow() - 1 >= 0 then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() - 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                if oldGeographicMapCellPosition:getRow() + 1 < self:getAllBinaryTiledLayer():getRows() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            elseif switch_value == 3 then
                if oldGeographicMapCellPosition:getRow() + 1 < self:getAllBinaryTiledLayer():getRows() then
                    return self.geographicMapCellPositionFactory:getAt(oldGeographicMapCellPosition:getColumn(), oldGeographicMapCellPosition:getRow() + 1)
                else
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                end
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            else
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            end
        end
end
java_overload(BasicGeographicMap, "getCellPositionNoThrow", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function BasicGeographicMap:isOfFourDirections(oldGeographicMapCellPosition, newGeographicMapCellPosition)
        for index = 0, 4 - 1 do
            if rawequal(newGeographicMapCellPosition, self:getCellPositionNoThrow(index, oldGeographicMapCellPosition)) then
                return true
            end
        end
        return false
end
java_overload(BasicGeographicMap, "isOfFourDirections", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) and (java_a2 == nil or java_is(java_a2, "GeographicMapCellPosition")) end)


-- throws Exception
function BasicGeographicMap:getCellPositionAtXY(x, y)
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_column = self.mathUtil:abs(x / allBinaryTiledLayer:getCellHeight())
        local i_row = self.mathUtil:abs(y / allBinaryTiledLayer:getCellWidth())
        return self.geographicMapCellPositionFactory:getAt(i_column, i_row)
end
java_overload(BasicGeographicMap, "getCellPositionAtXY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function BasicGeographicMap:getCellPositionAtXYNoThrow(x, y)
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_column = self.mathUtil:abs(x / allBinaryTiledLayer:getCellHeight())
        local i_row = self.mathUtil:abs(y / allBinaryTiledLayer:getCellWidth())
        if allBinaryTiledLayer:getColumns() > i_column and allBinaryTiledLayer:getRows() > i_row then
            local try_ok, try_error, try_value = pcall(function()
                do return "__jreturn", self.geographicMapCellPositionFactory:getAt(i_column, i_row) end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
            end
            if try_ok and try_error == "__jreturn" then return try_value end
        else
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        end
end
java_overload(BasicGeographicMap, "getCellPositionAtXYNoThrow", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function BasicGeographicMap:isOnMap(geographicMapCellPosition)
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_column = geographicMapCellPosition:getColumn()
        local i_row = geographicMapCellPosition:getRow()
        if allBinaryTiledLayer:getColumns() > i_column and allBinaryTiledLayer:getRows() > i_row then
            return true
        else
            return false
        end
end
java_overload(BasicGeographicMap, "isOnMap", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


-- throws Exception
function BasicGeographicMap:getCellPositionAtNoThrow(x, y, x2, y2, geographicMapCellPositionList)
        geographicMapCellPositionList:clear()
        local allBinaryTiledLayer = self:getAllBinaryTiledLayer()
        local i_columnMin = self.mathUtil:abs(x / allBinaryTiledLayer:getCellHeight())
        local i_rowMin = self.mathUtil:abs(y / allBinaryTiledLayer:getCellWidth())
        local i_columnMax = self.mathUtil:abs(x2 / allBinaryTiledLayer:getCellHeight()) + 1
        local i_rowMax = self.mathUtil:abs(y2 / allBinaryTiledLayer:getCellWidth()) + 1
        for columnIndex = i_columnMin, i_columnMax - 1 do
            for rowIndex = i_rowMin, i_rowMax - 1 do
                if allBinaryTiledLayer:getColumns() > columnIndex and allBinaryTiledLayer:getRows() > rowIndex then
                    geographicMapCellPositionList:add(self.geographicMapCellPositionFactory:getAt(columnIndex, rowIndex))
                end
            end
        end
        return geographicMapCellPositionList
end
java_overload(BasicGeographicMap, "getCellPositionAtNoThrow", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" and (java_a5 == nil or java_is(java_a5, "BasicArrayList")) end)


-- throws Exception
function BasicGeographicMap:getCellPositionsAt(layer, currentCellPositionArray, cellPositionArray)
        local hasChanged = false
        local size = (cellPositionArray.n or #cellPositionArray)
        local size2 = (cellPositionArray[1].n or #cellPositionArray[1])
        local xPortion = layer:getXP() / (size - 1)
        local yPortion = layer:getYP() / (size - 1)
        for index = 0, size - 1 do
            for index2 = 0, size2 - 1 do
                local x = xPortion * index
                local y = yPortion * index
                cellPositionArray[index + 1][index2 + 1] = self:getCellPositionAtXY(x, y)
                if not rawequal(currentCellPositionArray[index + 1][index2 + 1], cellPositionArray[index + 1][index2 + 1]) then
                    hasChanged = true
                end
            end
        end
        return hasChanged
end
java_overload(BasicGeographicMap, "getCellPositionsAt", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Layer")) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or (type(java_a3) == "table" and getmetatable(java_a3) == nil and java_a3.jt == nil and (java_a3[1] == nil or type(java_a3[1]) == "table"))) end)


-- throws Exception
function BasicGeographicMap:getCellTypeAtXY(x, y)
        local cellPosition = self:getCellPositionAtXY(x, y)
        return self:getCellTypeAt(cellPosition)
end
java_overload(BasicGeographicMap, "getCellTypeAtXY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function BasicGeographicMap:getGeographicMapCellPositionFactory()
        return self.geographicMapCellPositionFactory
end
java_overload(BasicGeographicMap, "getGeographicMapCellPositionFactory", 0)


function BasicGeographicMap:getGeographicMapCellPositionFactoryInterface()
        return self.geographicMapCellPositionFactoryInterface
end
java_overload(BasicGeographicMap, "getGeographicMapCellPositionFactoryInterface", 0)


function BasicGeographicMap:getGeographicMapCellTypeFactory()
        return self.geographicMapCellTypeFactory
end
java_overload(BasicGeographicMap, "getGeographicMapCellTypeFactory", 0)


function BasicGeographicMap:getId()
        return java_super(SimpleGeographicMap, "getId", 0)(self)
end
java_overload(BasicGeographicMap, "getId", 0)


function BasicGeographicMap:getName()
        return java_super(SimpleGeographicMap, "getName", 0)(self)
end
java_overload(BasicGeographicMap, "getName", 0)


function BasicGeographicMap:reset()
        java_super(SimpleGeographicMap, "reset", 0)(self)
end
java_overload(BasicGeographicMap, "reset", 0)


function BasicGeographicMap:getAllBinaryTiledLayer()
        return java_super(SimpleGeographicMap, "getAllBinaryTiledLayer", 0)(self)
end
java_overload(BasicGeographicMap, "getAllBinaryTiledLayer", 0)


function BasicGeographicMap:getCellTypeFromMapCellTypeInt(cellTypeId)
        return java_super(SimpleGeographicMap, "getCellTypeFromMapCellTypeInt", 1)(self, cellTypeId)
end
java_overload(BasicGeographicMap, "getCellTypeFromMapCellTypeInt", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function BasicGeographicMap:getCellTypeAt(cellPosition)
        return java_super(SimpleGeographicMap, "getCellTypeAt", 1)(self, cellPosition)
end
java_overload(BasicGeographicMap, "getCellTypeAt", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GeographicMapCellPosition")) end)


function BasicGeographicMap:getForegroundBasicColor()
        return java_super(SimpleGeographicMap, "getForegroundBasicColor", 0)(self)
end
java_overload(BasicGeographicMap, "getForegroundBasicColor", 0)


function BasicGeographicMap:getBackgroundBasicColor()
        return java_super(SimpleGeographicMap, "getBackgroundBasicColor", 0)(self)
end
java_overload(BasicGeographicMap, "getBackgroundBasicColor", 0)

BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY = java_new_array(nil, 0)

return BasicGeographicMap

