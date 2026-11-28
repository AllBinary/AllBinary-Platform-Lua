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

local CommandFormInputProcessor = {}
package.loaded["org.allbinary.game.displayable.canvas.CommandFormInputProcessor"] = CommandFormInputProcessor

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
local Command = java_lazy("javax.microedition.lcdui.Command")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local SWTUtil = java_lazy("org.allbinary.game.layer.SWTUtil")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local CommandCurrentSelectionForm = java_lazy("org.allbinary.graphics.form.CommandCurrentSelectionForm")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local TouchMotionGestureFactory = java_lazy("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local MotionGestureEvent = java_lazy("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PrimaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SelectSound = java_lazy("org.allbinary.media.audio.SelectSound")
local PrimaryThreadPool = java_lazy("org.allbinary.thread.PrimaryThreadPool")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicMenuInputProcessor = require("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")
local CommandRunnable = java_lazy("org.allbinary.game.displayable.canvas.CommandRunnable")

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

--In general allow scrolling of the menu and selection the center item
-- class table CommandFormInputProcessor is declared before the requires
CommandFormInputProcessor.__index = CommandFormInputProcessor
CommandFormInputProcessor.className = "CommandFormInputProcessor"
CommandFormInputProcessor.javaClassName = "org.allbinary.game.displayable.canvas.CommandFormInputProcessor"
setmetatable(CommandFormInputProcessor, {__index = BasicMenuInputProcessor})

function CommandFormInputProcessor:_init_fields()
    self.MOTION_GESTURE_SOURCE_ID = GameKeyEventFactory.getInstance().MOTION_GESTURE_SOURCE_ID
    self.CLICK_DELAY = 150
    self.clickTimeHelper = TimeDelayHelper.new(self.CLICK_DELAY)
    self.DOUBLE_CLICK_DELAY = 1200
    self.doubleClickTimeHelper = TimeDelayHelper.new(self.DOUBLE_CLICK_DELAY)
    self.isSingleKeyProcessing = InputFeatureFactory.getInstance():isSingleKeyProcessing()
    if self.form == nil then self.form = nil end
    self.hasPressed = false
    self.PROCESS_COMMAND = "processCommand"
    self.NAME_LABEL = " ScrollSelectionForm: "
end


function CommandFormInputProcessor._jinit(self, gameKeyEventList, playerInputId, gameCanvas, form)
    java_super_init(BasicMenuInputProcessor, self, gameKeyEventList, playerInputId, gameCanvas)
    CommandFormInputProcessor._init_fields(self)
        -- super(...) made self above
        self.form = form
    return self
end

function CommandFormInputProcessor.new(...)
    local self = setmetatable({}, CommandFormInputProcessor)
    CommandFormInputProcessor._jinit(self, ...)
    return self
end


-- throws Exception
function CommandFormInputProcessor:processInput(key)
        if rawequal(key, Canvas.LEFT) or rawequal(key, Canvas.RIGHT) or rawequal(key, Canvas.UP) or rawequal(key, Canvas.DOWN) then
            PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
            self.form:processInputKey(key)
            return 1
        elseif rawequal(key, Canvas.FIRE) then
            PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
            return self:processCommand()
        end
        return 0
end
java_overload(CommandFormInputProcessor, "processInput", 1, function(java_a1) return true and type(java_a1) == "number" end)


function CommandFormInputProcessor:processCommand()
        local commandCurrentSelectionForm = self.form
        local command = commandCurrentSelectionForm:getSelectedCommand()
        self.logUtil:putF(tostring(command), self, self.PROCESS_COMMAND)
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if SWTUtil.isSWT and features:isFeature(openGLFeatureFactory.OPENGL) and not rawequal(command, GameCommandsFactory.getInstance().EXIT_COMMAND) then
            CommandRunnable.new(self, command):run()
        else
            PrimaryThreadPool.getInstance():runTask(CommandRunnable.new(self, command))
        end
        if rawequal(command, GameCommandsFactory.getInstance().QUIT_COMMAND) then
            return -1
        else
            return 1
        end
end
java_overload(CommandFormInputProcessor, "processCommand", 0)


-- throws Exception
function CommandFormInputProcessor:processInputList()
        local try_ok, try_error, try_value = pcall(function()
            local motionInputsIndex = self:processMotionInputs()
            local list = self:getGameKeyEventList()
            local size = list:size()
            local key = 0
            local gameKeyEvent = nil
            for index = 0, size - 1 do
                gameKeyEvent = list.objectArray[index + 1]
                key = gameKeyEvent:getKey()
                if not rawequal(gameKeyEvent:getSourceId(), self.MOTION_GESTURE_SOURCE_ID) then
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
            return -1
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(CommandFormInputProcessor, "processInputList", 0)


-- throws Exception
function CommandFormInputProcessor:processMotionInputs()
        local lastIndex = self.motionGestureEventList:size() - 1
        if lastIndex >= 0 then
            local motionGestureEvent = self.motionGestureEventList.objectArray[lastIndex + 1]
            self:processMotionInput(motionGestureEvent)
        end
        self.motionGestureEventList:clear()
        return lastIndex
end
java_overload(CommandFormInputProcessor, "processMotionInputs", 0)


-- throws Exception
function CommandFormInputProcessor:processMotionInput(motionGestureEvent)
        local touchMotionGestureFactory = TouchMotionGestureFactory.getInstance()
        local motionGestureInput = motionGestureEvent:getMotionGesture()
        if rawequal(motionGestureInput, touchMotionGestureFactory.RELEASED) then
            local point = motionGestureEvent:getCurrentPoint()
            if self.form:isInForm(point) then
                local index = self.form:getSelectedIndexForPoint(point)
                if not rawequal(index, -1) then
                    PrimaryPlayerQueueFactory.getInstance():add(SelectSound.getInstance())
                    if rawequal(index, self.form:getSelectedIndex()) then
                        if self.clickTimeHelper:isTimeTNT() then
                            self:processCommand()
                        end
                    else
                        self.form:setSelectedIndex(index)
                    end
                else
                end
            end
            if self.hasPressed then
                if not (self.doubleClickTimeHelper:isTimeTNT()) then
                    self.logUtil:putF("Double Press", self, self.gameInputStrings.PROCESS_MOTION_INPUT)
                    self:processCommand()
                end
                self.doubleClickTimeHelper.delay = self.DOUBLE_CLICK_DELAY
                self.doubleClickTimeHelper:setStartTimeTNT()
            end
            self.hasPressed = false
        elseif rawequal(motionGestureInput, touchMotionGestureFactory.PRESSED) then
            self.doubleClickTimeHelper.delay = 0
            self.hasPressed = true
        end
end
java_overload(CommandFormInputProcessor, "processMotionInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MotionGestureEvent")) end)


function CommandFormInputProcessor:toString()
        return tostring(StringMaker.new():append(tostring(BasicMenuInputProcessor)):append(self.NAME_LABEL):append(tostring(self.form)))
end
java_overload(CommandFormInputProcessor, "toString", 0)
CommandFormInputProcessor.__tostring = function(self) return self:toString() end

return CommandFormInputProcessor

