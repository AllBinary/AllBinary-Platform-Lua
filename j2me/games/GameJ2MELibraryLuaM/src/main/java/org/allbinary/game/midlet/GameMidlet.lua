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

-- local Enumeration = require("java.util.Enumeration")
-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Displayable = require("javax.microedition.lcdui.Displayable")
-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
-- local MIDletStateChangeException = require("javax.microedition.midlet.MIDletStateChangeException")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local TsUtil = require("org.allbinary.TsUtil")
local GameAdStateFactory = require("org.allbinary.business.advertisement.GameAdStateFactory")
local FullScreenUtil = require("org.allbinary.canvas.FullScreenUtil")
local GameStatisticsFactory = require("org.allbinary.canvas.GameStatisticsFactory")
local DebugFactory = require("org.allbinary.debug.DebugFactory")
local DebugInterface = require("org.allbinary.debug.DebugInterface")
local GameAdState = require("org.allbinary.game.GameAdState")
local GameInfo = require("org.allbinary.game.GameInfo")
local GameMode = require("org.allbinary.game.GameMode")
local GameStrings = require("org.allbinary.game.GameStrings")
local GameTypeFactory = require("org.allbinary.game.GameTypeFactory")
local PlayerTypesFactory = require("org.allbinary.game.PlayerTypesFactory")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameOptionsForm = require("org.allbinary.game.configuration.GameOptionsForm")
local GameOptionsFormFactory = require("org.allbinary.game.configuration.GameOptionsFormFactory")
local InGameFeatures = require("org.allbinary.game.configuration.InGameFeatures")
local InGameOptionsForm = require("org.allbinary.game.configuration.InGameOptionsForm")
local InGameOptionsFormFactory = require("org.allbinary.game.configuration.InGameOptionsFormFactory")
local LoadGameForm = require("org.allbinary.game.configuration.LoadGameForm")
local ChangedGameFeatureListener = require("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local GameFeatureEventHandler = require("org.allbinary.game.configuration.event.GameFeatureEventHandler")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFormUtil = require("org.allbinary.game.configuration.feature.GameFeatureFormUtil")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local GamePersistanceSingleton = require("org.allbinary.game.configuration.persistance.GamePersistanceSingleton")
local KeyValuePersistance = require("org.allbinary.game.configuration.persistance.KeyValuePersistance")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local BasicPaintablesCanvas = require("org.allbinary.game.displayable.canvas.BasicPaintablesCanvas")
local DemoCanvas = require("org.allbinary.game.displayable.canvas.DemoCanvas")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local GameEventHandlerUtil = require("org.allbinary.game.displayable.canvas.GameEventHandlerUtil")
local GameInputMappingCanvas = require("org.allbinary.game.displayable.canvas.GameInputMappingCanvas")
local GameInputMappingInstructionsCanvas = require("org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local NullGameCanvasRunnable = require("org.allbinary.game.displayable.canvas.NullGameCanvasRunnable")
local TextNotificationUtil = require("org.allbinary.game.input.TextNotificationUtil")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local HelpPaintable = require("org.allbinary.game.paint.help.HelpPaintable")
local HighScoreCommands = require("org.allbinary.game.score.HighScoreCommands")
local HighScoreCommandsFactory = require("org.allbinary.game.score.HighScoreCommandsFactory")
local HighScoreTextBox = require("org.allbinary.game.score.displayable.HighScoreTextBox")
local HighScoreUtil = require("org.allbinary.game.score.displayable.HighScoreUtil")
local HighScoresCanvas = require("org.allbinary.game.score.displayable.HighScoresCanvas")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local ResizableListenerHandler = require("org.allbinary.graphics.ResizableListenerHandler")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ColorChangeEventHandler = require("org.allbinary.graphics.color.ColorChangeEventHandler")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local AboutCommandProcessor = require("org.allbinary.graphics.displayable.screen.AboutCommandProcessor")
local AboutPaintableFactory = require("org.allbinary.graphics.displayable.screen.AboutPaintableFactory")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local WebCommandProcessor = require("org.allbinary.graphics.displayable.screen.WebCommandProcessor")
local AllBinarySensorManager = require("org.allbinary.input.AllBinarySensorManager")
local VirtualKeyboardEventHandler = require("org.allbinary.input.event.VirtualKeyboardEventHandler")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ClientInformationFactory = require("org.allbinary.logic.system.security.licensing.ClientInformationFactory")
local InApplicationPurchaseFactory = require("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")
local LockableFeature = require("org.allbinary.logic.system.security.licensing.LockableFeature")
local LockableFeatureFactory = require("org.allbinary.logic.system.security.licensing.LockableFeatureFactory")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = require("org.allbinary.media.audio.AllBinaryMediaManager")
local MidletStrings = require("org.allbinary.midlet.MidletStrings")
local ProgressMidlet = require("org.allbinary.midlet.ProgressMidlet")
local NullThread = require("org.allbinary.thread.NullThread")
local ThreadFactoryUtil = require("org.allbinary.thread.ThreadFactoryUtil")
local ThreadUtil = require("org.allbinary.thread.ThreadUtil")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local EnumerationUtil = require("org.allbinary.util.EnumerationUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameMidlet = {}
GameMidlet.__index = GameMidlet
GameMidlet.className = "GameMidlet"
setmetatable(GameMidlet, {__index = ProgressMidlet})

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
    self.debugInterface = nil
    self.allbinaryGameCanvasRunnableInterface = NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE
    self.thread = NullThread.NULL_THREAD
    self.loadGameForm = nil
    self.isFullScreen = false
    self.resized = false
    self.startedBefore = false
end


function GameMidlet.new(clientInformationFactory)
    local self = setmetatable(ProgressMidlet.new(clientInformationFactory), GameMidlet)
    self:_init_fields()
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


function GameMidlet:init()
end


-- throws Exception
function GameMidlet:setDemo()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function GameMidlet:createGame()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function GameMidlet:mediaShutdown()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function GameMidlet:stopAll()
end


function GameMidlet:pauseApp()
        self:pauseAppBackground(true)
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:getAdvertisements():stopAll()
end


function GameMidlet:pauseAppBackground(background)
        self.logUtil:putF(self.commonStrings.START, self, self.PAUSE_APP_BACKGROUND)
        if self.allbinaryGameCanvasRunnableInterface ~= NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE then
            self.allbinaryGameCanvasRunnableInterface:pause()
        else
            self.logUtil:putF("<<<<<< Null", self, self.PAUSE_APP_BACKGROUND)
        end
        AllBinarySensorManager.getInstance():shutdown()
end


function GameMidlet:unPauseApp()
        self:unPauseAppBackground(true)
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:getAdvertisements():startAll()
end


function GameMidlet:unPauseAppBackground(background)
        self.logUtil:putF(self.commonStrings.START, self, self.UN_PAUSE_APP_BACKGROUND)
        AllBinarySensorManager.getInstance():init()
        local gameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
        if gameCanvasRunnableInterface ~= NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE then
            gameCanvasRunnableInterface:unPause()
        else
            self.logUtil:putF("<<<<<< Null", self, self.UN_PAUSE_APP_BACKGROUND)
        end
end


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


function GameMidlet:destroyApp(unconditional)
        local METHOD_NAME = "GameMidlet::destroyApp"
        local try_ok, try_error = pcall(function()
            PreLogUtil.put(tostring(GameStatisticsFactory.getInstance()), self, METHOD_NAME)
            local gameAdState = self.gameAdStateFactory:getCurrentInstance()
            gameAdState:getAdvertisements():stopAll()
            if not self:isDestroyed() then
                self:stopGameCanvasRunnableInterface()
                self:setGameCanvasRunnableInterface(NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE)
                self:mediaShutdown()
            else
                self.logUtil:putF("Midlet Managment Error: Midlet Should Only Be Destroyed Once", self, METHOD_NAME)
            end
            ProgressMidlet.destroyApp(self, true)
            PreLogUtil.put(self.commonStrings.END, self, METHOD_NAME)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, METHOD_NAME, e)
        end
        self.logUtil:putF(self.commonStrings.END, self, METHOD_NAME)
end


-- throws MIDletStateChangeException
function GameMidlet:startApp()
        local try_ok, try_error = pcall(function()
            local gameAdState = self.gameAdStateFactory:getCurrentInstance()
            gameAdState:getAdvertisements():startAll()
            local START_APP = "startApp"
            self.logUtil:putF(self.commonStrings.START, self, START_APP)
            local gameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
            if gameCanvasRunnableInterface == NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE then
                self.gameMidletStateFactory:setCurrentGameState(self.gameStateFactory.NO_GAME_STATE)
                self:setDemo()
            else
                self.logUtil:putF("GameCanvasRunnableInterface is available", self, START_APP)
                if gameCanvasRunnableInterface == self:getCurrentDisplayable() then
                    self:unPauseAppBackground(false)
                else
                    self.logUtil:putF("GameCanvasRunnableInterface is not current displayable", self, START_APP)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "startApp", e)
            self:destroyApp(false)
            self:notifyDestroyed()
        end
end


function GameMidlet:commandAction(command, displayable)
        local try_ok, try_error = pcall(function()
            local displayableAsString = self.NO_DISPLAYABLE
            if displayable ~= nil then
                displayableAsString = tostring(displayable)
            end
            local label = self.NO_COMMAND
            if command ~= nil then
                label = command:getLabel()
            end
            PreLogUtil.put(tostring(StringMaker.new():append(self.COMMAND_NAME):append(label):append(self.DISPLAYABLE):append(displayableAsString)), self, self.COMMAND_ACTION)
            local gameCommandsFactory = GameCommandsFactory.getInstance()
            local allbinaryGameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
            local gameCanvasRunnableInterface = allbinaryGameCanvasRunnableInterface
            if command == gameCommandsFactory.SHOW_GAME_CANVAS then
                if self:getDisplay():getCurrent() ~= gameCanvasRunnableInterface and allbinaryGameCanvasRunnableInterface:getType() ~= NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE:getType() then
                    self:setDisplay(gameCanvasRunnableInterface)
                end
                self:unPauseAppBackground(false)
            elseif command == gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS then
                local menuListener = displayable
                menuListener:close()
                self:setDisplay(gameCanvasRunnableInterface)
                self:unPauseAppBackground(false)
            elseif command == gameCommandsFactory.EXIT_COMMAND then
                if GameMidletEventHandler.getInstance():getEventListenerInterfaceListP():size() == 0 then
                    self:exitProgress(true)
                end
                GameMidletEventHandler.getInstance():fireEvent(DemoGameMidletEvent.new(self, DemoGameMidletStateFactory.getInstance().NONE))
            elseif command == gameCommandsFactory.EXIT_WITHOUT_PROGRESS_COMMAND then
                self:exitProgress(false)
            elseif command == gameCommandsFactory.START_COMMAND or command == gameCommandsFactory.RESTART_COMMAND or command == gameCommandsFactory.CONTINUE_COMMAND then
                if self.gameMidletStateFactory:getCurrentGameState() ~= self.gameStateFactory.PLAYING_GAME_STATE or command == gameCommandsFactory.RESTART_COMMAND then
                    if self.gameStartTimeHelper:isTimeTNT() then
                        if command == gameCommandsFactory.START_COMMAND and self:isDemoLoading() then
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
            elseif command == gameCommandsFactory.BUY_COMMAND then
                local inApplicationPurchaseFactory = InApplicationPurchaseFactory.getInstance()
                local list = LockableFeatureFactory.getInstance():getList()
                local lockableFeature = list:get(0)
                if list:size() > 0 and not inApplicationPurchaseFactory:isPurchased(lockableFeature) then
                    inApplicationPurchaseFactory:purchase(lockableFeature)
                else
                    TextNotificationUtil.getInstance():fireSuccess("Already Purchased")
                end
            elseif command == gameCommandsFactory.QUIT_COMMAND then
                if self.gameStartTimeHelper:isTimeTNT() then
                    if java_instanceof(displayable, HighScoreTextBox) then
                        local menuListener = displayable
                        menuListener:close()
                    end
                    self:stopGameCanvasRunnableInterface()
                    self.gameMidletStateFactory:setCurrentGameState(self.gameStateFactory.NO_GAME_STATE)
                    self:setDemo()
                end
            elseif command == self.myCommandsFactory.RESUME_COMMAND then
                self:unPauseAppBackground(false)
            elseif command == self.myCommandsFactory.PAUSE_COMMAND then
                self:pauseAppBackground(false)
            elseif command == self.myCommandsFactory.SET_DISPLAYABLE then
                self:pauseAppBackground(false)
                self:setDisplay(displayable)
            elseif command == gameCommandsFactory.SET_MENU_DISPLAYABLE then
                self:pauseAppBackground(false)
                local menuListener = displayable
                menuListener:open()
                self:setDisplay(displayable)
            elseif command == gameCommandsFactory.START_TRACE then
                self.debugInterface:start()
                local gameCanvas = allbinaryGameCanvasRunnableInterface
                gameCanvas:addCommand(gameCommandsFactory.STOP_TRACE)
                gameCanvas:removeCommand(gameCommandsFactory.START_TRACE)
            elseif command == gameCommandsFactory.STOP_TRACE then
                self:pauseAppBackground(false)
                self.debugInterface:stop()
                self:unPauseAppBackground(false)
                local gameCanvas = allbinaryGameCanvasRunnableInterface
                gameCanvas:addCommand(gameCommandsFactory.START_TRACE)
                gameCanvas:removeCommand(gameCommandsFactory.STOP_TRACE)
            elseif command == gameCommandsFactory.DEFAULT_OPTIONS then
                local tempDisplayable = displayable
                if java_instanceof(tempDisplayable, GameOptionsForm) then
                    GameFeatureFormUtil.getInstance():setDefault(tempDisplayable)
                end
            elseif command == GameInputMappingInstructionsCanvas.DISPLAY then
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
            elseif command == HighScoreCommands.getInstance().DISPLAY then
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:createHighScoresCanvas())
            elseif command == GameInputMappingInstructionsCanvas.CLOSE then
                local menuListener = displayable
                menuListener:close()
                self:commandAction(GameInputMappingCanvas.DISPLAY, NullCanvas.NULL_CANVAS)
            elseif command == GameInputMappingCanvas.DISPLAY then
                if J2MEUtil.isHTML() then
                    self:pauseAppBackground(false)
                end
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getInputMappingCanvas())
            elseif command == GameInputMappingCanvas.DEFAULT then
                local tempDisplayable = displayable
                if java_instanceof(tempDisplayable, GameInputMappingCanvas) then
                    local gameInputMappingCanvas = tempDisplayable
                    gameInputMappingCanvas:setDefault()
                end
            elseif command == InGameOptionsForm.DISPLAY then
                self:pauseAppBackground(false)
                local progressCanvas = ProgressCanvasFactory.getInstance()
                progressCanvas:addNormalPortion(50, "In Game Options")
                local layerManager = self:createGameLayerManager()
                local inGameOptionsFormFactory = InGameOptionsFormFactory.getInstance()
                inGameOptionsFormFactory:init(self, InGameFeatures.new(), "Options In Game", layerManager:getBackgroundBasicColor(), layerManager:getForegroundBasicColor())
                local inGameOptionsForm = inGameOptionsFormFactory:get()
                inGameOptionsForm:setItemStateListener(allbinaryGameCanvasRunnableInterface)
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, inGameOptionsForm)
            elseif command == InGameOptionsForm.DEFAULT then
                local inGameOptionsForm = InGameOptionsFormFactory.getInstance():get()
                GameFeatureFormUtil.getInstance():setDefault(inGameOptionsForm)
            elseif command == gameCommandsFactory.DISPLAY_OPTIONS then
                AllBinaryMediaManager.setMuted(true)
                self:stopAll()
                local mainFeatureFactory = MainFeatureFactory.getInstance()
                self.isFullScreen = self.features:isFeature(mainFeatureFactory.FULL_SCREEN)
                ResizableListenerHandler.getInstance():fireEvent(true)
                self:setResized(false)
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getGameOptionsForm())
            elseif command == gameCommandsFactory.CLOSE_OPTIONS then
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
            elseif command == gameCommandsFactory.DISPLAY_LOAD_FORM then
                self:pauseAppBackground(false)
                local keyValuePersistance = GamePersistanceSingleton.getInstance()
                keyValuePersistance:clear()
                keyValuePersistance:loadAll(self.abeClientInformation)
                if self:getLoadGameForm() == CommandForm.getNullCommandForm() then
                    local layerManager = self:createGameLayerManager()
                    self:setLoadGameForm(LoadGameForm.new(self, "Load Game", layerManager:getBackgroundBasicColor(), layerManager:getForegroundBasicColor()))
                else
                    self:getLoadGameForm():update()
                end
                self:commandAction(gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getLoadGameForm())
            elseif command == gameCommandsFactory.LOAD_FILE then
                local loadGameForm = self:getLoadGameForm()
                local index = loadGameForm:getSelectedId()
                if index ~= -1 then
                    local keyValuePersistance = GamePersistanceSingleton.getInstance()
                    self:setStartStateHashtable(keyValuePersistance:get(index))
                    local menuListener = self:getLoadGameForm()
                    menuListener:close()
                    PreLogUtil.put(tostring(BasicMotionGesturesHandler.getInstance()), self, self.COMMAND_ACTION)
                    self:commandAction(gameCommandsFactory.START_COMMAND, NullCanvas.NULL_CANVAS)
                    PreLogUtil.put(tostring(BasicMotionGesturesHandler.getInstance()), self, self.COMMAND_ACTION)
                end
            elseif command == gameCommandsFactory.DELETE_FILE then
                local loadGameForm = self:getLoadGameForm()
                local index = loadGameForm:getSelectedText()
                if index ~= -1 then
                    local keyValuePersistance = GamePersistanceSingleton.getInstance()
                    keyValuePersistance:delete(self.abeClientInformation, index)
                    keyValuePersistance:clear()
                    keyValuePersistance:loadAllSize(self.abeClientInformation, 1)
                    self:getLoadGameForm():update()
                end
            elseif command == gameCommandsFactory.SAVE then
                local keyValuePersistance = GamePersistanceSingleton.getInstance()
                self:pauseAppBackground(false)
                keyValuePersistance:save(self.abeClientInformation, self:getCurrentStateHashtable())
                self:unPauseAppBackground(false)
            elseif command == HighScoreUtil.SUBMIT_TEXTBOX_COMMAND then
                self.logUtil:putF("Submitted Score", self, self.COMMAND_ACTION)
                if java_instanceof(displayable, HighScoreTextBox) then
                    local highScoreTextBox = displayable
                    highScoreTextBox.submitted = true
                end
                allbinaryGameCanvasRunnableInterface:setHighScoreSubmitted(true)
                self:commandAction(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS, displayable)
            elseif command == gameCommandsFactory.DISPLAY_ABOUT then
                self.aboutCommandProcessor:process(self, gameCommandsFactory.SET_MENU_DISPLAYABLE, self:getAboutCanvas())
            elseif command == gameCommandsFactory.OPEN_WEB_URL then
                self.webCommandProcessor:process(self, gameCommandsFactory.OPEN_WEB_URL, NullCanvas.NULL_CANVAS)
            elseif command == gameCommandsFactory.TOGGLE_KEYBOARD then
                local virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
                virtualKeyboardEventHandler:fireEvent(virtualKeyboardEventHandler.SHOW_EVENT)
            elseif self.tsUtil:compareTo(command:getLabel(), gameCommandsFactory.TOGGLE_FULLSCREEN:getLabel()) == 0 then
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
            self.logUtil:put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(command:getLabel())), self, self.midletStrings.COMMAND_ACTION, e)
            if command ~= GameCommandsFactory.getInstance().EXIT_COMMAND then
                self:exitProgress(false)
            end
        end
end


function GameMidlet:updateFullScreen()
        local mainFeatureFactory = MainFeatureFactory.getInstance()
        local isFullScreen = self.features:isFeature(mainFeatureFactory.FULL_SCREEN)
        local displayable = self:getDisplay():getCurrent()
        if java_instanceof(displayable, Canvas) then
            local canvas = displayable
            canvas:setFullScreenMode(isFullScreen)
        end
end


function GameMidlet:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function GameMidlet:getInputMappingInstructionsCanvas()
        return GameInputMappingInstructionsCanvas.new(self, self:createGameLayerManager())
end


-- throws Exception
function GameMidlet:getInputMappingCanvas()
        return GameInputMappingCanvas.new(self.abeClientInformation, self, self:createGameLayerManager(), self:getHelpPaintable())
end


-- throws Exception
function GameMidlet:getAboutCanvas()
        return BasicPaintablesCanvas.new(self, CanvasStrings.getInstance().ABOUT, self:createGameLayerManager(), AboutPaintableFactory.getInstance().paintableArray)
end


-- throws Exception
function GameMidlet:getHelpPaintable()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function GameMidlet:createHighScoresCanvas()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function GameMidlet:startGameCanvasRunnableInterface()
        local threadFactoryUtil = ThreadFactoryUtil.getInstance()
        self.thread = threadFactoryUtil:getInstanceGameCanvasRunnable(self.allbinaryGameCanvasRunnableInterface)
        self.logUtil:putF(tostring(StringMaker.new():append("Thread Priority: "):appendint(java_int(self.thread:getPriority()))), self, "startGameCanvasRunnableInterface")
        self.allbinaryGameCanvasRunnableInterface:setThread(self.thread)
        threadFactoryUtil:start(self.thread)
end


-- throws Exception
function GameMidlet:stopGameCanvasRunnableInterface()
        self.logUtil:putF(self.commonStrings.START, self, self.gameStrings.STOP_GAME_CANVAS_RUNNABLE_INTERFACE)
        GameNotificationEventHandler.getInstance():removeAllListeners()
        ColorChangeEventHandler.getInstance():removeAllListeners()
        GameEventHandlerUtil.removeAllListeners()
        local gameCanvasRunnableInterface = self.allbinaryGameCanvasRunnableInterface
        if gameCanvasRunnableInterface ~= NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE then
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


function GameMidlet:getGameCanvasRunnableInterface()
        return self.allbinaryGameCanvasRunnableInterface
end


function GameMidlet:setGameCanvasRunnableInterface(gameCanvasRunnableInterface)
        self.allbinaryGameCanvasRunnableInterface = gameCanvasRunnableInterface
end


function GameMidlet:createGameLayerManager()
        local gameInfo = GameInfo.new(GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 1, 1)
        return AllBinaryGameLayerManager.new(self.basicColorFactory.BLACK, self.basicColorFactory.WHITE, gameInfo)
end


function GameMidlet:getGameOptionsForm()
        local layerManager = self:createGameLayerManager()
        return GameOptionsFormFactory.getInstance():init(self, "Game Options", layerManager:getBackgroundBasicColor(), layerManager:getForegroundBasicColor())
end


-- throws Exception
function GameMidlet:save()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.SAVE)
        local hashtable = self:getCurrentStateHashtable()
        GamePersistanceSingleton.getInstance():save(self.abeClientInformation, hashtable)
end


-- throws Exception
function GameMidlet:getCurrentStateHashtable()
        self.logUtil:putF(self.commonStrings.START, self, "getCurrentStateHashtable")
        local hashtable = StdUtil.getInstance():createHashtable()
        if self.allbinaryGameCanvasRunnableInterface ~= NullGameCanvasRunnable.NULL_GAME_CANVAS_RUNNABLE then
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


function GameMidlet:setLoadGameForm(loadGameForm)
        self.loadGameForm = loadGameForm
end


function GameMidlet:getLoadGameForm()
        return self.loadGameForm
end


function GameMidlet:setResized(resized)
        self.resized = resized
end


function GameMidlet:isResized()
        return self.resized
end


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

return GameMidlet

