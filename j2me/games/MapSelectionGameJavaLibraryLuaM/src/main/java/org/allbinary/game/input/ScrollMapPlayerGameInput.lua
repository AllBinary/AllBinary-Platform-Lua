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
-- package org.allbinary.game.input

local ScrollMapPlayerGameInput = {}
package.loaded["org.allbinary.game.input.ScrollMapPlayerGameInput"] = ScrollMapPlayerGameInput

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local ScrollMapEvent = java_lazy("org.allbinary.layer.event.ScrollMapEvent")
local ScrollMapEventHandler = java_lazy("org.allbinary.layer.event.ScrollMapEventHandler")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local GameInputProcessor = java_lazy("org.allbinary.game.input.GameInputProcessor")
local GameInputProcessorUtil = java_lazy("org.allbinary.game.input.GameInputProcessorUtil")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local ScrollMapDownGameInputProcessor = java_lazy("org.allbinary.game.input.ScrollMapDownGameInputProcessor")
local ScrollMapLeftGameInputProcessor = java_lazy("org.allbinary.game.input.ScrollMapLeftGameInputProcessor")
local ScrollMapRightGameInputProcessor = java_lazy("org.allbinary.game.input.ScrollMapRightGameInputProcessor")
local ScrollMapUpGameInputProcessor = java_lazy("org.allbinary.game.input.ScrollMapUpGameInputProcessor")

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

-- class table ScrollMapPlayerGameInput is declared before the requires
ScrollMapPlayerGameInput.__index = ScrollMapPlayerGameInput
ScrollMapPlayerGameInput.className = "ScrollMapPlayerGameInput"
ScrollMapPlayerGameInput.javaClassName = "org.allbinary.game.input.ScrollMapPlayerGameInput"
setmetatable(ScrollMapPlayerGameInput, {__index = PlayerGameInput})

function ScrollMapPlayerGameInput:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.border = 150
    if self.inputList == nil then self.inputList = nil end
    self.isSingleKeyProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) or Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)
    if self.geographicMapInterface == nil then self.geographicMapInterface = nil end
    if self.maxBottom == nil then self.maxBottom = 0 end
    if self.maxRight == nil then self.maxRight = 0 end
    self.scrollMapEvent = ScrollMapEvent.new(self)
end


function ScrollMapPlayerGameInput._jinit(self, geographicMapInterface, list, playerInputId)
    java_super_init(PlayerGameInput, self, list, BasicArrayListD.new(), playerInputId)
    ScrollMapPlayerGameInput._init_fields(self)
        -- super(...) made self above
        self:initInputProcessors()
        self.geographicMapInterface = geographicMapInterface
        self.inputList = list
        self:init()
    return self
end

function ScrollMapPlayerGameInput.new(...)
    local self = setmetatable({}, ScrollMapPlayerGameInput)
    ScrollMapPlayerGameInput._jinit(self, ...)
    return self
end


-- throws Exception
function ScrollMapPlayerGameInput:move(dx, dy)
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        terrainTiledLayer:moveDXY(-dx, -dy)
        self.scrollMapEvent:setDxDy(-dx, -dy)
        ScrollMapEventHandler.getInstance():fireEvent(self.scrollMapEvent)
end
java_overload(ScrollMapPlayerGameInput, "move", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function ScrollMapPlayerGameInput:init()
        self.maxBottom = self:getSpecialHeight()
        self.maxRight = self:getSpecialWidth()
end
java_overload(ScrollMapPlayerGameInput, "init", 0)


-- throws Exception
function ScrollMapPlayerGameInput:scrollMiddleX()
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        self:move(-terrainTiledLayer:getXP(), 0)
        if terrainTiledLayer:getWidth() < displayInfo:getLastWidth() then
            local diffX = ((((displayInfo:getLastWidth() - terrainTiledLayer:getWidth())) // (1 << (1))))
            self:move(-diffX, 0)
        else
            local diffX = ((((terrainTiledLayer:getWidth() - displayInfo:getLastWidth())) // (1 << (1))))
            self:move(diffX, 0)
        end
end
java_overload(ScrollMapPlayerGameInput, "scrollMiddleX", 0)


-- throws Exception
function ScrollMapPlayerGameInput:scrollY(anchor)
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if rawequal(anchor, Graphics.TOP) then
            self.logUtil:putF("Top", self, "scrollY")
        elseif rawequal(anchor, Graphics.BOTTOM) then
            self.logUtil:putF("Bottom", self, "scrollY")
            local diffY = (terrainTiledLayer:getHeight() - displayInfo:getLastHeight())
            self:move(0, diffY)
        elseif rawequal(anchor, Graphics.VCENTER) then
            self.logUtil:putF("Center", self, "scrollY")
            local diffY = (terrainTiledLayer:getHeight() - displayInfo:getLastHeight()) / 2
            self:move(0, diffY)
        else
            error(require("java.lang.Exception").new("No Such Anchor Supported"), 0)
        end
end
java_overload(ScrollMapPlayerGameInput, "scrollY", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function ScrollMapPlayerGameInput:up()
        local y = self.geographicMapInterface:getAllBinaryTiledLayer():getYP() - 10
        if self:keepOnMapMinY(y) then
            self:move(0, -10)
        end
end
java_overload(ScrollMapPlayerGameInput, "up", 0)


-- throws Exception
function ScrollMapPlayerGameInput:down()
        local y = -self.geographicMapInterface:getAllBinaryTiledLayer():getYP() + 10
        if self:keepOnMapMaxY(y) then
            self:move(0, 10)
        end
end
java_overload(ScrollMapPlayerGameInput, "down", 0)


-- throws Exception
function ScrollMapPlayerGameInput:right()
        local x = self.geographicMapInterface:getAllBinaryTiledLayer():getYP() + 10
        if self:keepOnMapMinX(x) then
            self:move(10, 0)
        end
end
java_overload(ScrollMapPlayerGameInput, "right", 0)


-- throws Exception
function ScrollMapPlayerGameInput:left()
        local x = -self.geographicMapInterface:getAllBinaryTiledLayer():getYP() - 10
        if self:keepOnMapMaxX(x) then
            self:move(-10, 0)
        end
end
java_overload(ScrollMapPlayerGameInput, "left", 0)


function ScrollMapPlayerGameInput:initInputProcessors()
        self.inputProcessorArray[Canvas.UP + 1] = ScrollMapUpGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.DOWN + 1] = ScrollMapDownGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM9 + 1] = ScrollMapRightGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM7 + 1] = ScrollMapLeftGameInputProcessor.new(self)
        GameInputProcessorUtil.init(self.inputProcessorArray)
end
java_overload(ScrollMapPlayerGameInput, "initInputProcessors", 0)


-- throws Exception
function ScrollMapPlayerGameInput:processInputKey(key)
        self.inputProcessorArray[key + 1]:processEvent(AllBinaryGameLayerManager.getNullInstance(), GameKeyEvent.NONE)
end
java_overload(ScrollMapPlayerGameInput, "processInputKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function ScrollMapPlayerGameInput:processInput(layerManager)
        local try_ok, try_error, try_value = pcall(function()
            local size = self.inputList:size()
            local key = 0
            for index = 0, size - 1 do
                local gameKeyEvent = self.inputList:get(index)
                key = gameKeyEvent:getKey()
                self:processInputKey(key)
            end
            if self.isSingleKeyProcessing then
                self:clear()
            else
                self:update()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
        end
end
java_overload(ScrollMapPlayerGameInput, "processInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function ScrollMapPlayerGameInput:getSpecialHeight()
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if terrainTiledLayer:getHeight() > displayInfo:getLastHeight() then
            return terrainTiledLayer:getHeight() - displayInfo:getLastHeight()
        else
            return displayInfo:getLastHeight() - terrainTiledLayer:getHeight() + terrainTiledLayer:getCellHeight()
        end
end
java_overload(ScrollMapPlayerGameInput, "getSpecialHeight", 0)


function ScrollMapPlayerGameInput:getSpecialWidth()
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if terrainTiledLayer:getWidth() > displayInfo:getLastWidth() then
            return terrainTiledLayer:getWidth() - displayInfo:getLastWidth()
        else
            return displayInfo:getLastWidth() - terrainTiledLayer:getWidth() + terrainTiledLayer:getCellWidth()
        end
end
java_overload(ScrollMapPlayerGameInput, "getSpecialWidth", 0)


function ScrollMapPlayerGameInput:keepOnMapMaxY(newY)
        local y = self.geographicMapInterface:getAllBinaryTiledLayer():getYP()
        if y > self.maxBottom + self.border then
            return false
        else
            return true
        end
end
java_overload(ScrollMapPlayerGameInput, "keepOnMapMaxY", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ScrollMapPlayerGameInput:keepOnMapMinY(newY)
        local y = self.geographicMapInterface:getAllBinaryTiledLayer():getYP()
        if y < -self.border then
            return false
        else
            return true
        end
end
java_overload(ScrollMapPlayerGameInput, "keepOnMapMinY", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ScrollMapPlayerGameInput:keepOnMapMaxX(newX)
        local x = self.geographicMapInterface:getAllBinaryTiledLayer():getXP()
        if x < -self.maxRight - self.border then
            return false
        else
            return true
        end
end
java_overload(ScrollMapPlayerGameInput, "keepOnMapMaxX", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ScrollMapPlayerGameInput:keepOnMapMinX(newX)
        local x = self.geographicMapInterface:getAllBinaryTiledLayer():getXP()
        if x > self.border then
            return false
        else
            return true
        end
end
java_overload(ScrollMapPlayerGameInput, "keepOnMapMinX", 1, function(java_a1) return true and type(java_a1) == "number" end)

return ScrollMapPlayerGameInput

