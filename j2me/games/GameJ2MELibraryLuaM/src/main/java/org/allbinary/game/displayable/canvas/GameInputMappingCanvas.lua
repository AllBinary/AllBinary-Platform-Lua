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

local GameInputMappingCanvas = {}
package.loaded["org.allbinary.game.displayable.canvas.GameInputMappingCanvas"] = GameInputMappingCanvas

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

local Command = java_lazy("javax.microedition.lcdui.Command")
local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local Input = java_lazy("org.allbinary.game.input.Input")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local PlatformInputMappingFactory = java_lazy("org.allbinary.game.input.PlatformInputMappingFactory")
local InputMappingInterface = java_lazy("org.allbinary.game.input.mapping.InputMappingInterface")
local PersistentInputMapping = java_lazy("org.allbinary.game.input.mapping.PersistentInputMapping")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = java_lazy("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = java_lazy("org.allbinary.game.paint.ColorFillPaintableFactory")
local HelpPaintable = java_lazy("org.allbinary.game.paint.help.HelpPaintable")
local InputMappingHelpPaintable = java_lazy("org.allbinary.game.paint.help.InputMappingHelpPaintable")
local ProcessPaintable = java_lazy("org.allbinary.graphics.paint.ProcessPaintable")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")
local GameInputMappingInstructionsCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas")

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

-- class table GameInputMappingCanvas is declared before the requires
GameInputMappingCanvas.__index = GameInputMappingCanvas
GameInputMappingCanvas.className = "GameInputMappingCanvas"
GameInputMappingCanvas.javaClassName = "org.allbinary.game.displayable.canvas.GameInputMappingCanvas"
setmetatable(GameInputMappingCanvas, {__index = GameCommandCanvas})
GameInputMappingCanvas.java_implements = " InputMappingInterface "
GameInputMappingCanvas.java_interfaces = function() return {InputMappingInterface} end

function GameInputMappingCanvas:_init_fields()
    if self.paintable == nil then self.paintable = nil end
    if self.helpPaintable == nil then self.helpPaintable = nil end
    if self.colorFillPaintable == nil then self.colorFillPaintable = nil end
    if self.inputMapping == nil then self.inputMapping = nil end
    self.NONE = GameKeyFactory.getInstance().NONE
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    self.selectedGameKey = self.NONE
    self.selectedInput = self.NONE
    self.inputFactory = InputFactory.getInstance()
end


function GameInputMappingCanvas._jinit(self, abeClientInformation, commandListener, allBinaryGameLayerManager, helpPaintable)
    java_super_init(GameCommandCanvas, self, commandListener, GameInputMappingCanvas.NAME, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor())
    GameInputMappingCanvas._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        if rawequal(helpPaintable, nil) then
            error(require("java.lang.Exception").new("Help Paintable Exception"), 0)
        end
        self.abeClientInformation = abeClientInformation
        self.helpPaintable = helpPaintable
        self.inputMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance()
        self.paintable = ProcessPaintable.new()
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
    return self
end

function GameInputMappingCanvas.new(...)
    local self = setmetatable({}, GameInputMappingCanvas)
    GameInputMappingCanvas._jinit(self, ...)
    return self
end


-- throws Exception
function GameInputMappingCanvas:close()
        java_super(GameCommandCanvas, "close", 0)(self)
        self.paintable:process()
        self.selectedGameKey = self.NONE
        self.selectedInput = self.NONE
        self:update()
end
java_overload(GameInputMappingCanvas, "close", 0)


function GameInputMappingCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:addCommand(GameInputMappingCanvas.DEFAULT)
        self:addCommand(GameInputMappingInstructionsCanvas.DISPLAY)
        self:setCommandListener(cmdListener)
end
java_overload(GameInputMappingCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function GameInputMappingCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end
java_overload(GameInputMappingCanvas, "keyPressed", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameInputMappingCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end
java_overload(GameInputMappingCanvas, "keyReleased", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameInputMappingCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end
java_overload(GameInputMappingCanvas, "keyRepeated", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameInputMappingCanvas:keyPressedByDevice(keyCode, deviceId)
        self:addGameKey(keyCode, false)
        java_super(GameCommandCanvas, "keyPressedByDevice", 2)(self, keyCode, 0)
end
java_overload(GameInputMappingCanvas, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function GameInputMappingCanvas:addGameKey(keyCode, repeated)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Raw Device Key Code: "):append(string.format("%x", keyCode))), self, self.gameInputStrings.ADD_KEY_EVENT)
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            local input = self.inputFactory:getInstanceById(keyCode)
            self:processInputMapping(gameKey, input)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end
java_overload(GameInputMappingCanvas, "addGameKey", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "boolean" end)


-- throws Exception
function GameInputMappingCanvas:processInputMapping(gameKey, input)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Start Passed GameKey: ")
        stringBuffer:append(self.stringUtil:toString(gameKey))
        stringBuffer:append(" Input: ")
        stringBuffer:append(self.stringUtil:toString(input))
        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.PROCESS)
        if not rawequal(self.selectedGameKey, self.NONE) then
            self:gameActionCrud(gameKey, input)
        else
            self:setSelectedAction(gameKey)
        end
end
java_overload(GameInputMappingCanvas, "processInputMapping", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GameKey")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


function GameInputMappingCanvas:setSelectedAction(gameKey)
        self.logUtil:putF(tostring(StringMaker.new():append("Selected GameKey: "):append(self.stringUtil:toString(gameKey))), self, "setSelectedAction")
        self.selectedGameKey = gameKey
        self.selectedInput = self.NONE
        self.helpPaintable:update(self.selectedGameKey, self.selectedInput)
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(GameInputMappingCanvas, "setSelectedAction", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKey")) end)


-- throws Exception
function GameInputMappingCanvas:gameActionCrud(gameKey, input)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Start GameKey: ")
        stringBuffer:append(self.stringUtil:toString(self.selectedGameKey))
        stringBuffer:append(" Input: ")
        stringBuffer:append(self.stringUtil:toString(self.selectedInput))
        self.logUtil:putF(tostring(stringBuffer), self, "gameActionCrud")
        if rawequal(self.selectedInput, self.NONE) then
            local list = self.inputMapping:getInputMapping():getMappedInput(self.selectedGameKey)
            local isInputAlreadyMappedToSelectedAction = list:contains(input)
            if isInputAlreadyMappedToSelectedAction then
                self.logUtil:putF(tostring(StringMaker.new():append("Already Mapped Input: "):append(self.stringUtil:toString(input))), self, "gameActionCrud")
                self.selectedInput = input
                self.helpPaintable:update(self.selectedGameKey, self.selectedInput)
                self.repaintBehavior:onChangeRepaint(self)
            else
                self:addNewMapping(gameKey, input)
            end
        elseif self.inputMapping:isDelete(input) then
            self:deleteCurrentMapping()
        else
            self:setSelectedAction(gameKey)
        end
end
java_overload(GameInputMappingCanvas, "gameActionCrud", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GameKey")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


-- throws Exception
function GameInputMappingCanvas:addNewMapping(gameKey, input)
        local METHOD_NAME = "addNewMapping"
        self.logUtil:putF(self.commonStrings.START, self, METHOD_NAME)
        local isInputAlreadyMapped = self.inputMapping:getInputMapping():isMapped(input)
        if not (isInputAlreadyMapped) and not (self.inputMapping:isSystemInput(input)) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Add Key Mapping : GameKey: ")
            stringBuffer:append(self.stringUtil:toString(self.selectedGameKey))
            stringBuffer:append(" Input: ")
            stringBuffer:append(self.stringUtil:toString(self.selectedInput))
            self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
            self.inputMapping:getInputMapping():add(self.selectedGameKey, input)
            self.selectedInput = input
            self:update()
        else
            self.logUtil:putF("Unable to add Mapping since one already exists or is MENU, HOME, or BACK key and setting selected action to what it is already mapped to", self, METHOD_NAME)
            self:setSelectedAction(gameKey)
        end
end
java_overload(GameInputMappingCanvas, "addNewMapping", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GameKey")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


-- throws Exception
function GameInputMappingCanvas:deleteCurrentMapping()
        local METHOD_NAME = "deleteCurrentMapping"
        local list = self.inputMapping:getInputMapping():getMappedInput(self.selectedGameKey)
        if list:size() > 1 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Start GameKey: ")
            stringBuffer:append("Remove Key Mapping: GameKey: ")
            stringBuffer:append(self.stringUtil:toString(self.selectedGameKey))
            stringBuffer:append(" Input: ")
            stringBuffer:append(self.stringUtil:toString(self.selectedInput))
            self.logUtil:putF(tostring(stringBuffer), self, METHOD_NAME)
            self.inputMapping:getInputMapping():remove(self.selectedGameKey, self.selectedInput)
            self.selectedInput = self.NONE
            self:update()
        else
            self.logUtil:putF("Can't Remove Last Key Mapping", self, METHOD_NAME)
        end
end
java_overload(GameInputMappingCanvas, "deleteCurrentMapping", 0)


-- throws Exception
function GameInputMappingCanvas:setDefault()
        self.inputMapping:setDefault(self.abeClientInformation)
        self.helpPaintable:update(self.NONE, self.NONE)
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(GameInputMappingCanvas, "setDefault", 0)


-- throws Exception
function GameInputMappingCanvas:update()
        self.inputMapping:update(self.abeClientInformation)
        self.helpPaintable:update(self.selectedGameKey, self.selectedInput)
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(GameInputMappingCanvas, "update", 0)


function GameInputMappingCanvas:paint(graphics)
        self.colorFillPaintable:paint(graphics)
        self.helpPaintable:paint(graphics)
        self.paintable:paint(graphics)
        java_super(GameCommandCanvas, "paint", 1)(self, graphics)
end
java_overload(GameInputMappingCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

GameInputMappingCanvas.NAME = "GameInputMappingCanvas"
GameInputMappingCanvas.DISPLAY = Command.new("Controls", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)
GameInputMappingCanvas.DEFAULT = Command.new("Default", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)

return GameInputMappingCanvas

