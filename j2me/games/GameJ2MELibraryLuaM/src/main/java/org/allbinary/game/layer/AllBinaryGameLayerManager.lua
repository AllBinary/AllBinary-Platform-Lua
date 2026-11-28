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
-- package org.allbinary.game.layer

local AllBinaryGameLayerManager = {}
package.loaded["org.allbinary.game.layer.AllBinaryGameLayerManager"] = AllBinaryGameLayerManager

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

local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local NullPlayerGameInputComposite = java_lazy("org.allbinary.game.input.NullPlayerGameInputComposite")
local PlayerGameInputCompositeInterface = java_lazy("org.allbinary.game.input.PlayerGameInputCompositeInterface")
local ItemColorFactory = java_lazy("org.allbinary.graphics.ItemColorFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LayerProcessor = java_lazy("org.allbinary.layer.LayerProcessor")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table AllBinaryGameLayerManager is declared before the requires
AllBinaryGameLayerManager.__index = AllBinaryGameLayerManager
AllBinaryGameLayerManager.className = "AllBinaryGameLayerManager"
AllBinaryGameLayerManager.javaClassName = "org.allbinary.game.layer.AllBinaryGameLayerManager"
setmetatable(AllBinaryGameLayerManager, {__index = AllBinaryLayerManager})

function AllBinaryGameLayerManager:_init_fields()
    if self.backgroundBasicColor == nil then self.backgroundBasicColor = nil end
    if self.foregroundBasicColor == nil then self.foregroundBasicColor = nil end
    if self.gameInfo == nil then self.gameInfo = nil end
    self.playerGameInputCompositeInterface = NullPlayerGameInputComposite.NULL_PLAYER_GAME_INPUT_COMPOSITE
end


function AllBinaryGameLayerManager.getNullInstance()
        if rawequal(AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER, NullUtil.getInstance().NULL_OBJECT) then
            AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER = AllBinaryGameLayerManager.new(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE, GameInfo.NONE)
        end
        return AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER
end


function AllBinaryGameLayerManager._jinit(self, backgroundBasicColor, foregroundBasicColor, gameInfo)
    java_super_init(AllBinaryLayerManager, self)
    AllBinaryGameLayerManager._init_fields(self)
        self.backgroundBasicColor = backgroundBasicColor
        self.foregroundBasicColor = foregroundBasicColor
        local itemColorFactory = ItemColorFactory.getInstance()
        itemColorFactory.INVERT_PAINT = math.tointeger(self.backgroundBasicColor // 1)
        itemColorFactory.PAINT = math.tointeger(self.foregroundBasicColor // 1)
        self.gameInfo = gameInfo
    return self
end

function AllBinaryGameLayerManager.new(...)
    local self = setmetatable({}, AllBinaryGameLayerManager)
    AllBinaryGameLayerManager._jinit(self, ...)
    return self
end


function AllBinaryGameLayerManager:getLayerManager()
        return self
end
java_overload(AllBinaryGameLayerManager, "getLayerManager", 0)


function AllBinaryGameLayerManager:init()
end
java_overload(AllBinaryGameLayerManager, "init", 0)


function AllBinaryGameLayerManager:getBackgroundBasicColor()
        return self.backgroundBasicColor
end
java_overload(AllBinaryGameLayerManager, "getBackgroundBasicColor", 0)


function AllBinaryGameLayerManager:setBackgroundBasicColor(backgroundBasicColor)
        self.backgroundBasicColor = backgroundBasicColor
        ItemColorFactory.getInstance().INVERT_PAINT = math.tointeger(self.backgroundBasicColor // 1)
end
java_overload(AllBinaryGameLayerManager, "setBackgroundBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryGameLayerManager:getForegroundBasicColor()
        return self.foregroundBasicColor
end
java_overload(AllBinaryGameLayerManager, "getForegroundBasicColor", 0)


function AllBinaryGameLayerManager:setForegroundBasicColor(foregroundBasicColor)
        self.foregroundBasicColor = foregroundBasicColor
        ItemColorFactory.getInstance().PAINT = math.tointeger(self.foregroundBasicColor // 1)
end
java_overload(AllBinaryGameLayerManager, "setForegroundBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function AllBinaryGameLayerManager:getGameInfo()
        return self.gameInfo
end
java_overload(AllBinaryGameLayerManager, "getGameInfo", 0)


function AllBinaryGameLayerManager:setGameInfo(gameInfo)
        self.gameInfo = gameInfo
end
java_overload(AllBinaryGameLayerManager, "setGameInfo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameInfo")) end)


function AllBinaryGameLayerManager:setLayerProcessorList(list)
        local layerProcessorInterfaceArray = java_new_array(nil, list:size())
        local size = (layerProcessorInterfaceArray.n or #layerProcessorInterfaceArray)
        for index = 0, size - 1 do
            layerProcessorInterfaceArray[index + 1] = list.objectArray[index + 1]
        end
        self:setLayerProcessorArray(layerProcessorInterfaceArray)
end
java_overload(AllBinaryGameLayerManager, "setLayerProcessorList", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function AllBinaryGameLayerManager:setPlayerGameInputCompositeInterface(playerGameInputCompositeInterface)
        self.playerGameInputCompositeInterface = playerGameInputCompositeInterface
end
java_overload(AllBinaryGameLayerManager, "setPlayerGameInputCompositeInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PlayerGameInputCompositeInterface")) end)


function AllBinaryGameLayerManager:getPlayerGameInputCompositeInterface()
        return self.playerGameInputCompositeInterface
end
java_overload(AllBinaryGameLayerManager, "getPlayerGameInputCompositeInterface", 0)

AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER = NullUtil.getInstance().NULL_OBJECT
AllBinaryGameLayerManager.ID = SmallIntegerSingletonFactory.getInstance():getAt(22)

return AllBinaryGameLayerManager

