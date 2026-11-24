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

local AllBinaryTiledLayer = {}
package.loaded["org.allbinary.game.layer.AllBinaryTiledLayer"] = AllBinaryTiledLayer

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
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local Layer = require("org.allbinary.layer.Layer")
local NamedInterface = java_lazy("org.allbinary.layer.NamedInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table AllBinaryTiledLayer is declared before the requires
AllBinaryTiledLayer.__index = AllBinaryTiledLayer
AllBinaryTiledLayer.className = "AllBinaryTiledLayer"
AllBinaryTiledLayer.javaClassName = "org.allbinary.game.layer.AllBinaryTiledLayer"
setmetatable(AllBinaryTiledLayer, {__index = Layer})
AllBinaryTiledLayer.java_implements = " NamedInterface PaintableInterface "
AllBinaryTiledLayer.java_interfaces = function() return {NamedInterface, PaintableInterface} end

function AllBinaryTiledLayer:_init_fields()
    if self.cellWidth == nil then self.cellWidth = nil end
    if self.cellHeight == nil then self.cellHeight = nil end
    if self.halfWidth == nil then self.halfWidth = nil end
    if self.halfHeight == nil then self.halfHeight = nil end
    if self.halfCellWidth == nil then self.halfCellWidth = nil end
    if self.halfCellHeight == nil then self.halfCellHeight = nil end
    if self.dataId == nil then self.dataId = nil end
end


function AllBinaryTiledLayer._jinit(self, dataId, width, height, cellWidth, cellHeight)
    java_super_init(Layer, self, 0, 0)
    AllBinaryTiledLayer._init_fields(self)
        -- super(...) made self above
        self.dataId = dataId
        self:setLayerWidth(width)
        self:setLayerHeight(height)
        java_super(Layer, "setPosition", 3)(self, 0, 0, 0)
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
        self.halfWidth = (((self:getWidth()) // (1 << (1))))
        self.halfHeight = (((self:getHeight()) // (1 << (1))))
        self.halfCellWidth = (((cellWidth) // (1 << (1))))
        self.halfCellHeight = (((cellHeight) // (1 << (1))))
    return self
end

function AllBinaryTiledLayer.new(...)
    local self = setmetatable({}, AllBinaryTiledLayer)
    AllBinaryTiledLayer._jinit(self, ...)
    return self
end


function AllBinaryTiledLayer:setCells(mapTwoDArray)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Start: r: ")
        stringBuffer:appendint((mapTwoDArray.n or #mapTwoDArray))
        stringBuffer:append(" c: ")
        stringBuffer:appendint((mapTwoDArray[1].n or #mapTwoDArray[1]))
        stringBuffer:append(" rows: ")
        stringBuffer:appendint(self:getRows())
        stringBuffer:append(" columns: ")
        stringBuffer:appendint(self:getColumns())
        self.logUtil:putF(tostring(stringBuffer), self, "setCells")
        local rows = self:getRows()
        local columns = self:getColumns()
        for col = 0, columns - 1 do
            for row = 0, rows - 1 do
                self:setCell(col, row, mapTwoDArray[row + 1][col + 1])
            end
        end
end
java_overload(AllBinaryTiledLayer, "setCells", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function AllBinaryTiledLayer:updateCells(mapTwoDArray, fromTileId, toTileId)
        local rows = self:getRows()
        local columns = self:getColumns()
        for col = 0, columns - 1 do
            for row = 0, rows - 1 do
                if fromTileId == mapTwoDArray[row + 1][col + 1] then
                    mapTwoDArray[row + 1][col + 1] = toTileId
                    self:setCell(col, row, mapTwoDArray[row + 1][col + 1])
                end
            end
        end
end
java_overload(AllBinaryTiledLayer, "updateCells", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and type(java_a2) == "number" and type(java_a3) == "number" end)


function AllBinaryTiledLayer:getName()
        return (getmetatable(self).javaClassName or getmetatable(self).className)
end
java_overload(AllBinaryTiledLayer, "getName", 0)


function AllBinaryTiledLayer:paint(graphics)
end
java_overload(AllBinaryTiledLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryTiledLayer:paintThreed(graphics)
end
java_overload(AllBinaryTiledLayer, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryTiledLayer:getX2()
        return self.x + self:getWidth()
end
java_overload(AllBinaryTiledLayer, "getX2", 0)


function AllBinaryTiledLayer:getY2()
        return self.y + self:getHeight()
end
java_overload(AllBinaryTiledLayer, "getY2", 0)


function AllBinaryTiledLayer:getZ2()
        return java_int((self.z + self:getDepth()))
end
java_overload(AllBinaryTiledLayer, "getZ2", 0)


function AllBinaryTiledLayer:getCellWidth()
        return self.cellWidth
end
java_overload(AllBinaryTiledLayer, "getCellWidth", 0)


function AllBinaryTiledLayer:getCellHeight()
        return self.cellHeight
end
java_overload(AllBinaryTiledLayer, "getCellHeight", 0)


function AllBinaryTiledLayer:getCell(col, row)
        return -1
end
java_overload(AllBinaryTiledLayer, "getCell", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryTiledLayer:getColumns()
        return -1
end
java_overload(AllBinaryTiledLayer, "getColumns", 0)


function AllBinaryTiledLayer:getRows()
        return -1
end
java_overload(AllBinaryTiledLayer, "getRows", 0)


function AllBinaryTiledLayer:setCell(col, row, tileIndex)
end
java_overload(AllBinaryTiledLayer, "setCell", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function AllBinaryTiledLayer:getHalfWidth()
        return self.halfWidth
end
java_overload(AllBinaryTiledLayer, "getHalfWidth", 0)


function AllBinaryTiledLayer:getHalfHeight()
        return self.halfHeight
end
java_overload(AllBinaryTiledLayer, "getHalfHeight", 0)


function AllBinaryTiledLayer:getDataId()
        return self.dataId
end
java_overload(AllBinaryTiledLayer, "getDataId", 0)


function AllBinaryTiledLayer:getHalfCellWidth()
        return self.halfCellWidth
end
java_overload(AllBinaryTiledLayer, "getHalfCellWidth", 0)


function AllBinaryTiledLayer:getHalfCellHeight()
        return self.halfCellHeight
end
java_overload(AllBinaryTiledLayer, "getHalfCellHeight", 0)


function AllBinaryTiledLayer:isOnTileLayer(column, row)
        if self:getColumns() > column and self:getRows() > row and row >= 0 and column >= 0 then
            return true
        else
            return false
        end
end
java_overload(AllBinaryTiledLayer, "isOnTileLayer", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryTiledLayer:getAnimatedTile(animationTileIndex)
        return animationTileIndex
end
java_overload(AllBinaryTiledLayer, "getAnimatedTile", 1, function(java_a1) return true and type(java_a1) == "number" end)

return AllBinaryTiledLayer

