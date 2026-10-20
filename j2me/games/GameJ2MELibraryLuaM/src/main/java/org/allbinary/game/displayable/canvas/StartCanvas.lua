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

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Item = require("javax.microedition.lcdui.Item")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Animation = require("org.allbinary.animation.Animation")
local IndexedAnimationBehavior = require("org.allbinary.animation.IndexedAnimationBehavior")
local SpecialAnimation = require("org.allbinary.animation.special.SpecialAnimation")
local GameAdStateFactory = require("org.allbinary.business.advertisement.GameAdStateFactory")
local BaseGameStatistics = require("org.allbinary.canvas.BaseGameStatistics")
local CustomGameMenuUtil = require("org.allbinary.canvas.CustomGameMenuUtil")
local FullScreenUtil = require("org.allbinary.canvas.FullScreenUtil")
local GameStatisticsFactory = require("org.allbinary.canvas.GameStatisticsFactory")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local GameAdState = require("org.allbinary.game.GameAdState")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local ChangedGameFeatureListener = require("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local BasicBuildGameInitializerFactory = require("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local GameInitializationUtil = require("org.allbinary.game.init.GameInitializationUtil")
local GameInputStrings = require("org.allbinary.game.input.GameInputStrings")
local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local DownGameKeyEventHandler = require("org.allbinary.game.input.event.DownGameKeyEventHandler")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local GameKeyEventHandler = require("org.allbinary.game.input.event.GameKeyEventHandler")
local UpGameKeyEventHandler = require("org.allbinary.game.input.event.UpGameKeyEventHandler")
local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local SWTUtil = require("org.allbinary.game.layer.SWTUtil")
local DemoGameMidlet = require("org.allbinary.game.midlet.DemoGameMidlet")
local HighScoreCommands = require("org.allbinary.game.score.HighScoreCommands")
local HighScores = require("org.allbinary.game.score.HighScores")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelper = require("org.allbinary.game.score.HighScoresHelper")
local HighScoresPaintable = require("org.allbinary.game.score.HighScoresPaintable")
local NullHighScoresSingletonFactory = require("org.allbinary.game.score.NullHighScoresSingletonFactory")
local GameState = require("org.allbinary.game.state.GameState")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local ResizableListenerHandler = require("org.allbinary.graphics.ResizableListenerHandler")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = require("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local FormType = require("org.allbinary.graphics.form.FormType")
local FormTypeFactory = require("org.allbinary.graphics.form.FormTypeFactory")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local CurrentDisplayableFactory = require("org.allbinary.graphics.opengles.CurrentDisplayableFactory")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local OpenGLThreadUtil = require("org.allbinary.graphics.opengles.OpenGLThreadUtil")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local StatePaintable = require("org.allbinary.graphics.paint.StatePaintable")
local StatePaintableFactory = require("org.allbinary.graphics.paint.StatePaintableFactory")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local InApplicationPurchaseFactory = require("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")
local LockableFeature = require("org.allbinary.logic.system.security.licensing.LockableFeature")
local LockableFeatureFactory = require("org.allbinary.logic.system.security.licensing.LockableFeatureFactory")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = require("org.allbinary.media.audio.AllBinaryMediaManager")
local EarlySoundsFactory = require("org.allbinary.media.audio.EarlySoundsFactory")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StartCanvas = {}
StartCanvas.__index = StartCanvas
StartCanvas.className = "StartCanvas"
setmetatable(StartCanvas, {__index = RunnableCanvas})

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
    self.highScoresFactoryInterface = nil
    self.menuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuForm = ScrollSelectionForm.getNullScrollSelectionForm()
    self.gameInitializationInterfaceFactoryInterface = nil
    self.initialized = false
    self.defaultPaintableInterface = NullPaintable.getInstance()
    self.paintableInterface = NullPaintable.getInstance()
    self.overlayPaintable = nil
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


function StartCanvas.new(abeClientInformation, commandListener, highScoresFactoryInterface, paintable, overlayPaintable, gameInitializationInterfaceFactoryInterface, isContinue)
    local self = setmetatable(RunnableCanvas.new(commandListener, CurrentDisplayableFactory.getInstance().DEFAULT_CHILD_NAME_LIST, true), StartCanvas)
    self:_init_fields()
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


function StartCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function StartCanvas:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error = pcall(function()
            local scrollSelectionForm = self:getMenuForm()
            if scrollSelectionForm ~= nil then
                local formType = FormTypeFactory.getInstance():getFormType()
                local rectangle = self.formUtil:createFormRectangle()
                scrollSelectionForm:init(rectangle, formType)
            end
            self.overlayPaintable:init()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
end


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
                if list:size() > 0 and not inApplicationPurchaseFactory:isPurchased(list:get(0)) then
                    commandList:add(gameCommandsFactory.BUY_COMMAND)
                end
            end
            commandList:add(HighScoreCommands.getInstance().DISPLAY)
            local try_ok, try_error = pcall(function()
                local isOverScan = OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan()
                if SWTUtil.isSWT then
                    commandList:add(GameInputMappingCanvas.DISPLAY)
                elseif not isOverScan then
                    commandList:add(gameCommandsFactory.DISPLAY_OPTIONS)
                    commandList:add(gameCommandsFactory.DISPLAY_LOAD_FORM)
                    commandList:add(GameInputMappingCanvas.DISPLAY)
                end
            end)
            if not try_ok then
                local e = try_error
            end
            commandList:add(gameCommandsFactory.DISPLAY_ABOUT)
            local commandArray = commandList:toArray()
            return commandArray
        end
end


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


-- throws Exception
function StartCanvas:initPostPaint()
end


-- throws Exception
function StartCanvas:mediaInit()
        AllBinaryMediaManager.init(EarlySoundsFactory.getInstance())
end


function StartCanvas:itemStateChanged(item)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end


-- throws Exception
function StartCanvas:initMenu()
        self:close()
        self:open()
end


function StartCanvas:open()
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():addListener(self:getMenuInputProcessor())
end


function StartCanvas:close()
        BasicMotionGesturesHandler.getInstance():removeListener(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():removeListener(self:getMenuInputProcessor())
end


function StartCanvas:getSourceId()
        return StartCanvas.id
end


function StartCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end


function StartCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end


function StartCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end


function StartCanvas:keyPressedByDevice(keyCode, deviceId)
        self:addGameKeyEvent(keyCode, false)
end


function StartCanvas:keyReleasedByDevice(keyCode, deviceId)
        self:removeGameKeyEvent(keyCode, false)
end


function StartCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self:addGameKeyEvent(keyCode, true)
        end
end


function StartCanvas:addGameKeyEvent(keyCode, repeated)
        local try_ok, try_error = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if gameKey ~= self.NONE then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                DownGameKeyEventHandler.getInstance():fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.ADD_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end


function StartCanvas:removeGameKeyEvent(keyCode, repeated)
        local try_ok, try_error = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if gameKey ~= self.NONE then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                UpGameKeyEventHandler.getInstance():fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.REMOVE_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.REMOVE_KEY_EVENT, e)
        end
end


function StartCanvas:pause()
        self:close()
        self:setPaused(true)
end


function StartCanvas:unPause()
        self:open()
        self:setPaused(false)
end


function StartCanvas:isPausable()
        if CurrentDisplayableFactory.getInstance():getUsedRunnable() == NullWaitGameRunnable.getInstance() then
            return true
        else
            return false
        end
end


function StartCanvas:isGameOver()
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.NOT_IMPLEMENTED):append(" since not a game")), self, "isGameOver")
        return false
end


-- throws Exception
function StartCanvas:setLoadStateHashtable(hashtable)
        self.logUtil:putF("Trying to continue a demo lol - only continue a game canvas not the demo", self, "setLoadStateHashtable")
end


-- throws Exception
function StartCanvas:getLoadStateHashtable()
        self.logUtil:putF("Trying to continue a demo lol - only continue a game canvas not the demo", self, "getLoadStateHashtable")
        return self.stdUtil.NULL_TABLE
end


-- throws Exception
function StartCanvas:getCurrentStateHashtable()
        self.logUtil:putF("Trying to save the AI lol", self, "getCurrentStateHashtable")
        return self.stdUtil.NULL_TABLE
end


function StartCanvas:setHighScoreSubmitted(isNotUsed)
end


function StartCanvas:paint(graphics)
        self.paintableInterface:paint(graphics)
        self.paintedSpecialAnimationInterface:paintXY(graphics, 0, 0)
        self.highScoresPaintable:paint(graphics)
        self:getBasicGameDemoPaintable():paint(graphics)
        self.overlayPaintable:paint(graphics)
        self.progressPaintable:paint(graphics)
end


function StartCanvas:paintThreed(graphics)
        self.paintableInterface:paintThreed(graphics)
        self.paintedSpecialAnimationInterface:paintThreedXYZ(graphics, 0, 0, 0)
end


function StartCanvas:processGameOver()
        self.logUtil:putF("Not Implemented since not a game", self, "setGameOver")
end


function StartCanvas:demoStateChange()
        local newState = self.state + 1
        if newState > 2 then
            newState = 0
        elseif newState == 2 then
            if not self.highScoresHelper:isAnyHighScores() then
                newState = 0
            else
                local highScores = self.highScoresHelper:getNextHighScores()
                if highScores == NullHighScoresSingletonFactory.getInstance() then
                    newState = 0
                else
                    self:getRealHighScoresPaintable():setHighScores(highScores)
                end
            end
        end
        self:setState(newState)
        self:updateDemoState()
end


function StartCanvas:updateDemoState()
        PreLogUtil.put(tostring(SmallIntegerSingletonFactory.getInstance():createInstance(self.state)), self, self.SET_STATE)
        self:getBasicGameDemoPaintable():setState(self.state)
        if self.state == 0 then
            self.highScoresPaintable = NullPaintable.getInstance()
            self.paintedSpecialAnimationInterface = self:getSpecialAnimationInterface()
            self:getSpecialAnimationInterface():reset()
        elseif self.state == 1 then
            self.paintedSpecialAnimationInterface = SpecialAnimation.getInstance()
        elseif self.state == 2 then
            self.highScoresPaintable = self:getRealHighScoresPaintable()
        end
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:processPageAdState()
end


-- throws Exception
function StartCanvas:getNextRandom()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function StartCanvas:createGameLayerManager(randomValue)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function StartCanvas:createRunnable(randomLevel)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function StartCanvas:createCanvas()
        self.highScoresPaintable = NullPaintable.getInstance()
        local randomLevel = self:getNextRandom()
end


-- throws Exception
function StartCanvas:start()
end


function StartCanvas:preDemoProcess()
        self.overlayPaintable:update()
end


-- throws Exception
function StartCanvas:process()
        self:getMenuInputProcessor():processInputList()
        self:preDemoProcess()
        if self.state == 0 then
            local indexedAnimationBehavior = self:getSpecialAnimationInterface():getAnimationBehavior()
            if indexedAnimationBehavior.loopIndex < 1 then
                self.timeDelayHelper:setStartTimeTNT()
            end
            local demoGameMidlet = self:getCustomCommandListener()
        end
end


-- throws Exception
function StartCanvas:startDemoGame()
end


-- throws Exception
function StartCanvas:processGame()
        self.gameRunnable:run()
        self.specialAnimationInterface:nextFrame()
        self:process()
end


function StartCanvas:run()
        self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
        local try_ok, try_error = pcall(function()
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
        self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
end


function StartCanvas:setRunning(running)
        RunnableCanvas.setRunning(self, running)
        local try_ok, try_error = pcall(function()
            if (self.features:isDefault(self.openGLFeatureFactory.OPENGL) or J2MEUtil.isHTML()) and not running then
                local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                currentDisplayableFactory:clearRunnable()
                self:end_()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.SET_RUNNING, e)
        end
end


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


function StartCanvas:setGameState(gameState)
end


function StartCanvas:getGameState()
        return self.gameStateFactory.PLAYING_GAME_STATE
end


function StartCanvas:getState()
        return self.state
end


function StartCanvas:setState(state)
        self.state = state
end


function StartCanvas:isHighScoreSubmitted()
        self.logUtil:putF("Wow the AI got a high score!", self, "isHighScoreSubmitted")
        return false
end


function StartCanvas:getRealHighScoresPaintable()
        return self.realHighScoresPaintable
end


function StartCanvas:setSpecialAnimationInterface(specialAnimationInterface)
        specialAnimationInterface:setFrame(0)
        self.specialAnimationInterface = specialAnimationInterface
end


function StartCanvas:getSpecialAnimationInterface()
        return self.specialAnimationInterface
end


function StartCanvas:setPaintableInterface(paintableInterface)
        self.paintableInterface = paintableInterface
end


function StartCanvas:getPaintableInterface()
        return self.paintableInterface
end


function StartCanvas:setDefaultPaintableInterface(defaultPaintableInterface)
        self.defaultPaintableInterface = defaultPaintableInterface
end


function StartCanvas:getDefaultPaintableInterface()
        return self.defaultPaintableInterface
end


function StartCanvas:getHighScoresFactoryInterface()
        return self.highScoresFactoryInterface
end


function StartCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end


function StartCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end


function StartCanvas:getMenuForm()
        return self.menuForm
end


function StartCanvas:setMenuForm(menuForm)
        self.menuForm = menuForm
end


function StartCanvas:isInitialized()
        return self.initialized
end


function StartCanvas:getOverlayPaintable()
        return self.overlayPaintable
end


function StartCanvas:setBasicGameDemoPaintable(basicGameDemoPaintable)
        self.basicGameDemoPaintable = basicGameDemoPaintable
end


function StartCanvas:getBasicGameDemoPaintable()
        return self.basicGameDemoPaintable
end


function StartCanvas:setTempWait(tempWait)
        self.tempWait = tempWait
end


function StartCanvas:getTempWait()
        return self.tempWait
end


function StartCanvas:isSingleThread()
        return OpenGLFeatureUtil.getInstance():isAnyThreed() or SWTUtil.isSWT
end


function StartCanvas:isRunningInAnotherThread()
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
            return true
        else
            return self:isRunning()
        end
end


function StartCanvas:getGameInitializationInterfaceFactoryInterface()
        return self.gameInitializationInterfaceFactoryInterface
end

StartCanvas.id = 0
StartCanvas.BOT_GAME_STATS = "Bot Game Statistics: "

return StartCanvas

