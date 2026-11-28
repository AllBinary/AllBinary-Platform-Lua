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
-- package org.allbinary.media.graphics.geography.map.drop

local AnyRandomDropCellPositionGenerator = {}
package.loaded["org.allbinary.media.graphics.geography.map.drop.AnyRandomDropCellPositionGenerator"] = AnyRandomDropCellPositionGenerator

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local BasicGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMapCellPositionFactory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BaseDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator")

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

-- class table AnyRandomDropCellPositionGenerator is declared before the requires
AnyRandomDropCellPositionGenerator.__index = AnyRandomDropCellPositionGenerator
AnyRandomDropCellPositionGenerator.className = "AnyRandomDropCellPositionGenerator"
AnyRandomDropCellPositionGenerator.javaClassName = "org.allbinary.media.graphics.geography.map.drop.AnyRandomDropCellPositionGenerator"
setmetatable(AnyRandomDropCellPositionGenerator, {__index = BaseDropCellPositionGenerator})

function AnyRandomDropCellPositionGenerator:_init_fields()
    self.list = BasicArrayListD.new()
    self.geographicMapInterface = NullUtil.getInstance().NULL_OBJECT
end

function AnyRandomDropCellPositionGenerator._jinit(self)
    java_super_init(BaseDropCellPositionGenerator, self)
    AnyRandomDropCellPositionGenerator._init_fields(self)
    return self
end

function AnyRandomDropCellPositionGenerator.new()
    return AnyRandomDropCellPositionGenerator._jinit(setmetatable({}, AnyRandomDropCellPositionGenerator))
end


-- throws Exception
function AnyRandomDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
        self.geographicMapInterface = geographicMapInterface
        local basicGeographicMapCellPositionFactory = geographicMapInterface:getGeographicMapCellPositionFactory()
        local randomFactory = MyRandomFactory.getInstance()
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local total = tiledLayer:getColumns() * tiledLayer:getRows()
        local randomColumn = 0
        local randomRow = 0
        local geographicMapCellPosition = nil
        do
            local index = total
            while (function() index = index - 1 return index end)() >= 0 do
            randomColumn = randomFactory:getAbsoluteNextInt(tiledLayer:getColumns())
            randomRow = randomFactory:getAbsoluteNextInt(tiledLayer:getRows())
            geographicMapCellPosition = basicGeographicMapCellPositionFactory:getAt(randomColumn, randomRow)
            if self:isDropAllowedAt(geographicMapCellPosition) then
                self.list:add(geographicMapCellPosition)
            end
            end
        end
end
java_overload(AnyRandomDropCellPositionGenerator, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) and (java_a2 == nil or java_is(java_a2, "BasicGeographicMap")) end)


-- throws Exception
function AnyRandomDropCellPositionGenerator:processTick(allBinaryLayerManager)
end
java_overload(AnyRandomDropCellPositionGenerator, "processTick", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)

return AnyRandomDropCellPositionGenerator

