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
-- package org.allbinary.graphics.displayable

local MyCanvas = {}
package.loaded["org.allbinary.graphics.displayable.MyCanvas"] = MyCanvas

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local MyCommandInterface = java_lazy("org.allbinary.graphics.displayable.command.MyCommandInterface")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local TouchJ2ME = java_lazy("org.allbinary.input.TouchJ2ME")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABStack = java_lazy("org.allbinary.util.ABStack")
local DisplayableInterface = require("org.allbinary.graphics.displayable.DisplayableInterface")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")

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

-- class table MyCanvas is declared before the requires
MyCanvas.__index = MyCanvas
MyCanvas.className = "MyCanvas"
MyCanvas.javaClassName = "org.allbinary.graphics.displayable.MyCanvas"
setmetatable(MyCanvas, {__index = Canvas})
MyCanvas.java_implements = " DisplayableInterface MyCommandInterface "
MyCanvas.java_interfaces = function() return {DisplayableInterface, MyCommandInterface} end

function MyCanvas:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.childNameList == nil then self.childNameList = nil end
    if self.commandStack == nil then self.commandStack = nil end
    self.commandListener = NullCommandListener.NULL_COMMAND_LISTENER
    if self.paused == nil then self.paused = false end
    self.touchME = TouchJ2ME.new()
end


function MyCanvas._jinit(self, name, childNameList)
    java_super_init(Canvas, self)
    MyCanvas._init_fields(self)
        self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        self.displayInfo:update(self, self.canvasStrings.CONSTRUCTOR)
        self.name_f = name
        self.childNameList = childNameList
        self.commandStack = StdUtil.getInstance():createStack()
    return self
end

function MyCanvas.new(...)
    local self = setmetatable({}, MyCanvas)
    MyCanvas._jinit(self, ...)
    return self
end


function MyCanvas:getWidth()
        return java_super(Canvas, "getWidth", 0)(self)
end
java_overload(MyCanvas, "getWidth", 0)


function MyCanvas:getHeight()
        return java_super(Canvas, "getHeight", 0)(self)
end
java_overload(MyCanvas, "getHeight", 0)


function MyCanvas:setFullScreenMode(mode)
        java_super(Canvas, "setFullScreenMode", 1)(self, mode)
        self.displayInfo:update(self, self.canvasStrings.SET_FULL_SCREEN_MODE)
end
java_overload(MyCanvas, "setFullScreenMode", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function MyCanvas:sizeChanged(w, h)
        self.displayInfo:update(self, self.canvasStrings.SIZE_CHANGED)
end
java_overload(MyCanvas, "sizeChanged", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:getCommandStack()
        return self.commandStack
end
java_overload(MyCanvas, "getCommandStack", 0)


function MyCanvas:isCommand(command)
        return self.commandStack:contains(command)
end
java_overload(MyCanvas, "isCommand", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Command")) end)


function MyCanvas:addCommand(command)
        if not self.commandStack:contains(command) then
            self.commandStack:push(command)
            java_super(Canvas, "addCommand", 1)(self, command)
        end
end
java_overload(MyCanvas, "addCommand", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Command")) end)


function MyCanvas:removeCommand(command)
        self.commandStack:removeElement(command)
        java_super(Canvas, "removeCommand", 1)(self, command)
end
java_overload(MyCanvas, "removeCommand", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Command")) end)


function MyCanvas:removeAllCommands()
        local size = self.commandStack:size()
        for index = 0, size - 1 do
            java_super(Canvas, "removeCommand", 1)(self, self.commandStack:pop())
        end
end
java_overload(MyCanvas, "removeAllCommands", 0)


function MyCanvas:setCommandListener(l)
        java_super(Canvas, "setCommandListener", 1)(self, l)
        self.commandListener = l
end
java_overload(MyCanvas, "setCommandListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function MyCanvas:getCustomCommandListener()
        return self.commandListener
end
java_overload(MyCanvas, "getCustomCommandListener", 0)


function MyCanvas:isPaused()
        return self.paused
end
java_overload(MyCanvas, "isPaused", 0)


function MyCanvas:removePauseCommand()
        self:removeCommand(MyCommandsFactory.getInstance().PAUSE_COMMAND)
end
java_overload(MyCanvas, "removePauseCommand", 0)


function MyCanvas:pause()
        self.logUtil:putF(self.commonStrings.START, self, self.canvasStrings.PAUSE)
        self:removePauseCommand()
        self:addCommand(MyCommandsFactory.getInstance().RESUME_COMMAND)
        self:setPaused(true)
end
java_overload(MyCanvas, "pause", 0)


function MyCanvas:unPause()
        self.logUtil:putF(self.commonStrings.START, self, self.canvasStrings.UN_PAUSE)
        self:removeCommand(MyCommandsFactory.getInstance().RESUME_COMMAND)
        self:addCommand(MyCommandsFactory.getInstance().PAUSE_COMMAND)
        self:setPaused(false)
end
java_overload(MyCanvas, "unPause", 0)


-- throws Exception
function MyCanvas:process()
        self.displayInfo:process()
end
java_overload(MyCanvas, "process", 0)


function MyCanvas:paint(graphics)
end
java_overload(MyCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function MyCanvas:draw(graphics)
end
java_overload(MyCanvas, "draw", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function MyCanvas:hasChild(displayable)
        return self.childNameList:contains(displayable.name_f)
end
java_overload(MyCanvas, "hasChild", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MyCanvas")) end)


function MyCanvas:destroy()
        self.logUtil:putF("Destroyed MyCanvas", self, "destroy")
end
java_overload(MyCanvas, "destroy", 0)


function MyCanvas:setPaused(isPaused)
        self.paused = isPaused
end
java_overload(MyCanvas, "setPaused", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function MyCanvas:keyPressedByDevice(keyCode, deviceId)
end
java_overload(MyCanvas, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:keyRepeatedByDevice(keyCode, deviceId)
end
java_overload(MyCanvas, "keyRepeatedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:keyReleasedByDevice(keyCode, deviceId)
end
java_overload(MyCanvas, "keyReleasedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:pointerDragged(x, y)
        self.touchME:pointerDragged(x, y)
end
java_overload(MyCanvas, "pointerDragged", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:pointerPressed(x, y)
        self.touchME:pointerPressed(x, y)
end
java_overload(MyCanvas, "pointerPressed", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:pointerReleased(x, y)
        self.touchME:pointerReleased(x, y)
end
java_overload(MyCanvas, "pointerReleased", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function MyCanvas:nextSong(nextSongSound, leftVolume, rightVolume)
end
java_overload(MyCanvas, "nextSong", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Sound")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return MyCanvas

