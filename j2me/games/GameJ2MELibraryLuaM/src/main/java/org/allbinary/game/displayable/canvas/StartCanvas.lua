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

local StartCanvas = {}
package.loaded["org.allbinary.game.displayable.canvas.StartCanvas"] = StartCanvas

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
local Item = java_lazy("javax.microedition.lcdui.Item")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Animation = java_lazy("org.allbinary.animation.Animation")
local IndexedAnimationBehavior = java_lazy("org.allbinary.animation.IndexedAnimationBehavior")
local SpecialAnimation = java_lazy("org.allbinary.animation.special.SpecialAnimation")
local GameAdStateFactory = java_lazy("org.allbinary.business.advertisement.GameAdStateFactory")
local BaseGameStatistics = java_lazy("org.allbinary.canvas.BaseGameStatistics")
local CustomGameMenuUtil = java_lazy("org.allbinary.canvas.CustomGameMenuUtil")
local FullScreenUtil = java_lazy("org.allbinary.canvas.FullScreenUtil")
local GameStatisticsFactory = java_lazy("org.allbinary.canvas.GameStatisticsFactory")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local GameAdState = java_lazy("org.allbinary.game.GameAdState")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local ChangedGameFeatureListener = java_lazy("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local BasicBuildGameInitializerFactory = java_lazy("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local GameInitializationUtil = java_lazy("org.allbinary.game.init.GameInitializationUtil")
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
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local SWTUtil = java_lazy("org.allbinary.game.layer.SWTUtil")
local DemoGameMidlet = java_lazy("org.allbinary.game.midlet.DemoGameMidlet")
local HighScoreCommands = java_lazy("org.allbinary.game.score.HighScoreCommands")
local HighScores = java_lazy("org.allbinary.game.score.HighScores")
local HighScoresFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelper = java_lazy("org.allbinary.game.score.HighScoresHelper")
local HighScoresPaintable = java_lazy("org.allbinary.game.score.HighScoresPaintable")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")
local GameState = java_lazy("org.allbinary.game.state.GameState")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local ResizableListenerHandler = java_lazy("org.allbinary.graphics.ResizableListenerHandler")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")
local FormTypeFactory = java_lazy("org.allbinary.graphics.form.FormTypeFactory")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local CurrentDisplayableFactory = java_lazy("org.allbinary.graphics.opengles.CurrentDisplayableFactory")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local OpenGLThreadUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLThreadUtil")
local InitUpdatePaintable = java_lazy("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local StatePaintable = java_lazy("org.allbinary.graphics.paint.StatePaintable")
local StatePaintableFactory = java_lazy("org.allbinary.graphics.paint.StatePaintableFactory")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local OperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local InApplicationPurchaseFactory = java_lazy("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")
local LockableFeature = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeature")
local LockableFeatureFactory = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeatureFactory")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = java_lazy("org.allbinary.media.audio.AllBinaryMediaManager")
local EarlySoundsFactory = java_lazy("org.allbinary.media.audio.EarlySoundsFactory")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local BasicMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")
local FormUtil = java_lazy("org.allbinary.game.displayable.canvas.FormUtil")
local GameInputMappingCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingCanvas")
local GameRunnable = java_lazy("org.allbinary.game.displayable.canvas.GameRunnable")
local NoMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.NoMenuInputProcessor")
local NullWaitGameRunnable = java_lazy("org.allbinary.game.displayable.canvas.NullWaitGameRunnable")

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

-- class table StartCanvas is declared before the requires
StartCanvas.__index = StartCanvas
StartCanvas.className = "StartCanvas"
StartCanvas.javaClassName = "org.allbinary.game.displayable.canvas.StartCanvas"
setmetatable(StartCanvas, {__index = RunnableCanvas})
StartCanvas.java_implements = " GameCanvasRunnableInterface MenuListener DisplayChangeEventListener "
StartCanvas.java_interfaces = function() return {GameCanvasRunnableInterface, MenuListener, DisplayChangeEventListener} end

function StartCanvas:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.features = Features.getInstance()
    self.openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
    self.myCommandsFactory = MyCommandsFactory.getInstance()
    self.gameAdStateFactory = GameAdStateFactory.getInstance()
    self.gameStateFactory = GameStateFactory.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.formUtil = FormUtil.getInstance()
    self.basicGameDemoPaintable = StatePaintableFactory.getInstance()
    self.specialAnimationInterface = SpecialAnimation.getInstance()
    self.paintedSpecialAnimationInterface = SpecialAnimation.getInstance()
    self.fullScreenUtil = FullScreenUtil.getInstance()
    self.highScoresHelper = HighScoresHelper.new()
    self.realHighScoresPaintable = HighScoresPaintable.new()
    self.highScoresPaintable = NullPaintable.getInstance()
    self.state = 0
    self.timeDelayHelper = TimeDelayHelper.new(6000)
    if self.highScoresFactoryInterface == nil then self.highScoresFactoryInterface = nil end
    self.menuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuForm = ScrollSelectionForm.getNullScrollSelectionForm()
    if self.gameInitializationInterfaceFactoryInterface == nil then self.gameInitializationInterfaceFactoryInterface = nil end
    if self.initialized == nil then self.initialized = false end
    self.defaultPaintableInterface = NullPaintable.getInstance()
    self.paintableInterface = NullPaintable.getInstance()
    if self.overlayPaintable == nil then self.overlayPaintable = nil end
    self.tempWait = NullWaitGameRunnable.getInstance().WAIT
    self.inputToGameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()
    self.gameRunnable = NullWaitGameRunnable.getInstance()
    self.progressPaintable = ProgressCanvasFactory.getLazyInstance()
    self.isSingleKeyRepeatableProcessing = self.features:isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
    self.NONE = GameKeyFactory.getInstance().NONE
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.SET_STATE = "setState"
    self.baseGameStatistics = GameStatisticsFactory.getInstance()
end


function StartCanvas._jinit(self, abeClientInformation, commandListener, highScoresFactoryInterface, paintable, overlayPaintable, gameInitializationInterfaceFactoryInterface, isContinue)
    java_super_init(RunnableCanvas, self, commandListener, CurrentDisplayableFactory.getInstance().DEFAULT_CHILD_NAME_LIST, true)
    StartCanvas._init_fields(self)
        -- super(...) made self above
        self:setWait(NullWaitGameRunnable.getInstance().WAIT)
        self.gameInitializationInterfaceFactoryInterface = gameInitializationInterfaceFactoryInterface
        GameInitializationUtil.getInstance():initDemo(abeClientInformation, self, gameInitializationInterfaceFactoryInterface)
        ResizableListenerHandler.getInstance():fireEvent(false)
        self.overlayPaintable = overlayPaintable
        self.highScoresFactoryInterface = highScoresFactoryInterface
        self:setDefaultPaintableInterface(paintable)
        self:setPaintableInterface(self:getDefaultPaintableInterface())
        if isContinue then
            self:addCommand(GameCommandsFactory.getInstance().CONTINUE_COMMAND)
        end
        if ChangedGameFeatureListener.getInstance():isChangedFeature(GameFeatureFactory.getInstance().SOUND) then
            self:mediaInit()
        end
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
    return self
end

function StartCanvas.new(...)
    local self = setmetatable({}, StartCanvas)
    StartCanvas._jinit(self, ...)
    return self
end


function StartCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(StartCanvas, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function StartCanvas:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            local scrollSelectionForm = self:getMenuForm()
            if not rawequal(scrollSelectionForm, nil) then
                local formType = FormTypeFactory.getInstance():getFormType()
                local rectangle = self.formUtil:createFormRectangle()
                scrollSelectionForm:init(rectangle, formType)
            end
            self.overlayPaintable:init()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
end
java_overload(StartCanvas, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


function StartCanvas:getCustomCommands()
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        if J2MEUtil.isHTML() then
            local commandArray = {gameCommandsFactory.START_COMMAND, HighScoreCommands.getInstance().DISPLAY, GameInputMappingCanvas.DISPLAY, gameCommandsFactory.DISPLAY_ABOUT}
            return commandArray
        else
            local commandList = BasicArrayListD.new()
            commandList:add(gameCommandsFactory.START_COMMAND)
            local inApplicationPurchaseFactory = InApplicationPurchaseFactory.getInstance()
            if inApplicationPurchaseFactory:isEnabled() then
                local list = LockableFeatureFactory.getInstance():getList()
                if list:size() > 0 and not (inApplicationPurchaseFactory:isPurchased(list:get(0))) then
                    commandList:add(gameCommandsFactory.BUY_COMMAND)
                end
            end
            commandList:add(HighScoreCommands.getInstance().DISPLAY)
            local try_ok, try_error, try_value = pcall(function()
                local isOverScan = OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan()
                if SWTUtil.isSWT then
                    commandList:add(GameInputMappingCanvas.DISPLAY)
                elseif not (isOverScan) then
                    commandList:add(gameCommandsFactory.DISPLAY_OPTIONS)
                    commandList:add(gameCommandsFactory.DISPLAY_LOAD_FORM)
                    commandList:add(GameInputMappingCanvas.DISPLAY)
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            end
            commandList:add(gameCommandsFactory.DISPLAY_ABOUT)
            local commandArray = commandList:toArray()
            return commandArray
        end
end
java_overload(StartCanvas, "getCustomCommands", 0)


function StartCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        local commandArray = self:getCustomCommands()
        local size = (commandArray.n or #commandArray)
        for index = 0, size - 1 do
            self:addCommand(commandArray[index + 1])
        end
        CustomGameMenuUtil.add(self)
        self:setCommandListener(cmdListener)
end
java_overload(StartCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


-- throws Exception
function StartCanvas:initPostPaint()
end
java_overload(StartCanvas, "initPostPaint", 0)


-- throws Exception
function StartCanvas:mediaInit()
        AllBinaryMediaManager.init(EarlySoundsFactory.getInstance())
end
java_overload(StartCanvas, "mediaInit", 0)


function StartCanvas:itemStateChanged(item)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end
java_overload(StartCanvas, "itemStateChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Item")) end)


-- throws Exception
function StartCanvas:initMenu()
        self:close()
        self:open()
end
java_overload(StartCanvas, "initMenu", 0)


function StartCanvas:open()
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():addListener(self:getMenuInputProcessor())
end
java_overload(StartCanvas, "open", 0)


function StartCanvas:close()
        BasicMotionGesturesHandler.getInstance():removeListener(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():removeListener(self:getMenuInputProcessor())
end
java_overload(StartCanvas, "close", 0)


function StartCanvas:getSourceId()
        return StartCanvas.id
end
java_overload(StartCanvas, "getSourceId", 0)


function StartCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end
java_overload(StartCanvas, "keyPressed", 1, function(java_a1) return true and type(java_a1) == "number" end)


function StartCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end
java_overload(StartCanvas, "keyReleased", 1, function(java_a1) return true and type(java_a1) == "number" end)


function StartCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end
java_overload(StartCanvas, "keyRepeated", 1, function(java_a1) return true and type(java_a1) == "number" end)


function StartCanvas:keyPressedByDevice(keyCode, deviceId)
        self:addGameKeyEvent(keyCode, false)
end
java_overload(StartCanvas, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function StartCanvas:keyReleasedByDevice(keyCode, deviceId)
        self:removeGameKeyEvent(keyCode, false)
end
java_overload(StartCanvas, "keyReleasedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function StartCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self:addGameKeyEvent(keyCode, true)
        end
end
java_overload(StartCanvas, "keyRepeatedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function StartCanvas:addGameKeyEvent(keyCode, repeated)
        local try_ok, try_error, try_value = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if not rawequal(gameKey, self.NONE) then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                DownGameKeyEventHandler.getInstance():fireEvent(gameKeyEvent)
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
java_overload(StartCanvas, "addGameKeyEvent", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "boolean" end)


function StartCanvas:removeGameKeyEvent(keyCode, repeated)
        local try_ok, try_error, try_value = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if not rawequal(gameKey, self.NONE) then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                UpGameKeyEventHandler.getInstance():fireEvent(gameKeyEvent)
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
java_overload(StartCanvas, "removeGameKeyEvent", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "boolean" end)


function StartCanvas:pause()
        self:close()
        self:setPaused(true)
end
java_overload(StartCanvas, "pause", 0)


function StartCanvas:unPause()
        self:open()
        self:setPaused(false)
end
java_overload(StartCanvas, "unPause", 0)


function StartCanvas:isPausable()
        if rawequal(CurrentDisplayableFactory.getInstance():getUsedRunnable(), NullWaitGameRunnable.getInstance()) then
            return true
        else
            return false
        end
end
java_overload(StartCanvas, "isPausable", 0)


function StartCanvas:isGameOver()
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.NOT_IMPLEMENTED):append(" since not a game")), self, "isGameOver")
        return false
end
java_overload(StartCanvas, "isGameOver", 0)


-- throws Exception
function StartCanvas:setLoadStateHashtable(hashtable)
        self.logUtil:putF("Trying to continue a demo lol - only continue a game canvas not the demo", self, "setLoadStateHashtable")
end
java_overload(StartCanvas, "setLoadStateHashtable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABHashtable")) end)


-- throws Exception
function StartCanvas:getLoadStateHashtable()
        self.logUtil:putF("Trying to continue a demo lol - only continue a game canvas not the demo", self, "getLoadStateHashtable")
        return self.stdUtil.NULL_TABLE
end
java_overload(StartCanvas, "getLoadStateHashtable", 0)


-- throws Exception
function StartCanvas:getCurrentStateHashtable()
        self.logUtil:putF("Trying to save the AI lol", self, "getCurrentStateHashtable")
        return self.stdUtil.NULL_TABLE
end
java_overload(StartCanvas, "getCurrentStateHashtable", 0)


function StartCanvas:setHighScoreSubmitted(isNotUsed)
end
java_overload(StartCanvas, "setHighScoreSubmitted", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function StartCanvas:paint(graphics)
        self.paintableInterface:paint(graphics)
        self.paintedSpecialAnimationInterface:paintXY(graphics, 0, 0)
        self.highScoresPaintable:paint(graphics)
        self:getBasicGameDemoPaintable():paint(graphics)
        self.overlayPaintable:paint(graphics)
        self.progressPaintable:paint(graphics)
end
java_overload(StartCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function StartCanvas:paintThreed(graphics)
        self.paintableInterface:paintThreed(graphics)
        self.paintedSpecialAnimationInterface:paintThreedXYZ(graphics, 0, 0, 0)
end
java_overload(StartCanvas, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function StartCanvas:processGameOver()
        self.logUtil:putF("Not Implemented since not a game", self, "setGameOver")
end
java_overload(StartCanvas, "processGameOver", 0)


function StartCanvas:demoStateChange()
        local newState = self.state + 1
        if newState > 2 then
            newState = 0
        elseif rawequal(newState, 2) then
            if not (self.highScoresHelper:isAnyHighScores()) then
                newState = 0
            else
                local highScores = self.highScoresHelper:getNextHighScores()
                if rawequal(highScores, NullHighScoresSingletonFactory.getInstance()) then
                    newState = 0
                else
                    self:getRealHighScoresPaintable():setHighScores(highScores)
                end
            end
        end
        self:setState(newState)
        self:updateDemoState()
end
java_overload(StartCanvas, "demoStateChange", 0)


function StartCanvas:updateDemoState()
        PreLogUtil.put(tostring(SmallIntegerSingletonFactory.getInstance():createInstance(self.state)), self, self.SET_STATE)
        self:getBasicGameDemoPaintable():setState(self.state)
        if rawequal(self.state, 0) then
            self.highScoresPaintable = NullPaintable.getInstance()
            self.paintedSpecialAnimationInterface = self:getSpecialAnimationInterface()
            self:getSpecialAnimationInterface():reset()
        elseif rawequal(self.state, 1) then
            self.paintedSpecialAnimationInterface = SpecialAnimation.getInstance()
        elseif rawequal(self.state, 2) then
            self.highScoresPaintable = self:getRealHighScoresPaintable()
        end
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:processPageAdState()
end
java_overload(StartCanvas, "updateDemoState", 0)


-- throws Exception
function StartCanvas:getNextRandom()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(StartCanvas, "getNextRandom", 0)


-- throws Exception
function StartCanvas:createGameLayerManager(randomValue)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(StartCanvas, "createGameLayerManager", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function StartCanvas:createRunnable(randomLevel)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(StartCanvas, "createRunnable", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function StartCanvas:createCanvas()
        self.highScoresPaintable = NullPaintable.getInstance()
        local randomLevel = self:getNextRandom()
end
java_overload(StartCanvas, "createCanvas", 0)


-- throws Exception
function StartCanvas:start()
end
java_overload(StartCanvas, "start", 0)


function StartCanvas:preDemoProcess()
        self.overlayPaintable:update()
end
java_overload(StartCanvas, "preDemoProcess", 0)


-- throws Exception
function StartCanvas:process()
        self:getMenuInputProcessor():processInputList()
        self:preDemoProcess()
        if rawequal(self.state, 0) then
            local indexedAnimationBehavior = self:getSpecialAnimationInterface():getAnimationBehavior()
            if indexedAnimationBehavior.loopIndex < 1 then
                self.timeDelayHelper:setStartTimeTNT()
            end
            local demoGameMidlet = self:getCustomCommandListener()
        end
end
java_overload(StartCanvas, "process", 0)


-- throws Exception
function StartCanvas:startDemoGame()
end
java_overload(StartCanvas, "startDemoGame", 0)


-- throws Exception
function StartCanvas:processGame()
        self.gameRunnable:run()
        self.specialAnimationInterface:nextFrame()
        self:process()
end
java_overload(StartCanvas, "processGame", 0)


function StartCanvas:run()
        self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
        local try_ok, try_error, try_value = pcall(function()
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:addNormalPortion(50, "Demo Thread")
            self:setCurrentThread()
            self:setRunning(true)
            if self.features:isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND) then
                progressCanvas:end_()
            else
                progressCanvas:addNormalPortion(50, "Demo Thread Running")
            end
            self.fullScreenUtil:initOnRun(self, self:getCustomCommandListener())
            self:initMenu()
            self:initPostPaint()
            self:updateDemoState()
            if self.features:isDefault(self.openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
                OpenGLThreadUtil.getInstance():onResume()
            end
            if self.features:isDefault(self.openGLFeatureFactory.OPENGL_AS_GAME_THREAD) or J2MEUtil.isHTML() then
            else
                while self:isRunning() do
                    self.loopTimeHelper:setStartTimeTNT()
                    self:processGame()
                    self:processLoopSleep()
                end
                self:end_()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
        self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
end
java_overload(StartCanvas, "run", 0)


function StartCanvas:setRunning(running)
        java_super(RunnableCanvas, "setRunning", 1)(self, running)
        local try_ok, try_error, try_value = pcall(function()
            if (self.features:isDefault(self.openGLFeatureFactory.OPENGL) or J2MEUtil.isHTML()) and not (running) then
                local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                currentDisplayableFactory:clearRunnable()
                self:end_()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.SET_RUNNING, e)
        end
end
java_overload(StartCanvas, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function StartCanvas:end_()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        self.baseGameStatistics:add(tostring(StringMaker.new():append(StartCanvas.BOT_GAME_STATS):append(tostring(self.baseGameStatistics)):append(CommonSeps.getInstance().NEW_LINE)))
        self.baseGameStatistics:init()
        if self.features:isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND) then
            progressCanvas:start()
        end
        self.logUtil:putF("Demo End", self, self.commonStrings.RUN)
        self:close()
        DisplayChangeEventHandler.getInstance():removeListener(self)
end
java_overload(StartCanvas, "end_", 0)


function StartCanvas:setGameState(gameState)
end
java_overload(StartCanvas, "setGameState", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameState")) end)


function StartCanvas:getGameState()
        return self.gameStateFactory.PLAYING_GAME_STATE
end
java_overload(StartCanvas, "getGameState", 0)


function StartCanvas:getState()
        return self.state
end
java_overload(StartCanvas, "getState", 0)


function StartCanvas:setState(state)
        self.state = state
end
java_overload(StartCanvas, "setState", 1, function(java_a1) return true and type(java_a1) == "number" end)


function StartCanvas:isHighScoreSubmitted()
        self.logUtil:putF("Wow the AI got a high score!", self, "isHighScoreSubmitted")
        return false
end
java_overload(StartCanvas, "isHighScoreSubmitted", 0)


function StartCanvas:getRealHighScoresPaintable()
        return self.realHighScoresPaintable
end
java_overload(StartCanvas, "getRealHighScoresPaintable", 0)


function StartCanvas:setSpecialAnimationInterface(specialAnimationInterface)
        specialAnimationInterface:setFrame(0)
        self.specialAnimationInterface = specialAnimationInterface
end
java_overload(StartCanvas, "setSpecialAnimationInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "SpecialAnimation")) end)


function StartCanvas:getSpecialAnimationInterface()
        return self.specialAnimationInterface
end
java_overload(StartCanvas, "getSpecialAnimationInterface", 0)


function StartCanvas:setPaintableInterface(paintableInterface)
        self.paintableInterface = paintableInterface
end
java_overload(StartCanvas, "setPaintableInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PaintableInterface")) end)


function StartCanvas:getPaintableInterface()
        return self.paintableInterface
end
java_overload(StartCanvas, "getPaintableInterface", 0)


function StartCanvas:setDefaultPaintableInterface(defaultPaintableInterface)
        self.defaultPaintableInterface = defaultPaintableInterface
end
java_overload(StartCanvas, "setDefaultPaintableInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function StartCanvas:getDefaultPaintableInterface()
        return self.defaultPaintableInterface
end
java_overload(StartCanvas, "getDefaultPaintableInterface", 0)


function StartCanvas:getHighScoresFactoryInterface()
        return self.highScoresFactoryInterface
end
java_overload(StartCanvas, "getHighScoresFactoryInterface", 0)


function StartCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end
java_overload(StartCanvas, "setMenuInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicMenuInputProcessor")) end)


function StartCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end
java_overload(StartCanvas, "getMenuInputProcessor", 0)


function StartCanvas:getMenuForm()
        return self.menuForm
end
java_overload(StartCanvas, "getMenuForm", 0)


function StartCanvas:setMenuForm(menuForm)
        self.menuForm = menuForm
end
java_overload(StartCanvas, "setMenuForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ScrollSelectionForm")) end)


function StartCanvas:isInitialized()
        return self.initialized
end
java_overload(StartCanvas, "isInitialized", 0)


function StartCanvas:getOverlayPaintable()
        return self.overlayPaintable
end
java_overload(StartCanvas, "getOverlayPaintable", 0)


function StartCanvas:setBasicGameDemoPaintable(basicGameDemoPaintable)
        self.basicGameDemoPaintable = basicGameDemoPaintable
end
java_overload(StartCanvas, "setBasicGameDemoPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StatePaintable")) end)


function StartCanvas:getBasicGameDemoPaintable()
        return self.basicGameDemoPaintable
end
java_overload(StartCanvas, "getBasicGameDemoPaintable", 0)


function StartCanvas:setTempWait(tempWait)
        self.tempWait = tempWait
end
java_overload(StartCanvas, "setTempWait", 1, function(java_a1) return true and type(java_a1) == "number" end)


function StartCanvas:getTempWait()
        return self.tempWait
end
java_overload(StartCanvas, "getTempWait", 0)


function StartCanvas:isSingleThread()
        return OpenGLFeatureUtil.getInstance():isAnyThreed() or SWTUtil.isSWT
end
java_overload(StartCanvas, "isSingleThread", 0)


function StartCanvas:isRunningInAnotherThread()
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
            return true
        else
            return self:isRunning()
        end
end
java_overload(StartCanvas, "isRunningInAnotherThread", 0)


function StartCanvas:getGameInitializationInterfaceFactoryInterface()
        return self.gameInitializationInterfaceFactoryInterface
end
java_overload(StartCanvas, "getGameInitializationInterfaceFactoryInterface", 0)


function StartCanvas:getTitle()
        return java_super(RunnableCanvas, "getTitle", 0)(self)
end
java_overload(StartCanvas, "getTitle", 0)


function StartCanvas:isPaused()
        return java_super(RunnableCanvas, "isPaused", 0)(self)
end
java_overload(StartCanvas, "isPaused", 0)


function StartCanvas:getType()
        return java_super(RunnableCanvas, "getType", 0)(self)
end
java_overload(StartCanvas, "getType", 0)

StartCanvas.id = 0
StartCanvas.BOT_GAME_STATS = "Bot Game Statistics: "

return StartCanvas

