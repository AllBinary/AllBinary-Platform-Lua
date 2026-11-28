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

local GameCommandCanvas = {}
package.loaded["org.allbinary.game.displayable.canvas.GameCommandCanvas"] = GameCommandCanvas

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

local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local NullCommandListener = java_lazy("javax.microedition.lcdui.NullCommandListener")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local RepaintBehavior = java_lazy("org.allbinary.game.displayable.RepaintBehavior")
local GameInputStrings = java_lazy("org.allbinary.game.input.GameInputStrings")
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local PlatformInputMappingFactory = java_lazy("org.allbinary.game.input.PlatformInputMappingFactory")
local DownGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.DownGameKeyEventHandler")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local GameKeyEventHandler = java_lazy("org.allbinary.game.input.event.GameKeyEventHandler")
local UpGameKeyEventHandler = java_lazy("org.allbinary.game.input.event.UpGameKeyEventHandler")
local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local ScreenRepaintProcessorFactory = java_lazy("org.allbinary.graphics.displayable.screen.ScreenRepaintProcessorFactory")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local CommandCurrentSelectionFormFactory = java_lazy("org.allbinary.graphics.form.CommandCurrentSelectionFormFactory")
local FormPaintable = java_lazy("org.allbinary.graphics.form.FormPaintable")
local FormTypeFactory = java_lazy("org.allbinary.graphics.form.FormTypeFactory")
local PaintableForm = java_lazy("org.allbinary.graphics.form.PaintableForm")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local ScrollSelectionFormNoneFactory = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormNoneFactory")
local CommandTextItemArrayFactory = java_lazy("org.allbinary.graphics.form.item.CommandTextItemArrayFactory")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local AllCommandsVisitor = java_lazy("org.allbinary.graphics.form.item.validation.AllCommandsVisitor")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local BasicMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")
local ImmediateCommandFormInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.ImmediateCommandFormInputProcessor")
local NoMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.NoMenuInputProcessor")

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

-- class table GameCommandCanvas is declared before the requires
GameCommandCanvas.__index = GameCommandCanvas
GameCommandCanvas.className = "GameCommandCanvas"
GameCommandCanvas.javaClassName = "org.allbinary.game.displayable.canvas.GameCommandCanvas"
setmetatable(GameCommandCanvas, {__index = MyCanvas})
GameCommandCanvas.java_implements = " MenuListener DisplayChangeEventListener UpdateMyFontInterface "
GameCommandCanvas.java_interfaces = function() return {MenuListener, DisplayChangeEventListener, UpdateMyFontInterface} end

function GameCommandCanvas:_init_fields()
    self.repaintProcessor = ScreenRepaintProcessorFactory.getInstance():create(self)
    self.gameInputStrings = GameInputStrings.getInstance()
    if self.foregroundBasicColor == nil then self.foregroundBasicColor = nil end
    if self.backgroundBasicColor == nil then self.backgroundBasicColor = nil end
    self.inputToGameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()
    self.gameKeyFactory = GameKeyFactory.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    if self.repaintBehavior == nil then self.repaintBehavior = nil end
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    if self.foregroundColor == nil then self.foregroundColor = 0 end
    if self.backgroundColor == nil then self.backgroundColor = 0 end
    self.menuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuPaintable = NullPaintable.getInstance()
    self.menuForm = PaintableForm.getNullPaintableForm()
    self.isSingleKeyRepeatableProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
    self.fontHeight = 0
end


function GameCommandCanvas._jinit(self, cmdListener, name, backgroundBasicColor, foregroundBasicColor)
    java_super_init(MyCanvas, self, name, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST)
    GameCommandCanvas._init_fields(self)
        -- super(...) made self above
        self.repaintBehavior = RepaintBehavior.getInstance()
        self.foregroundBasicColor = foregroundBasicColor
        self.backgroundBasicColor = backgroundBasicColor
        self.foregroundColor = require("allbinary_java").number_value(self.foregroundBasicColor, "intValue")
        self.backgroundColor = require("allbinary_java").number_value(self.backgroundBasicColor, "intValue")
        self:initCommands(cmdListener)
        if not rawequal(cmdListener, NullCommandListener.NULL_COMMAND_LISTENER) then
            local try_ok, try_error, try_value = pcall(function()
                self:initMenu()
                self.repaintProcessor:process()
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                error(require("java.lang.RuntimeException").new(), 0)
            end
        end
    return self
end

function GameCommandCanvas.new(...)
    local self = setmetatable({}, GameCommandCanvas)
    GameCommandCanvas._jinit(self, ...)
    return self
end


function GameCommandCanvas:updateMeasurement(graphics)
        local try_ok, try_error, try_value = pcall(function()
            local font = graphics:getFont()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(self.canvasStrings.FD_WIDTH):appendint(java_int(MyFontProcessor.defaultCharWidth(font))):append(self.canvasStrings.FD_HEIGHT):appendint(java_int(font:getHeight()))), self, self.canvasStrings.UPDATE_MEASUREMENT)
            self.fontHeight = font:getHeight()
            local rectangle = self:createRectangle(self.menuForm:size())
            self.menuForm:init(rectangle, FormTypeFactory.getInstance().VERTICAL_CENTER_FORM)
            self:update()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(GameCommandCanvas, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function GameCommandCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(GameCommandCanvas, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function GameCommandCanvas:onDisplayChangeEvent(displayChangeEvent)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(tostring(DisplayInfoSingleton.getInstance()))), self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT)
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(GameCommandCanvas, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


function GameCommandCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end
java_overload(GameCommandCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


-- throws Exception
function GameCommandCanvas:initMenu()
        local form = self:createForm()
        self.menuForm = form
        if not rawequal(form, ScrollSelectionFormNoneFactory.getInstance()) then
            self:setMenuInputProcessor(ImmediateCommandFormInputProcessor.new(BasicArrayListD.new(), -1, self, form))
            self.menuPaintable = FormPaintable.new(form)
        end
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(GameCommandCanvas, "initMenu", 0)


-- throws Exception
function GameCommandCanvas:createForm()
        local items = CommandTextItemArrayFactory.new(AllCommandsVisitor.new()):getInstance(self:getCommandStack(), self.backgroundBasicColor, self.foregroundBasicColor)
        local rectangle = self:createRectangle((items.n or #items))
        return CommandCurrentSelectionFormFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, items, rectangle, FormTypeFactory.getInstance().VERTICAL_CENTER_FORM, 15, false, self.backgroundBasicColor, self.foregroundBasicColor)
end
java_overload(GameCommandCanvas, "createForm", 0)


function GameCommandCanvas:createRectangle(size)
        local height = size * self.fontHeight
        local startY = (self.displayInfo:getLastHeight() * 2 / 3) - height
        local pointFactory = PointFactory.getInstance()
        local rectangle = Rectangle.new(pointFactory:createXY(30, startY), self.displayInfo:getLastWidth() - 30, startY)
        return rectangle
end
java_overload(GameCommandCanvas, "createRectangle", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameCommandCanvas:open()
        self.logUtil:putF(self.commonStrings.START, self, "open")
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():addListener(self:getMenuInputProcessor())
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
end
java_overload(GameCommandCanvas, "open", 0)


-- throws Exception
function GameCommandCanvas:close()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CLOSE)
        BasicMotionGesturesHandler.getInstance():removeListener(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():removeListener(self:getMenuInputProcessor())
        DisplayChangeEventHandler.getInstance():removeListener(self)
end
java_overload(GameCommandCanvas, "close", 0)


-- throws Exception
function GameCommandCanvas:update()
        self.repaintProcessor:process()
end
java_overload(GameCommandCanvas, "update", 0)


function GameCommandCanvas:getSourceId()
        return GameCommandCanvas.id
end
java_overload(GameCommandCanvas, "getSourceId", 0)


function GameCommandCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end
java_overload(GameCommandCanvas, "keyPressed", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameCommandCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end
java_overload(GameCommandCanvas, "keyReleased", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameCommandCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end
java_overload(GameCommandCanvas, "keyRepeated", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameCommandCanvas:keyPressedByDevice(keyCode, deviceId)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):appendint(keyCode)), self, self.gameInputStrings.KEY_PRESSED)
        self:addGameKeyEvent(keyCode, 0, false)
end
java_overload(GameCommandCanvas, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function GameCommandCanvas:keyReleasedByDevice(keyCode, deviceId)
        self:removeGameKeyEvent(keyCode, deviceId, false)
end
java_overload(GameCommandCanvas, "keyReleasedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function GameCommandCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self:addGameKeyEvent(keyCode, deviceId, true)
        end
end
java_overload(GameCommandCanvas, "keyRepeatedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function GameCommandCanvas:addGameKeyEvent(keyCode, deviceId, repeated)
        local try_ok, try_error, try_value = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if not rawequal(gameKey, self.gameKeyFactory.NONE) then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                self.downGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.downGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.ADD_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end
java_overload(GameCommandCanvas, "addGameKeyEvent", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "boolean" end)


function GameCommandCanvas:removeGameKeyEvent(keyCode, deviceId, repeated)
        local try_ok, try_error, try_value = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if not rawequal(gameKey, self.gameKeyFactory.NONE) then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                self.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.REMOVE_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.REMOVE_KEY_EVENT, e)
        end
end
java_overload(GameCommandCanvas, "removeGameKeyEvent", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "boolean" end)


function GameCommandCanvas:paint(graphics)
        self.myFontProcessor:process(graphics)
        self.menuPaintable:paint(graphics)
        self.repaintBehavior:repaint(self)
end
java_overload(GameCommandCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function GameCommandCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end
java_overload(GameCommandCanvas, "setMenuInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicMenuInputProcessor")) end)


function GameCommandCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end
java_overload(GameCommandCanvas, "getMenuInputProcessor", 0)

GameCommandCanvas.id = 0

return GameCommandCanvas

