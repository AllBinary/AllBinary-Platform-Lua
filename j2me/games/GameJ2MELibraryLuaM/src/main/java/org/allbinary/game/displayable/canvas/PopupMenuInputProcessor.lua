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
-- package org.allbinary.game.displayable.canvas

local PopupMenuInputProcessor = {}
package.loaded["org.allbinary.game.displayable.canvas.PopupMenuInputProcessor"] = PopupMenuInputProcessor

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
local GameInputStrings = java_lazy("org.allbinary.game.input.GameInputStrings")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local RectangleCollisionUtil = java_lazy("org.allbinary.math.RectangleCollisionUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicMenuInputProcessor = require("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")

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

-- class table PopupMenuInputProcessor is declared before the requires
PopupMenuInputProcessor.__index = PopupMenuInputProcessor
PopupMenuInputProcessor.className = "PopupMenuInputProcessor"
PopupMenuInputProcessor.javaClassName = "org.allbinary.game.displayable.canvas.PopupMenuInputProcessor"
setmetatable(PopupMenuInputProcessor, {__index = BasicMenuInputProcessor})

function PopupMenuInputProcessor:_init_fields()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.CLICK_DELAY = 120
    self.clickTimeHelper = TimeDelayHelper.new(self.CLICK_DELAY)
    if self.rectangle == nil then self.rectangle = nil end
end


function PopupMenuInputProcessor._jinit(self, gameKeyEventList, playerInputId, gameCanvas, rectangle)
    java_super_init(BasicMenuInputProcessor, self, gameKeyEventList, playerInputId, gameCanvas)
    PopupMenuInputProcessor._init_fields(self)
        -- super(...) made self above
        self.rectangle = rectangle
    return self
end

function PopupMenuInputProcessor.new(...)
    local self = setmetatable({}, PopupMenuInputProcessor)
    PopupMenuInputProcessor._jinit(self, ...)
    return self
end


function PopupMenuInputProcessor:init(rectangle)
        self.rectangle = rectangle
end
java_overload(PopupMenuInputProcessor, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Rectangle")) end)


-- throws Exception
function PopupMenuInputProcessor:processInput(key)
        if rawequal(key, Canvas.KEY_STAR) then
            local gameCanvas = self:getCanvas()
            gameCanvas:toggleMenu()
            return 1
        end
        return 0
end
java_overload(PopupMenuInputProcessor, "processInput", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function PopupMenuInputProcessor:processInputList()
        local try_ok, try_error, try_value = pcall(function()
            local motionInputsIndex = self:processMotionInputs()
            local list = self:getGameKeyEventList()
            local size = list:size()
            local key = 0
            local gameKeyEvent = nil
            for index = 0, size - 1 do
                gameKeyEvent = list.objectArray[index + 1]
                if not rawequal(gameKeyEvent, nil) then
                    key = gameKeyEvent:getKey()
                    if rawequal(self:processInput(key), 1) then
                        break
                    end
                end
            end
            self:clear()
            if size > 0 or motionInputsIndex >= 0 then
                do return "__jreturn", 1 end
            else
                do return "__jreturn", -1 end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, GameInputStrings.getInstance().PROCESS_INPUT, e)
            return -1
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PopupMenuInputProcessor, "processInputList", 0)


-- throws Exception
function PopupMenuInputProcessor:processMotionInputs()
        local lastIndex = self.motionGestureEventList:size() - 1
        if lastIndex >= 0 then
            local motionGestureEvent = self.motionGestureEventList.objectArray[lastIndex + 1]
            self:processMotionInput(motionGestureEvent)
        end
        self.motionGestureEventList:clear()
        return lastIndex
end
java_overload(PopupMenuInputProcessor, "processMotionInputs", 0)


-- throws Exception
function PopupMenuInputProcessor:processMotionInput(motionGestureEvent)
        if rawequal(motionGestureEvent, nil) then
            self.logUtil:putF("Exception: Bug", self, self.gameInputStrings.PROCESS_MOTION_INPUT)
            return
        end
        local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
        local motionGestureInput = motionGestureEvent:getMotionGesture()
        if rawequal(motionGestureInput, touchMotionGestureFactory.RELEASED) then
            local point = motionGestureEvent:getCurrentPoint()
            local rectPoint = self.rectangle:getPoint()
            if self.rectangleCollisionUtil:isInside(rectPoint:getX(), rectPoint:getY(), self.rectangle:getMaxX() + 20, self.rectangle:getMaxY(), point:getX(), point:getY()) then
                if self.clickTimeHelper:isTimeTNT() then
                    local gameCanvas = self:getCanvas()
                    gameCanvas:toggleMenu()
                end
            end
        end
end
java_overload(PopupMenuInputProcessor, "processMotionInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MotionGestureEvent")) end)

return PopupMenuInputProcessor

