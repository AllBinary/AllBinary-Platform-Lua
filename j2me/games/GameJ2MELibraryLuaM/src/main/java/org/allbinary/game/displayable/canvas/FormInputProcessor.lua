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

local FormInputProcessor = {}
package.loaded["org.allbinary.game.displayable.canvas.FormInputProcessor"] = FormInputProcessor

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
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyEventSourceInterface = java_lazy("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local Input = java_lazy("org.allbinary.game.input.Input")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local InputProcessor = require("org.allbinary.game.input.InputProcessor")
local PlatformKeyFactory = java_lazy("org.allbinary.game.input.PlatformKeyFactory")
local DownKeyEventHandler = java_lazy("org.allbinary.game.input.event.DownKeyEventHandler")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local UpGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.UpGameKeyEventHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
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

-- class table FormInputProcessor is declared before the requires
FormInputProcessor.__index = FormInputProcessor
FormInputProcessor.className = "FormInputProcessor"
FormInputProcessor.javaClassName = "org.allbinary.game.displayable.canvas.FormInputProcessor"
setmetatable(FormInputProcessor, {__index = InputProcessor})

function FormInputProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.downKeyEventHandler = DownKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.inputFactory = InputFactory.getInstance()
    self.platformKeyFactory = PlatformKeyFactory.getInstance()
    if self.allBinaryGameCanvas == nil then self.allBinaryGameCanvas = nil end
end


function FormInputProcessor._jinit(self, allBinaryGameCanvas)
    java_super_init(InputProcessor, self)
    FormInputProcessor._init_fields(self)
        self.allBinaryGameCanvas = allBinaryGameCanvas
    return self
end

function FormInputProcessor.new(...)
    local self = setmetatable({}, FormInputProcessor)
    FormInputProcessor._jinit(self, ...)
    return self
end


function FormInputProcessor:keyPressedByDevice(keyCode, deviceId)
        local try_ok, try_error, try_value = pcall(function()
            PreLogUtil.put(tostring(StringMaker.new():append(self.inputFactory.KEY_CODE_LABEL):appendint(keyCode):append(CommonSeps.getInstance().SPACE):append(self.inputFactory.DEVICE_ID_LABEL):appendint(deviceId)), self, self.gameInputStrings.KEY_PRESSED)
            local input = self.inputFactory:getInstanceById(keyCode)
            local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self.allBinaryGameCanvas, input)
            self.downKeyEventHandler:fireEventForGameKeyEvent(gameKeyEvent)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end
java_overload(FormInputProcessor, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function FormInputProcessor:keyReleasedByDevice(canvas, keyCode, deviceId)
        local try_ok, try_error, try_value = pcall(function()
            local input = self.inputFactory:getInstanceById(keyCode)
            if self.platformKeyFactory:isEnter(input) then
                PreLogUtil.put(tostring(StringMaker.new():append(self.inputFactory.KEY_CODE_LABEL):appendint(keyCode):append(CommonSeps.getInstance().SPACE):append(self.inputFactory.DEVICE_ID_LABEL):appendint(deviceId)), self, self.gameInputStrings.KEY_RELEASED)
                local gameKey = GameKeyFactory.getInstance().KEY_NUM0
                local gameKeyEventSourceInterface = canvas
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(gameKeyEventSourceInterface, gameKey)
                self.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end
java_overload(FormInputProcessor, "keyReleasedByDevice", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Canvas")) and type(java_a2) == "number" and type(java_a3) == "number" end)

return FormInputProcessor

