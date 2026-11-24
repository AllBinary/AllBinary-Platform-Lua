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

local AllBinaryJ2METiledLayer = {}
package.loaded["org.allbinary.game.layer.AllBinaryJ2METiledLayer"] = AllBinaryJ2METiledLayer

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
-- local TiledLayer = require("javax.microedition.lcdui.game.TiledLayer")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")

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

-- class table AllBinaryJ2METiledLayer is declared before the requires
AllBinaryJ2METiledLayer.__index = AllBinaryJ2METiledLayer
AllBinaryJ2METiledLayer.className = "AllBinaryJ2METiledLayer"
AllBinaryJ2METiledLayer.javaClassName = "org.allbinary.game.layer.AllBinaryJ2METiledLayer"
setmetatable(AllBinaryJ2METiledLayer, {__index = AllBinaryTiledLayer})

function AllBinaryJ2METiledLayer:_init_fields()
    if self.tiledLayerP == nil then self.tiledLayerP = nil end
    if self.debugColor == nil then self.debugColor = nil end
    self.font2 = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, 4)
end


function AllBinaryJ2METiledLayer._jinit(self, dataId, tiledLayer, mapTwoDArray, debugColor)
    java_super_init(AllBinaryTiledLayer, self, dataId, tiledLayer:getWidth(), tiledLayer:getHeight(), tiledLayer:getCellWidth(), tiledLayer:getCellHeight())
    AllBinaryJ2METiledLayer._init_fields(self)
        -- super(...) made self above
        self.tiledLayerP = tiledLayer
        self.debugColor = debugColor
        self:setCells(mapTwoDArray)
    return self
end

function AllBinaryJ2METiledLayer.new(...)
    local self = setmetatable({}, AllBinaryJ2METiledLayer)
    AllBinaryJ2METiledLayer._jinit(self, ...)
    return self
end


function AllBinaryJ2METiledLayer:paint(graphics)
        self.tiledLayerP:paint(graphics)
end
java_overload(AllBinaryJ2METiledLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryJ2METiledLayer:paintDebug(graphics)
        local font = graphics:getFont()
        graphics:setFont(self.font2)
        graphics:setColor(self.debugColor)
        local x = self.tiledLayerP:getX()
        local y = self.tiledLayerP:getY()
        local firstColumn = 0
        local firstRow = 0
        local totalColumns = self.tiledLayerP:getColumns()
        local totalRows = self.tiledLayerP:getRows()
        local x0 = x
        local tile = 0
        local tileHeight = self.tiledLayerP:getCellHeight()
        local tileWidth = self.tiledLayerP:getCellWidth()
        local commonSeps = CommonSeps.getInstance()
        local stringMaker = StringMaker.new()
        do
            local rowIndex = firstRow
            while rowIndex < totalRows do
            x = x0
            do
                local columnIndex = firstColumn
                while columnIndex < totalColumns do
                do
                tile = self.tiledLayerP:getCell(columnIndex, rowIndex)
                if tile < 0 then
                    tile = self.tiledLayerP:getAnimatedTile(tile)
                end
                if tile == 0 then
                    goto continue_N66931
                end
                tile = tile - 1
                stringMaker:delete(0, stringMaker:length())
                graphics:drawString(tostring(stringMaker:appendint(columnIndex):append(commonSeps.COMMA):appendint(rowIndex):append(commonSeps.COLON):appendint(tile)), x + 5, y + 10, 0)
                end
                ::continue_N66931::
                columnIndex = columnIndex + 1
                x = x + (tileWidth)
                end
            end
            rowIndex = rowIndex + 1
            y = y + (tileHeight)
            end
        end
        graphics:setFont(font)
end
java_overload(AllBinaryJ2METiledLayer, "paintDebug", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryJ2METiledLayer:moveDXY(dx, dy)
        self.tiledLayerP:move(dx, dy)
        java_super(AllBinaryTiledLayer, "moveDXY", 2)(self, -dx, -dy)
end
java_overload(AllBinaryJ2METiledLayer, "moveDXY", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryJ2METiledLayer:setPosition(x, y, z)
        self.tiledLayerP:setPosition(x, y)
        java_super(AllBinaryTiledLayer, "setPosition", 3)(self, -x, -y, z)
end
java_overload(AllBinaryJ2METiledLayer, "setPosition", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function AllBinaryJ2METiledLayer:getTiledLayer()
        return self.tiledLayerP
end
java_overload(AllBinaryJ2METiledLayer, "getTiledLayer", 0)


function AllBinaryJ2METiledLayer:getCellWidth()
        return self.tiledLayerP:getCellWidth()
end
java_overload(AllBinaryJ2METiledLayer, "getCellWidth", 0)


function AllBinaryJ2METiledLayer:getCellHeight()
        return self.tiledLayerP:getCellHeight()
end
java_overload(AllBinaryJ2METiledLayer, "getCellHeight", 0)


function AllBinaryJ2METiledLayer:getCell(col, row)
        return self.tiledLayerP:getCell(col, row)
end
java_overload(AllBinaryJ2METiledLayer, "getCell", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryJ2METiledLayer:getColumns()
        return self.tiledLayerP:getColumns()
end
java_overload(AllBinaryJ2METiledLayer, "getColumns", 0)


function AllBinaryJ2METiledLayer:getRows()
        return self.tiledLayerP:getRows()
end
java_overload(AllBinaryJ2METiledLayer, "getRows", 0)


function AllBinaryJ2METiledLayer:setCell(col, row, index)
        self.tiledLayerP:setCell(col, row, index)
end
java_overload(AllBinaryJ2METiledLayer, "setCell", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function AllBinaryJ2METiledLayer:getAnimatedTile(animationTileIndex)
        return self.tiledLayerP:getAnimatedTile(animationTileIndex)
end
java_overload(AllBinaryJ2METiledLayer, "getAnimatedTile", 1, function(java_a1) return true and type(java_a1) == "number" end)

return AllBinaryJ2METiledLayer

