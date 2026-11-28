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
-- package org.allbinary.game.midlet

local GameMidlet = {}
package.loaded["org.allbinary.game.midlet.GameMidlet"] = GameMidlet

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

local Enumeration = java_lazy("java.util.Enumeration")
local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local Command = java_lazy("javax.microedition.lcdui.Command")
local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Displayable = java_lazy("javax.microedition.lcdui.Displayable")
local NullCanvas = java_lazy("javax.microedition.lcdui.NullCanvas")
local MIDletStateChangeException = java_lazy("javax.microedition.midlet.MIDletStateChangeException")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local GameAdStateFactory = java_lazy("org.allbinary.business.advertisement.GameAdStateFactory")
local FullScreenUtil = java_lazy("org.allbinary.canvas.FullScreenUtil")
local GameStatisticsFactory = java_lazy("org.allbinary.canvas.GameStatisticsFactory")
local DebugFactory = java_lazy("org.allbinary.debug.DebugFactory")
local DebugInterface = java_lazy("org.allbinary.debug.DebugInterface")
local GameAdState = java_lazy("org.allbinary.game.GameAdState")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local GameMode = java_lazy("org.allbinary.game.GameMode")
local GameStrings = java_lazy("org.allbinary.game.GameStrings")
local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local PlayerTypesFactory = java_lazy("org.allbinary.game.PlayerTypesFactory")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local GameOptionsForm = java_lazy("org.allbinary.game.configuration.GameOptionsForm")
local GameOptionsFormFactory = java_lazy("org.allbinary.game.configuration.GameOptionsFormFactory")
local InGameFeatures = java_lazy("org.allbinary.game.configuration.InGameFeatures")
local InGameOptionsForm = java_lazy("org.allbinary.game.configuration.InGameOptionsForm")
local InGameOptionsFormFactory = java_lazy("org.allbinary.game.configuration.InGameOptionsFormFactory")
local LoadGameForm = java_lazy("org.allbinary.game.configuration.LoadGameForm")
local ChangedGameFeatureListener = java_lazy("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local GameFeatureEventHandler = java_lazy("org.allbinary.game.configuration.event.GameFeatureEventHandler")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFormUtil = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFormUtil")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local GamePersistanceSingleton = java_lazy("org.allbinary.game.configuration.persistance.GamePersistanceSingleton")
local KeyValuePersistance = java_lazy("org.allbinary.game.configuration.persistance.KeyValuePersistance")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local BasicPaintablesCanvas = java_lazy("org.allbinary.game.displayable.canvas.BasicPaintablesCanvas")
local DemoCanvas = java_lazy("org.allbinary.game.displayable.canvas.DemoCanvas")
local GameCanvasRunnableInterface = java_lazy("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local GameEventHandlerUtil = java_lazy("org.allbinary.game.displayable.canvas.GameEventHandlerUtil")
local GameInputMappingCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingCanvas")
local GameInputMappingInstructionsCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas")
local MenuListener = java_lazy("org.allbinary.game.displayable.canvas.MenuListener")
local NullGameCanvasRunnable = java_lazy("org.allbinary.game.displayable.canvas.NullGameCanvasRunnable")
local TextNotificationUtil = java_lazy("org.allbinary.game.input.TextNotificationUtil")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local HelpPaintable = java_lazy("org.allbinary.game.paint.help.HelpPaintable")
local HighScoreCommands = java_lazy("org.allbinary.game.score.HighScoreCommands")
local HighScoreCommandsFactory = java_lazy("org.allbinary.game.score.HighScoreCommandsFactory")
local HighScoreTextBox = java_lazy("org.allbinary.game.score.displayable.HighScoreTextBox")
local HighScoreUtil = java_lazy("org.allbinary.game.score.displayable.HighScoreUtil")
local HighScoresCanvas = java_lazy("org.allbinary.game.score.displayable.HighScoresCanvas")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local ResizableListenerHandler = java_lazy("org.allbinary.graphics.ResizableListenerHandler")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local ColorChangeEventHandler = java_lazy("org.allbinary.graphics.color.ColorChangeEventHandler")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local AboutCommandProcessor = java_lazy("org.allbinary.graphics.displayable.screen.AboutCommandProcessor")
local AboutPaintableFactory = java_lazy("org.allbinary.graphics.displayable.screen.AboutPaintableFactory")
local CommandForm = java_lazy("org.allbinary.graphics.displayable.screen.CommandForm")
local WebCommandProcessor = java_lazy("org.allbinary.graphics.displayable.screen.WebCommandProcessor")
local AllBinarySensorManager = java_lazy("org.allbinary.input.AllBinarySensorManager")
local VirtualKeyboardEventHandler = java_lazy("org.allbinary.input.event.VirtualKeyboardEventHandler")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ClientInformationFactory = java_lazy("org.allbinary.logic.system.security.licensing.ClientInformationFactory")
local InApplicationPurchaseFactory = java_lazy("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")
local LockableFeature = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeature")
local LockableFeatureFactory = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeatureFactory")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = java_lazy("org.allbinary.media.audio.AllBinaryMediaManager")
local MidletStrings = java_lazy("org.allbinary.midlet.MidletStrings")
local ProgressMidlet = require("org.allbinary.midlet.ProgressMidlet")
local NullThread = java_lazy("org.allbinary.thread.NullThread")
local ThreadFactoryUtil = java_lazy("org.allbinary.thread.ThreadFactoryUtil")
local ThreadUtil = java_lazy("org.allbinary.thread.ThreadUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local DemoGameMidletEvent = java_lazy("org.allbinary.game.midlet.DemoGameMidletEvent")
local DemoGameMidletStateFactory = java_lazy("org.allbinary.game.midlet.DemoGameMidletStateFactory")
local GameMidletEventHandler = java_lazy("org.allbinary.game.midlet.GameMidletEventHandler")
local GameMidletStateFactory = java_lazy("org.allbinary.game.midlet.GameMidletStateFactory")

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

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

-- class table GameMidlet is declared before the requires
GameMidlet.__index = GameMidlet
GameMidlet.className = "GameMidlet"
GameMidlet.javaClassName = "org.allbinary.game.midlet.GameMidlet"
setmetatable(GameMidlet, {__index = ProgressMidlet})
GameMidlet.java_implements = " CommandListener "
GameMidlet.java_interfaces = function() return {CommandListener} end

function GameMidlet:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.features = Features.getInstance()
    self.midletStrings = MidletStrings.getInstance()
    self.myCommandsFactory = MyCommandsFactory.getInstance()
    self.gameStrings = GameStrings.getInstance()
    self.gameAdStateFactory = GameAdStateFactory.getInstance()
    self.gameStateFactory = GameStateFactory.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.DISPLAYABLE = " Displayable: "
    self.COMMAND_NAME = "command Name/Label: "
    self.NO_COMMAND = "No Command"
    self.NO_DISPLAYABLE = "No Displayable"
    self.COMMAND_ACTION = tostring(StringMaker.new():append("GameMidlet::"):append(self.midletStrings.COMMAND_ACTION))
    self.PAUSE_APP_BACKGROUND = "pauseAppBackground"
    self.UN_PAUSE_APP_BACKGROUND = "unPauseAppBackground"
    self.aboutCommandProcessor = AboutCommandProcessor.getInstance()
    self.webCommandProcessor = WebCommandProcessor.getInstance()
    self.gameMidletStateFactory = GameMidletStateFactory.getInstance()
    self.gameStartTimeHelper = TimeDelayHelper.new(240)
    self.fullScreenUtil = FullScreenUtil.getInstance()
    if self.debugInterface == nil then self.debugInterface = nil end
    self.allbinaryGameCanvasRunnableInterface = NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE
    self.thread = NullThread.NULL_THREAD
    if self.loadGameForm == nil then self.loadGameForm = nil end
    if self.isFullScreen == nil then self.isFullScreen = false end
    if self.resized == nil then self.resized = false end
    self.startedBefore = false
end


function GameMidlet._jinit(self, clientInformationFactory)
    java_super_init(ProgressMidlet, self, clientInformationFactory)
    GameMidlet._init_fields(self)
        -- super(...) made self above
        SmallIntegerSingletonFactory.getInstance():initWithRange(0x291, 6)
        self.loadGameForm = CommandForm.getNullCommandForm()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:init(self)
        GameFeatureEventHandler.getInstance():addListenerInterface(ChangedGameFeatureListener.getInstance())
        GamePersistanceSingleton.getInstance():clear()
        self.debugInterface = DebugFactory.getInstance()
        self:init()
    return self
end

function GameMidlet.new(...)
    local self = setmetatable({}, GameMidlet)
    GameMidlet._jinit(self, ...)
    return self
end


function GameMidlet:init()
end
java_overload(GameMidlet, "init", 0)


-- throws Exception
function GameMidlet:setDemo()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(GameMidlet, "setDemo", 0)


-- throws Exception
function GameMidlet:createGame()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(GameMidlet, "createGame", 0)


-- throws Exception
function GameMidlet:mediaShutdown()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(GameMidlet, "mediaShutdown", 0)


function GameMidlet:stopAll()
end
java_overload(GameMidlet, "stopAll", 0)


function GameMidlet:pauseApp()
        self:pauseAppBackground(true)
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:getAdvertisements():stopAll()
end
java_overload(GameMidlet, "pauseApp", 0)


function GameMidlet:pauseAppBackground(background)
        self.logUtil:putF(self.commonStrings.START, self, self.PAUSE_APP_BACKGROUND)
        if not rawequal(self.allbinaryGameCanvasRunnableInterface, NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) then
            self.allbinaryGameCanvasRunnableInterface:pause()
        else
            self.logUtil:putF("<<<<<< Null", self, self.PAUSE_APP_BACKGROUND)
        end
        AllBinarySensorManager.getInstance():shutdown()
end
java_overload(GameMidlet, "pauseAppBackground", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function GameMidlet:unPauseApp()
        self:unPauseAppBackground(true)
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:getAdvertisements():startAll()
end
java_overload(GameMidlet, "unPauseApp", 0)


function GameMidlet:unPauseAppBackground(background)
        self.logUtil:putF(self.commonStrings.START, self, self.UN_PAUSE_APP_BACKGROUND)
        AllBinarySensorManager.getInstance():init()
        local gameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
        if not rawequal(gameCanvasRunnableInterface, NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) then
            gameCanvasRunnableInterface:unPause()
        else
            self.logUtil:putF("<<<<<< Null", self, self.UN_PAUSE_APP_BACKGROUND)
        end
end
java_overload(GameMidlet, "unPauseAppBackground", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function GameMidlet:destroyAppInRunnable(unconditional, isProgress)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        if isProgress then
            progressCanvas:start()
            self:commandAction(self.myCommandsFactory.SET_DISPLAYABLE, progressCanvas)
        end
        self:destroyApp(unconditional)
        if isProgress then
            progressCanvas:end_()
        end
end
java_overload(GameMidlet, "destroyAppInRunnable", 2, function(java_a1, java_a2) return true and type(java_a1) == "boolean" and type(java_a2) == "boolean" end)


function GameMidlet:destroyApp(unconditional)
        local METHOD_NAME = "GameMidlet::destroyApp"
        local try_ok, try_error, try_value = pcall(function()
            PreLogUtil.put(tostring(GameStatisticsFactory.getInstance()), self, METHOD_NAME)
            local gameAdState = self.gameAdStateFactory:getCurrentInstance()
            gameAdState:getAdvertisements():stopAll()
            if not (self:isDestroyed()) then
                self:stopGameCanvasRunnableInterface()
                self:setGameCanvasRunnableInterface(NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE)
                self:mediaShutdown()
            else
                self.logUtil:putF("Midlet Managment Error: Midlet Should Only Be Destroyed Once", self, METHOD_NAME)
            end
            java_super(ProgressMidlet, "destroyApp", 1)(self, true)
            PreLogUtil.put(self.commonStrings.END, self, METHOD_NAME)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, METHOD_NAME, e)
        end
        self.logUtil:putF(self.commonStrings.END, self, METHOD_NAME)
end
java_overload(GameMidlet, "destroyApp", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws MIDletStateChangeException
function GameMidlet:startApp()
        local try_ok, try_error, try_value = pcall(function()
            local gameAdState = self.gameAdStateFactory:getCurrentInstance()
            gameAdState:getAdvertisements():startAll()
            local START_APP = "startApp"
            self.logUtil:putF(self.commonStrings.START, self, START_APP)
            local gameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
            if rawequal(gameCanvasRunnableInterface, NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) then
                self.gameMidletStateFactory:setCurrentGameState(self.gameStateFactory.NO_GAME_STATE)
                self:setDemo()
            else
                self.logUtil:putF("GameCanvasRunnableInterface is available", self, START_APP)
                if rawequal(gameCanvasRunnableInterface, self:getCurrentDisplayable()) then
                    self:unPauseAppBackground(false)
                else
                    self.logUtil:putF("GameCanvasRunnableInterface is not current displayable", self, START_APP)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "startApp", e)
            self:destroyApp(false)
            self:notifyDestroyed()
        end
end
java_overload(GameMidlet, "startApp", 0)


function GameMidlet:commandAction(command, displayable)
        local try_ok, try_error, try_value = pcall(function()
            local displayableAsString = self.NO_DISPLAYABLE
            if not rawequal(displayable, nil) then
                displayableAsString = tostring(displayable)
            end
            local label = self.NO_COMMAND
            if not rawequal(command, nil) then
                label = command:getLabel()
            end
            PreLogUtil.put(tostring(StringMaker.new():append(self.COMMAND_NAME):append(label):append(self.DISPLAYABLE):append(displayableAsString)), self, self.COMMAND_ACTION)
            local gameCommandsFactory = GameCommandsFactory.getInstance()
            local allbinaryGameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
            local gameCanvasRunnableInterface = allbinaryGameCanvasRunnableInterface
            if rawequal(command, gameCommandsFactory.SHOW_GAME_CANVAS) then
                if not rawequal(self:getDisplay():getCurrent(), gameCanvasRunnableInterface) and not rawequal(allbinaryGameCanvasRunnableInterface:getType(), NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE:getType()) then
                    self:setDisplay(gameCanvasRunnableInterface)
                end
                self:unPauseAppBackground(false)
            elseif rawequal(command, gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS) then
                local menuListener = displayable
                menuListener:close()
                self:setDisplay(gameCanvasRunnableInterface)
                self:unPauseAppBackground(false)
            elseif rawequal(command, gameCommandsFactory.EXIT_COMMAND) then
                if rawequal(GameMidletEventHandler.getInstance():getEventListenerInterfaceListP():size(), 0) then
                    self:exitProgress(true)
                end
                GameMidletEventHandler.getInstance():fireEvent(DemoGameMidletEvent.new(self, DemoGameMidletStateFactory.getInstance().NONE))
            elseif rawequal(command, gameCommandsFactory.EXIT_WITHOUT_PROGRESS_COMMAND) then
                self:exitProgress(false)
            elseif rawequal(command, gameCommandsFactory.START_COMMAND) or rawequal(command, gameCommandsFactory.RESTART_COMMAND) or rawequal(command, gameCommandsFactory.CONTINUE_COMMAND) then
                if not rawequal(self.gameMidletStateFactory:getCurrentGameState(), self.gameStateFactory.PLAYING_GAME_STATE) or rawequal(command, gameCommandsFactory.RESTART_COMMAND) then
                    if self.gameStartTimeHelper:isTimeTNT() then
                        if rawequal(command, gameCommandsFactory.START_COMMAND) and self:isDemoLoading() then
                            self.logUtil:putF("Trying to Start Game Before Loading Complete", self, self.midletStrings.COMMAND_ACTION)
                        else
                            self.startedBefore = true
                            self:createGame()
                            self.gameMidletStateFactory:setCurrentGameState(self.gameStateFactory.PLAYING_GAME_STATE)
                        end
                    else
                        self.logUtil:putF("Starting Game Too Often", self, self.midletStrings.COMMAND_ACTION)
                    end
                else
                    self.logUtil:putF("Already in playing state", self, self.COMMAND_ACTION)
                end
            elseif rawequal(command, gameCommandsFactory.BUY_COMMAND) then
                local inApplicationPurchaseFactory = InApplicationPurchaseFactory.getInstance()
                local list = LockableFeatureFactory.getInstance():getList()
                local lockableFeature = list:get(0)
                if list:size() > 0 and not (inApplicationPurchaseFactory:isPurchased(lockableFeature)) then
                    inApplicationPurchaseFactory:purchase(lockableFeature)
                else
                    TextNotificationUtil.getInstance():fireSuccess("Already Purchased")
                end
            elseif rawequal(command, gameCommandsFactory.QUIT_COMMAND) then
                if self.gameStartTimeHelper:isTimeTNT() then
                    if java_instanceof(displayable, HighScoreTextBox) then
                        local menuListener = displayable
                        menuListener:close()
                    end
                    self:stopGameCanvasRunnableInterface()
                    self.gameMidletStateFactory:setCurrentGameState(self.gameStateFactory.NO_GAME_STATE)
                    self:setDemo()
                end
            elseif rawequal(command, self.myCommandsFactory.RESUME_COMMAND) then
                self:unPauseAppBackground(false)
            elseif rawequal(command, self.myCommandsFactory.PAUSE_COMMAND) then
                self:pauseAppBackground(false)
            elseif rawequal(command, self.myCommandsFactory.SET_DISPLAYABLE) then
                self:pauseAppBackground(false)
                self:setDisplay(displayable)
            elseif rawequal(command, gameCommandsFactory.SET_MENU_DISPLAYABLE) then
                self:pauseAppBackground(false)
                local menuListener = displayable
                menuListener:open()
                self:setDisplay(displayable)
            elseif rawequal(command, gameCommandsFactory.START_TRACE) then
                self.debugInterface:start()
                local gameCanvas = allbinaryGameCanvasRunnableInterface
                gameCanvas:addCommand(gameCommandsFactory.STOP_TRACE)
                gameCanvas:removeCommand(gameCommandsFactory.START_TRACE)
            elseif rawequal(command, gameCommandsFactory.STOP_TRACE) then
                self:pauseAppBackground(false)
                self.debugInterface:stop()
                self:unPauseAppBackground(false)
                local gameCanvas = allbinaryGameCanvasRunnableInterface
                gameCanvas:addCommand(gameCommandsFactory.START_TRACE)
                gameCanvas:removeCommand(gameCommandsFactory.STOP_TRACE)
            elseif rawequal(command, gameCommandsFactory.DEFAULT_OPTIONS) then
                local tempDisplayable = displayable
                if java_instanceof(tempDisplayable, GameOptionsForm) then
                    GameFeatureFormUtil.getInstance():setDefault(tempDisplayable)
                end
            elseif rawequal(command, GameInputMappingInstructionsCanvas.DISPLAY) then
                local tempDisplayable = displayable
                if java_instanceof(tempDisplayable, GameInputMappingCanvas) then
                    local gameInputMappingCanvas = tempDisplayable
                    gameInputMappingCanvas:update()
                end
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getInputMappingInstructionsCanvas())
            elseif HighScoreCommandsFactory.getInstance():isHighScoreCommand(command) then
                local tempDisplayable = displayable
                if java_instanceof(tempDisplayable, HighScoresCanvas) then
                    local highScoresCanvas = tempDisplayable
                    highScoresCanvas:updateCommand(command)
                end
            elseif rawequal(command, HighScoreCommands.getInstance().DISPLAY) then
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:createHighScoresCanvas())
            elseif rawequal(command, GameInputMappingInstructionsCanvas.CLOSE) then
                local menuListener = displayable
                menuListener:close()
                self:commandAction(GameInputMappingCanvas.DISPLAY, NullCanvas.NULL_CANVAS)
            elseif rawequal(command, GameInputMappingCanvas.DISPLAY) then
                if J2MEUtil.isHTML() then
                    self:pauseAppBackground(false)
                end
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getInputMappingCanvas())
            elseif rawequal(command, GameInputMappingCanvas.DEFAULT) then
                local tempDisplayable = displayable
                if java_instanceof(tempDisplayable, GameInputMappingCanvas) then
                    local gameInputMappingCanvas = tempDisplayable
                    gameInputMappingCanvas:setDefault()
                end
            elseif rawequal(command, InGameOptionsForm.DISPLAY) then
                self:pauseAppBackground(false)
                local progressCanvas = ProgressCanvasFactory.getInstance()
                progressCanvas:addNormalPortion(50, "In Game Options")
                local layerManager = self:createGameLayerManager()
                local inGameOptionsFormFactory = InGameOptionsFormFactory.getInstance()
                inGameOptionsFormFactory:init(self, InGameFeatures.new(), "Options In Game", layerManager:getBackgroundBasicColor(), layerManager:getForegroundBasicColor())
                local inGameOptionsForm = inGameOptionsFormFactory:get()
                inGameOptionsForm:setItemStateListener(allbinaryGameCanvasRunnableInterface)
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, inGameOptionsForm)
            elseif rawequal(command, InGameOptionsForm.DEFAULT) then
                local inGameOptionsForm = InGameOptionsFormFactory.getInstance():get()
                GameFeatureFormUtil.getInstance():setDefault(inGameOptionsForm)
            elseif rawequal(command, gameCommandsFactory.DISPLAY_OPTIONS) then
                AllBinaryMediaManager.setMuted(true)
                self:stopAll()
                local mainFeatureFactory = MainFeatureFactory.getInstance()
                self.isFullScreen = self.features:isFeature(mainFeatureFactory.FULL_SCREEN)
                ResizableListenerHandler.getInstance():fireEvent(true)
                self:setResized(false)
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getGameOptionsForm())
            elseif rawequal(command, gameCommandsFactory.CLOSE_OPTIONS) then
                ResizableListenerHandler.getInstance():fireEvent(false)
                self:commandAction(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS, displayable)
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Close isFullScreen/change: ")
                stringBuffer:appendboolean(self.isFullScreen)
                stringBuffer:appendboolean(self.fullScreenUtil:isScreenChange(self.isFullScreen))
                stringBuffer:append(" isResized: ")
                stringBuffer:appendboolean(self:isResized())
                PreLogUtil.put(tostring(stringBuffer), self, self.COMMAND_ACTION)
                if self:isResized() or self.fullScreenUtil:isScreenChange(self.isFullScreen) then
                    self:updateFullScreen()
                end
                AllBinaryMediaManager.setMuted(false)
            elseif rawequal(command, gameCommandsFactory.DISPLAY_LOAD_FORM) then
                self:pauseAppBackground(false)
                local keyValuePersistance = GamePersistanceSingleton.getInstance()
                keyValuePersistance:clear()
                keyValuePersistance:loadAll(self.abeClientInformation)
                if rawequal(self:getLoadGameForm(), CommandForm.getNullCommandForm()) then
                    local layerManager = self:createGameLayerManager()
                    self:setLoadGameForm(LoadGameForm.new(self, "Load Game", layerManager:getBackgroundBasicColor(), layerManager:getForegroundBasicColor()))
                else
                    self:getLoadGameForm():update()
                end
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getLoadGameForm())
            elseif rawequal(command, gameCommandsFactory.LOAD_FILE) then
                local loadGameForm = self:getLoadGameForm()
                local index = loadGameForm:getSelectedId()
                if not rawequal(index, -1) then
                    local keyValuePersistance = GamePersistanceSingleton.getInstance()
                    self:setStartStateHashtable(keyValuePersistance:get(index))
                    local menuListener = self:getLoadGameForm()
                    menuListener:close()
                    PreLogUtil.put(tostring(BasicMotionGesturesHandler.getInstance()), self, self.COMMAND_ACTION)
                    self:commandAction(gameCommandsFactory.START_COMMAND, NullCanvas.NULL_CANVAS)
                    PreLogUtil.put(tostring(BasicMotionGesturesHandler.getInstance()), self, self.COMMAND_ACTION)
                end
            elseif rawequal(command, gameCommandsFactory.DELETE_FILE) then
                local loadGameForm = self:getLoadGameForm()
                local index = loadGameForm:getSelectedText()
                if not rawequal(index, -1) then
                    local keyValuePersistance = GamePersistanceSingleton.getInstance()
                    keyValuePersistance:delete(self.abeClientInformation, index)
                    keyValuePersistance:clear()
                    keyValuePersistance:loadAllSize(self.abeClientInformation, 1)
                    self:getLoadGameForm():update()
                end
            elseif rawequal(command, gameCommandsFactory.SAVE) then
                local keyValuePersistance = GamePersistanceSingleton.getInstance()
                self:pauseAppBackground(false)
                keyValuePersistance:save(self.abeClientInformation, self:getCurrentStateHashtable())
                self:unPauseAppBackground(false)
            elseif rawequal(command, HighScoreUtil.SUBMIT_TEXTBOX_COMMAND) then
                self.logUtil:putF("Submitted Score", self, self.COMMAND_ACTION)
                if java_instanceof(displayable, HighScoreTextBox) then
                    local highScoreTextBox = displayable
                    highScoreTextBox.submitted = true
                end
                allbinaryGameCanvasRunnableInterface:setHighScoreSubmitted(true)
                self:commandAction(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS, displayable)
            elseif rawequal(command, gameCommandsFactory.DISPLAY_ABOUT) then
                self.aboutCommandProcessor:process(self, gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getAboutCanvas())
            elseif rawequal(command, gameCommandsFactory.OPEN_WEB_URL) then
                self.webCommandProcessor:process(self, gameCommandsFactory.OPEN_WEB_URL, NullCanvas.NULL_CANVAS)
            elseif rawequal(command, gameCommandsFactory.TOGGLE_KEYBOARD) then
                local virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
                virtualKeyboardEventHandler:fireEvent(virtualKeyboardEventHandler.SHOW_EVENT)
            elseif rawequal(self.tsUtil:compareTo(command:getLabel(), gameCommandsFactory.TOGGLE_FULLSCREEN:getLabel()), 0) then
                local mainFeatureFactory = MainFeatureFactory.getInstance()
                local isFullScreen = self.features:isFeature(mainFeatureFactory.FULL_SCREEN)
                if isFullScreen then
                    self.features:removeDefault(mainFeatureFactory.FULL_SCREEN)
                else
                    self.features:addDefault(mainFeatureFactory.FULL_SCREEN)
                end
                self:updateFullScreen()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(command:getLabel())), self, self.midletStrings.COMMAND_ACTION, e)
            if not rawequal(command, GameCommandsFactory.getInstance().EXIT_COMMAND) then
                self:exitProgress(false)
            end
        end
end
java_overload(GameMidlet, "commandAction", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Command")) and (java_a2 == nil or java_is(java_a2, "Displayable")) end)


function GameMidlet:updateFullScreen()
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        local isFullScreen = self.features:isFeature(mainFeatureFactory.FULL_SCREEN)
        local displayable = self:getDisplay():getCurrent()
        if java_instanceof(displayable, Canvas) then
            local canvas = displayable
            canvas:setFullScreenMode(isFullScreen)
        end
end
java_overload(GameMidlet, "updateFullScreen", 0)


function GameMidlet:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(GameMidlet, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


-- throws Exception
function GameMidlet:getInputMappingInstructionsCanvas()
        return GameInputMappingInstructionsCanvas.new(self, self:createGameLayerManager())
end
java_overload(GameMidlet, "getInputMappingInstructionsCanvas", 0)


-- throws Exception
function GameMidlet:getInputMappingCanvas()
        return GameInputMappingCanvas.new(self.abeClientInformation, self, self:createGameLayerManager(), self:getHelpPaintable())
end
java_overload(GameMidlet, "getInputMappingCanvas", 0)


-- throws Exception
function GameMidlet:getAboutCanvas()
        return BasicPaintablesCanvas.new(self, CanvasStrings.getInstance().ABOUT, self:createGameLayerManager(), AboutPaintableFactory.getInstance().paintableArray)
end
java_overload(GameMidlet, "getAboutCanvas", 0)


-- throws Exception
function GameMidlet:getHelpPaintable()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(GameMidlet, "getHelpPaintable", 0)


-- throws Exception
function GameMidlet:createHighScoresCanvas()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(GameMidlet, "createHighScoresCanvas", 0)


-- throws Exception
function GameMidlet:startGameCanvasRunnableInterface()
        local threadFactoryUtil = ThreadFactoryUtil.getInstance()
        self.thread = threadFactoryUtil:getInstanceGameCanvasRunnable(self.allbinaryGameCanvasRunnableInterface)
        self.logUtil:putF(tostring(StringMaker.new():append("Thread Priority: "):appendint(java_int(self.thread:getPriority()))), self, "startGameCanvasRunnableInterface")
        self.allbinaryGameCanvasRunnableInterface:setThread(self.thread)
        threadFactoryUtil:start(self.thread)
end
java_overload(GameMidlet, "startGameCanvasRunnableInterface", 0)


-- throws Exception
function GameMidlet:stopGameCanvasRunnableInterface()
        self.logUtil:putF(self.commonStrings.START, self, self.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE)
        GameNotificationEventHandler.getInstance():removeAllListeners()
        ColorChangeEventHandler.getInstance():removeAllListeners()
        GameEventHandlerUtil.removeAllListeners()
        local gameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
        if not rawequal(gameCanvasRunnableInterface, NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) then
            self.logUtil:putF(tostring(StringMaker.new():append("Set Running False: "):append(tostring(gameCanvasRunnableInterface))), self, self.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE)
            gameCanvasRunnableInterface:setRunning(false)
        else
            self.logUtil:putF("StopGame - Could Not Stop", self, self.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE)
        end
        ThreadUtil.getInstance():join(self.thread)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        if self.features:isFeature(MainFeatureFactory.getInstance().LOAD_ALL) then
            progressCanvas:addNormalPortion(50, "Stopped Game Runnable")
        else
            progressCanvas:addNormalPortion(50, "Stopped Main Runnable")
        end
        self.logUtil:putF(self.commonStrings.END, self, self.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE)
end
java_overload(GameMidlet, "stopGameCanvasRunnableInterface", 0)


function GameMidlet:getGameCanvasRunnableInterface()
        return self.allbinaryGameCanvasRunnableInterface
end
java_overload(GameMidlet, "getGameCanvasRunnableInterface", 0)


function GameMidlet:setGameCanvasRunnableInterface(gameCanvasRunnableInterface)
        self.allbinaryGameCanvasRunnableInterface = gameCanvasRunnableInterface
end
java_overload(GameMidlet, "setGameCanvasRunnableInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameCanvasRunnableInterface")) end)


function GameMidlet:createGameLayerManager()
        local gameInfo = GameInfo.new(GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 1, 1)
        return AllBinaryGameLayerManager.new(self.basicColorFactory.BLACK, self.basicColorFactory.WHITE, gameInfo)
end
java_overload(GameMidlet, "createGameLayerManager", 0)


function GameMidlet:getGameOptionsForm()
        local layerManager = self:createGameLayerManager()
        return GameOptionsFormFactory.getInstance():init(self, "Game Options", layerManager:getBackgroundBasicColor(), layerManager:getForegroundBasicColor())
end
java_overload(GameMidlet, "getGameOptionsForm", 0)


-- throws Exception
function GameMidlet:save()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.SAVE)
        local hashtable = self:getCurrentStateHashtable()
        GamePersistanceSingleton.getInstance():save(self.abeClientInformation, hashtable)
end
java_overload(GameMidlet, "save", 0)


-- throws Exception
function GameMidlet:getCurrentStateHashtable()
        self.logUtil:putF(self.commonStrings.START, self, "getCurrentStateHashtable")
        local hashtable = StdUtil.getInstance():createHashtable()
        if not rawequal(self.allbinaryGameCanvasRunnableInterface, NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE) then
            local currentHashtable = self.allbinaryGameCanvasRunnableInterface:getCurrentStateHashtable()
            local enumeration = currentHashtable:keys()
            local key = nil
            while self.enumerationUtil:hasMoreElements(enumeration) do
                key = self.enumerationUtil:nextElement(enumeration)
                hashtable:put(key, currentHashtable:get(key))
            end
        end
        return hashtable
end
java_overload(GameMidlet, "getCurrentStateHashtable", 0)


function GameMidlet:setLoadGameForm(loadGameForm)
        self.loadGameForm = loadGameForm
end
java_overload(GameMidlet, "setLoadGameForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LoadGameForm")) end)


function GameMidlet:getLoadGameForm()
        return self.loadGameForm
end
java_overload(GameMidlet, "getLoadGameForm", 0)


function GameMidlet:setResized(resized)
        self.resized = resized
end
java_overload(GameMidlet, "setResized", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function GameMidlet:isResized()
        return self.resized
end
java_overload(GameMidlet, "isResized", 0)


function GameMidlet:isDemoLoading()
        if self.startedBefore then
            return false
        end
        local displayable = self:getDisplay():getCurrent()
        if java_instanceof(displayable, DemoCanvas) then
            local demoCanvas = displayable
            if demoCanvas:isDemoLoading() then
                return true
            end
        end
        return false
end
java_overload(GameMidlet, "isDemoLoading", 0)

return GameMidlet

