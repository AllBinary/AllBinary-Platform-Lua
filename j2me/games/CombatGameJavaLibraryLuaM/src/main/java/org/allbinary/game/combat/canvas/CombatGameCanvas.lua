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
-- package org.allbinary.game.combat.canvas

local CombatGameCanvas = {}
package.loaded["org.allbinary.game.combat.canvas.CombatGameCanvas"] = CombatGameCanvas

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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local DestroyedLayerProcessor = java_lazy("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local DestroyEventCircularStaticPool = java_lazy("org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool")
local DestroyedEventHandler = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local BasicBuildGameInitializerFactory = java_lazy("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local DropLayerProcessor = java_lazy("org.allbinary.game.layer.drop.DropLayerProcessor")
local GroupLayerManagerListener = java_lazy("org.allbinary.game.layer.identification.GroupLayerManagerListener")
local HighScoresFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresFactoryInterface")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicLayerProcessor = java_lazy("org.allbinary.layer.BasicLayerProcessor")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

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

-- class table CombatGameCanvas is declared before the requires
CombatGameCanvas.__index = CombatGameCanvas
CombatGameCanvas.className = "CombatGameCanvas"
CombatGameCanvas.javaClassName = "org.allbinary.game.combat.canvas.CombatGameCanvas"
setmetatable(CombatGameCanvas, {__index = AllBinaryGameCanvas})


function CombatGameCanvas._jinit(self, cmdListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered)
    java_super_init(AllBinaryGameCanvas, self, cmdListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered)
        -- super(...) made self above
    return self
end

function CombatGameCanvas.new(...)
    local self = setmetatable({}, CombatGameCanvas)
    CombatGameCanvas._jinit(self, ...)
    return self
end


function CombatGameCanvas:CombatGameCanvas_init()
        DestroyEventCircularStaticPool.getInstance():init(self)
        ProgressCanvasFactory.getInstance():addNormalPortion(50, "Destroy Events")
end
java_overload(CombatGameCanvas, "CombatGameCanvas_init", 0)


-- throws Exception
function CombatGameCanvas:initApp(abeClientInformation)
        self:CombatGameCanvas_init()
        java_super(AllBinaryGameCanvas, "initApp", 1)(self, abeClientInformation)
end
java_overload(CombatGameCanvas, "initApp", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)


function CombatGameCanvas:initConfigurablePortion(portion)
        DestroyedLayerProcessor.init()
        ProgressCanvasFactory.getInstance():addNormalPortion(portion, "Basic Processors")
        local features = Features.getInstance()
        local gameFeatureFactory = GameFeatureFactory.getInstance()
        if features:isFeature(gameFeatureFactory.DROPPED_ITEMS) and features:isFeature(gameFeatureFactory.DROPPED_ITEMS_FROM_DEATH) then
            CombatGameCanvas.basicLayerProcessor = java_new_array(nil, 2)
            CombatGameCanvas.basicLayerProcessor[1] = DestroyedLayerProcessor.getInstance()
            CombatGameCanvas.basicLayerProcessor[2] = DropLayerProcessor.getInstance()
        else
            CombatGameCanvas.basicLayerProcessor = java_new_array(nil, 1)
            CombatGameCanvas.basicLayerProcessor[1] = DestroyedLayerProcessor.getInstance()
        end
end
java_overload(CombatGameCanvas, "initConfigurablePortion", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function CombatGameCanvas:processPlayingGame()
        java_super(AllBinaryGameCanvas, "processPlayingGame", 0)(self)
        do
            local index = (CombatGameCanvas.basicLayerProcessor.n or #CombatGameCanvas.basicLayerProcessor)
            while (function() index = index - 1 return index end)() >= 0 do
            CombatGameCanvas.basicLayerProcessor[index + 1]:process(self.gameLayerManager)
            end
        end
end
java_overload(CombatGameCanvas, "processPlayingGame", 0)


-- throws Exception
function CombatGameCanvas:cleanupGame()
        java_super(AllBinaryGameCanvas, "cleanupGame", 0)(self)
        do
            local index = (CombatGameCanvas.basicLayerProcessor.n or #CombatGameCanvas.basicLayerProcessor)
            while (function() index = index - 1 return index end)() >= 0 do
            CombatGameCanvas.basicLayerProcessor[index + 1]:getList():clear()
            end
        end
        GroupLayerManagerListener.getInstance():clear()
        GroupLayerManagerListener.getInstance():log()
        DestroyedEventHandler.getInstance():removeAllListeners()
        self:cleanupManager()
end
java_overload(CombatGameCanvas, "cleanupGame", 0)


-- throws Exception
function CombatGameCanvas:cleanupManager()
        self.gameLayerManager:cleanup()
end
java_overload(CombatGameCanvas, "cleanupManager", 0)

CombatGameCanvas.basicLayerProcessor = java_new_array(nil, 0)

return CombatGameCanvas

