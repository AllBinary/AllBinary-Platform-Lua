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
-- package org.allbinary.game.behavior.topview.placement

local PropsTileMapPlacementVisitor = {}
package.loaded["org.allbinary.game.behavior.topview.placement.PropsTileMapPlacementVisitor"] = PropsTileMapPlacementVisitor

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

local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TileLayer = java_lazy("org.mapeditor.core.TileLayer")
local TiledMap = java_lazy("org.mapeditor.core.TiledMap")
local TileMapPlacementVisitor = require("org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor")

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

-- class table PropsTileMapPlacementVisitor is declared before the requires
PropsTileMapPlacementVisitor.__index = PropsTileMapPlacementVisitor
PropsTileMapPlacementVisitor.className = "PropsTileMapPlacementVisitor"
PropsTileMapPlacementVisitor.javaClassName = "org.allbinary.game.behavior.topview.placement.PropsTileMapPlacementVisitor"
setmetatable(PropsTileMapPlacementVisitor, {__index = TileMapPlacementVisitor})

function PropsTileMapPlacementVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.randomFactory = MyRandomFactory.getInstance()
end

function PropsTileMapPlacementVisitor._jinit(self)
    java_super_init(TileMapPlacementVisitor, self)
    PropsTileMapPlacementVisitor._init_fields(self)
    return self
end

function PropsTileMapPlacementVisitor.new()
    return PropsTileMapPlacementVisitor._jinit(setmetatable({}, PropsTileMapPlacementVisitor))
end


function PropsTileMapPlacementVisitor:visit(lastMap, mapData)
        local layerIndex = 0
        local tileLayer = (lastMap:getLayer(layerIndex))
        local mapArray = tileLayer:getMapArray()
        local size = (mapData.n or #mapData)
        local size2 = (mapData[1].n or #mapData[1])
        for index = 0, size - 1 do
            for index2 = 0, size2 - 1 do
                if mapArray[index + 1][index2 + 1] == 14 then
                else
                    self:visit2(mapArray, mapData, index, index2)
                end
                if math.fmod(index, 7) == 0 then
                    if mapArray[index + 1][index2 + 1] == 19 then
                        local randomInt = self.randomFactory:getAbsoluteNextIntAllowZero(3)
                        if randomInt == 0 then
                            mapData[index + 1][index2 + 1] = 1
                        elseif randomInt == 1 then
                            mapData[index + 1][index2 + 1] = 81
                        elseif randomInt == 2 then
                            mapData[index + 1][index2 + 1] = 97
                        end
                    elseif mapArray[index + 1][index2 + 1] == 17 then
                        local randomInt = self.randomFactory:getAbsoluteNextIntAllowZero(3)
                        if randomInt == 0 then
                            mapData[index + 1][index2 + 1] = 17
                        elseif randomInt == 1 then
                            mapData[index + 1][index2 + 1] = 81
                        elseif randomInt == 2 then
                            mapData[index + 1][index2 + 1] = 97
                        end
                    end
                end
                if math.fmod(index2, 7) == 0 then
                    if mapArray[index + 1][index2 + 1] == 34 then
                        local randomInt = self.randomFactory:getAbsoluteNextIntAllowZero(4)
                        if randomInt == 0 then
                            mapData[index + 1][index2 + 1] = 33
                        elseif randomInt == 1 then
                            mapData[index + 1][index2 + 1] = 65
                        elseif randomInt == 2 then
                            mapData[index + 1][index2 + 1] = 81
                        elseif randomInt == 3 then
                            mapData[index + 1][index2 + 1] = 97
                        end
                    end
                end
            end
        end
end
java_overload(PropsTileMapPlacementVisitor, "visit", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "TiledMap")) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) end)


function PropsTileMapPlacementVisitor:visit2(mapArray, mapData, index, index2)
        local commonStrings = CommonStrings.getInstance()
        local countX = 0
        local countY = 0
        local index3 = index - 1
        for index4 = index2 - 1, 0 + 1, -1 do
            index3 = index3 - 1
            if index3 < 0 or index4 < 0 then
                return
            end
            if mapArray[index3 + 1][index4 + 1] ~= 14 or mapData[index3 + 1][index4 + 1] ~= 0 then
                if countX > 10 and countY > 10 then
                    for index5 = index3 + 1, index - 1 - 1 do
                        for index6 = index4 + 1, index2 - 1 - 1 do
                            if mapArray[index5 + 1][index6 + 1] ~= 14 or mapData[index5 + 1][index6 + 1] ~= 0 then
                                return
                            end
                        end
                    end
                    local x = index - (java_idiv(countX, 2))
                    local y = index2 - (java_idiv(countY, 2))
                    if x >= 0 and y >= 0 and x < (mapData.n or #mapData) and y < (mapData[1].n or #mapData[1]) then
                    end
                end
                return
            end
            countY = countY + 1
            countX = countX + 1
        end
end
java_overload(PropsTileMapPlacementVisitor, "visit2", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) and type(java_a3) == "number" and type(java_a4) == "number" end)

return PropsTileMapPlacementVisitor

