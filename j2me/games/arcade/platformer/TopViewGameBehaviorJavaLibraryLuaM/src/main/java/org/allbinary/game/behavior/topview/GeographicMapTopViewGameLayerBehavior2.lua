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

local GeographicMapTopViewGameLayerBehavior2 = {}
package.loaded["org.allbinary.game.behavior.topview.GeographicMapTopViewGameLayerBehavior2"] = GeographicMapTopViewGameLayerBehavior2

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

local MultiGeographicMapBehavior = java_lazy("org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local GravityUtil = java_lazy("org.allbinary.game.physics.acceleration.GravityUtil")
local VelocityProperties = java_lazy("org.allbinary.game.physics.velocity.VelocityProperties")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")
local GeographicMapTopViewLayerBehavior = require("org.allbinary.game.behavior.topview.GeographicMapTopViewLayerBehavior")
local TopViewCharacterInterface = java_lazy("org.allbinary.game.behavior.topview.TopViewCharacterInterface")

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

-- class table GeographicMapTopViewGameLayerBehavior2 is declared before the requires
GeographicMapTopViewGameLayerBehavior2.__index = GeographicMapTopViewGameLayerBehavior2
GeographicMapTopViewGameLayerBehavior2.className = "GeographicMapTopViewGameLayerBehavior2"
GeographicMapTopViewGameLayerBehavior2.javaClassName = "org.allbinary.game.behavior.topview.GeographicMapTopViewGameLayerBehavior2"
setmetatable(GeographicMapTopViewGameLayerBehavior2, {__index = GeographicMapTopViewLayerBehavior})

function GeographicMapTopViewGameLayerBehavior2:_init_fields()
    self.gravityUtil = GravityUtil.getInstance()
    self.geographicMapBehavior = MultiGeographicMapBehavior.new()
    if self.autoStepBlocks == nil then self.autoStepBlocks = false end
    if self.offsetY == nil then self.offsetY = 0 end
    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end


function GeographicMapTopViewGameLayerBehavior2._jinit(self, maxGravityActionIndex, autoStepBlocks, offsetY)
    java_super_init(GeographicMapTopViewLayerBehavior, self, maxGravityActionIndex)
    GeographicMapTopViewGameLayerBehavior2._init_fields(self)
        -- super(...) made self above
        self.autoStepBlocks = autoStepBlocks
        self.offsetY = offsetY
    return self
end

function GeographicMapTopViewGameLayerBehavior2.new(...)
    local self = setmetatable({}, GeographicMapTopViewGameLayerBehavior2)
    GeographicMapTopViewGameLayerBehavior2._jinit(self, ...)
    return self
end


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:gravity(velocityProperties, geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if not (hasSolidBlock) then
                self.gravityUtil:process(velocityProperties, self.gravityUtil.GAME_GRAVITY_VELOCITY)
                velocityProperties:limitXYToForwardAndReverseMaxVelocity()
                self:gravity()
            else
            end
        end
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "gravity", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "VelocityProperties")) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or (type(java_a3) == "table" and getmetatable(java_a3) == nil and java_a3.jt == nil and (java_a3[1] == nil or type(java_a3[1]) == "table"))) and (java_a4 == nil or java_is(java_a4, "GeographicMapCellPosition")) end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getPositionTopLeft(geographicMapInterfaceArray, layer, x, y)
        local xCellPosition = layer:getXP() + -x
        local yCellPosition = layer:getYP() + -y
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getPositionTopLeft", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getPositionTopRight(geographicMapInterfaceArray, layer, x, y)
        local xCellPosition = layer:getXP() + -x + layer:getWidth()
        local yCellPosition = layer:getYP() + -y
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getPositionTopRight", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getPositionBottomLeft(geographicMapInterfaceArray, layer, x, y)
        local xCellPosition = layer:getXP() + -x
        local yCellPosition = layer:getYP() + -y + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getPositionBottomLeft", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getPositionBottomRight(geographicMapInterfaceArray, layer, x, y)
        local xCellPosition = layer:getXP() + -x + layer:getWidth()
        local yCellPosition = layer:getYP() + -y + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getPositionBottomRight", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) and type(java_a3) == "number" and type(java_a4) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getLeftPosition(geographicMapInterfaceArray, layer)
        local xCellPosition = layer:getXP()
        local yCellPosition = layer:getYP() + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getLeftPosition", 2, function(java_a1, java_a2) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getRightPosition(geographicMapInterfaceArray, layer)
        local xCellPosition = layer:getXP() + layer:getWidth()
        local yCellPosition = layer:getYP() + layer:getHeight()
        return geographicMapInterfaceArray[1]:getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getRightPosition", 2, function(java_a1, java_a2) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or java_is(java_a2, "AllBinaryLayer")) end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        local geographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        local topLeftGeographicMapCellPosition = self:getPositionTopLeft(geographicMapInterfaceArray, layer, x, y)
        geographicMapCellPosition = self:getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, topLeftGeographicMapCellPosition, velocityProperties, layer)
        if rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        end
        local topRightGeographicMapCellPosition = self:getPositionTopRight(geographicMapInterfaceArray, layer, x, y)
        geographicMapCellPosition = self:getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, topRightGeographicMapCellPosition, velocityProperties, layer)
        if rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        end
        local bottomLeftGeographicMapCellPosition = self:getPositionBottomLeft(geographicMapInterfaceArray, layer, x, y)
        geographicMapCellPosition = self:getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, bottomLeftGeographicMapCellPosition, velocityProperties, layer)
        if rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        end
        local bottomRightGeographicMapCellPosition = self:getPositionBottomRight(geographicMapInterfaceArray, layer, x, y)
        geographicMapCellPosition = self:getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, bottomRightGeographicMapCellPosition, velocityProperties, layer)
        if rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
        else
        end
        return geographicMapCellPosition
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation", 6, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or java_is(java_a3, "VelocityProperties")) and (java_a4 == nil or java_is(java_a4, "AllBinaryLayer")) and type(java_a5) == "number" and type(java_a6) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer)
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            local possibleStepGeographicMapCellPosition = geographicMapCellPosition
            local tiledLayer = geographicMapInterfaceArray[1]:getAllBinaryTiledLayer()
            if possibleStepGeographicMapCellPosition:getColumn() > 0 and possibleStepGeographicMapCellPosition:getRow() > 0 and possibleStepGeographicMapCellPosition:getColumn() < tiledLayer:getColumns() and possibleStepGeographicMapCellPosition:getRow() < tiledLayer:getRows() then
                self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)
                local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
                local hasOffMap = self:isOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray)
                if hasSolidBlock or hasOffMap then
                    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                    return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
                else
                    self.previousGeographicMapCellPosition = possibleStepGeographicMapCellPosition
                    return possibleStepGeographicMapCellPosition
                end
            end
        else
        end
        self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "getGeographicMapCellPositionIfNotSolidBlockOrOffMap", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or java_is(java_a3, "GeographicMapCellPosition")) and (java_a4 == nil or java_is(java_a4, "VelocityProperties")) and (java_a5 == nil or java_is(java_a5, "AllBinaryLayer")) end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            local topViewCharacterInterface = (layer)
            topViewCharacterInterface:terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y)
        else
        end
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "moveAndLand", 7, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6, java_a7) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or java_is(java_a3, "GeographicMapCellPosition")) and (java_a4 == nil or java_is(java_a4, "VelocityProperties")) and (java_a5 == nil or java_is(java_a5, "AllBinaryLayer")) and type(java_a6) == "number" and type(java_a7) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:move(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        local geographicMapCellPosition = self:getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)
        self:moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)
        if rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            return false
        else
            return true
        end
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "move", 6, function(java_a1, java_a2, java_a3, java_a4, java_a5, java_a6) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or java_is(java_a3, "VelocityProperties")) and (java_a4 == nil or java_is(java_a4, "AllBinaryLayer")) and type(java_a5) == "number" and type(java_a6) == "number" end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:left(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer)
        local geographicMapCellPosition = self:getLeftPosition(geographicMapInterfaceArray, layer)
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            local possibleStepGeographicMapCellPosition = geographicMapInterfaceArray[1]:getGeographicMapCellPositionFactory():getAt(geographicMapCellPosition:getColumn(), geographicMapCellPosition:getRow() - 1)
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if hasSolidBlock then
                if self.autoStepBlocks then
                    local topViewCharacterInterface = (layer)
                    topViewCharacterInterface:leftp()
                else
                    velocityProperties:getVelocityXBasicDecimalP():setint(0)
                end
            else
                local topViewCharacterInterface = (layer)
                topViewCharacterInterface:leftp()
            end
        end
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "left", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or java_is(java_a3, "VelocityProperties")) and (java_a4 == nil or java_is(java_a4, "AllBinaryLayer")) end)


-- throws Exception
function GeographicMapTopViewGameLayerBehavior2:right(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer)
        local geographicMapCellPosition = self:getRightPosition(geographicMapInterfaceArray, layer)
        if not rawequal(geographicMapCellPosition, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            local possibleStepGeographicMapCellPosition = geographicMapInterfaceArray[1]:getGeographicMapCellPositionFactory():getAt(geographicMapCellPosition:getColumn(), geographicMapCellPosition:getRow() - 1)
            self.geographicMapBehavior:getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)
            local hasSolidBlock = self:hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)
            if hasSolidBlock then
                if self.autoStepBlocks then
                    local topViewCharacterInterface = (layer)
                    topViewCharacterInterface:rightp()
                else
                    velocityProperties:getVelocityXBasicDecimalP():setint(0)
                end
            else
                local topViewCharacterInterface = (layer)
                topViewCharacterInterface:rightp()
            end
        end
end
java_overload(GeographicMapTopViewGameLayerBehavior2, "right", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and (java_a3 == nil or java_is(java_a3, "VelocityProperties")) and (java_a4 == nil or java_is(java_a4, "AllBinaryLayer")) end)

return GeographicMapTopViewGameLayerBehavior2

