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

-- local ChoiceGroup = require("javax.microedition.lcdui.ChoiceGroup")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Item = require("javax.microedition.lcdui.Item")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local GameAdStateFactory = require("org.allbinary.business.advertisement.GameAdStateFactory")
local BaseGameStatistics = require("org.allbinary.canvas.BaseGameStatistics")
local GameStatisticsFactory = require("org.allbinary.canvas.GameStatisticsFactory")
local Processor = require("org.allbinary.canvas.Processor")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local DebugFactory = require("org.allbinary.debug.DebugFactory")
local NoDebug = require("org.allbinary.debug.NoDebug")
local GameAdState = require("org.allbinary.game.GameAdState")
local GameInfo = require("org.allbinary.game.GameInfo")
local GameStrings = require("org.allbinary.game.GameStrings")
local GameTypeFactory = require("org.allbinary.game.GameTypeFactory")
local Intermission = require("org.allbinary.game.Intermission")
local IntermissionCompositeInterface = require("org.allbinary.game.IntermissionCompositeInterface")
local IntermissionEnableListenerInterface = require("org.allbinary.game.IntermissionEnableListenerInterface")
local IntermissionInterface = require("org.allbinary.game.IntermissionInterface")
local PlayerTypesFactory = require("org.allbinary.game.PlayerTypesFactory")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local InGameFeatures = require("org.allbinary.game.configuration.InGameFeatures")
local InGameOptionsForm = require("org.allbinary.game.configuration.InGameOptionsForm")
local ChangedGameFeatureListener = require("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local GameInitializedEvent = require("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedEventHandler = require("org.allbinary.game.configuration.event.GameInitializedEventHandler")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local GameFeatureUtil = require("org.allbinary.game.configuration.feature.GameFeatureUtil")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local SensorFeatureFactory = require("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local TouchFeatureFactory = require("org.allbinary.game.configuration.feature.TouchFeatureFactory")
local GameLevelDisplayChangeEventListenersFactory = require("org.allbinary.game.displayable.GameLevelDisplayChangeEventListenersFactory")
local BasicBuildGameInitializerFactory = require("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local GameInitializationUtil = require("org.allbinary.game.init.GameInitializationUtil")
local GameInputStrings = require("org.allbinary.game.input.GameInputStrings")
local InputProcessor = require("org.allbinary.game.input.InputProcessor")
local NoPlayerGameInput = require("org.allbinary.game.input.NoPlayerGameInput")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local GameKeyEventHandler = require("org.allbinary.game.input.event.GameKeyEventHandler")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local SWTUtil = require("org.allbinary.game.layer.SWTUtil")
local ColorFillBasePaintable = require("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = require("org.allbinary.game.paint.ColorFillPaintableFactory")
local ResourceLoadingLevel = require("org.allbinary.game.resource.ResourceLoadingLevel")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local HighScore = require("org.allbinary.game.score.HighScore")
local HighScoresHelperBaseInterface = require("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresPaintable = require("org.allbinary.game.score.HighScoresPaintable")
local NullHighScoresSingletonFactory = require("org.allbinary.game.score.NullHighScoresSingletonFactory")
local HighScoreTextBox = require("org.allbinary.game.score.displayable.HighScoreTextBox")
local GameState = require("org.allbinary.game.state.GameState")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local GraphicsStrings = require("org.allbinary.graphics.GraphicsStrings")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local ScreenCapture = require("org.allbinary.graphics.ScreenCapture")
local ScreenCaptureFactory = require("org.allbinary.graphics.ScreenCaptureFactory")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GameTickDisplayInfoSingleton = require("org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = require("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local CommandCurrentSelectionFormFactory = require("org.allbinary.graphics.form.CommandCurrentSelectionFormFactory")
local FormPaintable = require("org.allbinary.graphics.form.FormPaintable")
local FormType = require("org.allbinary.graphics.form.FormType")
local FormTypeFactory = require("org.allbinary.graphics.form.FormTypeFactory")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local ScrollSelectionFormNoneFactory = require("org.allbinary.graphics.form.ScrollSelectionFormNoneFactory")
local CommandTextItemArrayFactory = require("org.allbinary.graphics.form.item.CommandTextItemArrayFactory")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local CurrentDisplayableFactory = require("org.allbinary.graphics.opengles.CurrentDisplayableFactory")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local OpenGLThreadUtil = require("org.allbinary.graphics.opengles.OpenGLThreadUtil")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullInitUpdatePaintable = require("org.allbinary.graphics.paint.NullInitUpdatePaintable")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local OpenGLImageSpecificFactory = require("org.allbinary.image.opengles.OpenGLImageSpecificFactory")
local SensorGameUpdateProcessor = require("org.allbinary.input.gyro.SensorGameUpdateProcessor")
local SingleSensorGameUpdateProcessor = require("org.allbinary.input.gyro.SingleSensorGameUpdateProcessor")
local BaseTouchInput = require("org.allbinary.input.motion.button.BaseTouchInput")
local NoButtonsTouchInputFactory = require("org.allbinary.input.motion.button.NoButtonsTouchInputFactory")
local TouchButtonFactory = require("org.allbinary.input.motion.button.TouchButtonFactory")
local TouchButtonsPaintableFactory = require("org.allbinary.input.motion.button.TouchButtonsPaintableFactory")
local TouchScreenFactory = require("org.allbinary.input.motion.button.TouchScreenFactory")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = require("org.allbinary.media.audio.AllBinaryMediaManager")
local PlayerQueue = require("org.allbinary.media.audio.PlayerQueue")
local PrimaryPlayerQueueFactory = require("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = require("org.allbinary.media.audio.SelectSound")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SecondaryThreadPool = require("org.allbinary.thread.SecondaryThreadPool")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local AllBinaryGameCanvasInterface = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local PopupMenuInterface = require("org.allbinary.game.displayable.canvas.PopupMenuInterface")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local AllBinaryGameCanvas = {}
AllBinaryGameCanvas.__index = AllBinaryGameCanvas
AllBinaryGameCanvas.className = "AllBinaryGameCanvas"
setmetatable(AllBinaryGameCanvas, {__index = RunnableCanvas})

function AllBinaryGameCanvas:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.touchFeatureFactory = TouchFeatureFactory.getInstance()
    self.openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
    self.touchButtonFactory = TouchButtonFactory.getInstance()
    self.gameAdStateFactory = GameAdStateFactory.getInstance()
    self.gameStrings = GameStrings.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.gameStateFactory = GameStateFactory.getInstance()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()
    self.gameRunnable = GameCanvasRunnable.new(self)
    self.gamePauseRunnable = GameCanvasPauseRunnable.new(self)
    self.formUtil = FormUtil.getInstance()
    self.myFormUtil = MyFormUtil.getInstance()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.gameSpecificPaintable = NullPaintable.getInstance()
    self.sensorGameUpdateProcessor = SingleSensorGameUpdateProcessor.new()
    self.endGameInfo = EndGameInfo.new()
    self.startIntermissionInterface = Intermission.new()
    self.endLevelIntermissionInterface = Intermission.new()
    self.gameLayerManager = AllBinaryGameLayerManager.getNullInstance()
    self.gameState = self.gameStateFactory.NO_GAME_STATE
    self.gameOver = false
    self.initialized = false
    self.gameStateTimeHelper = TimeDelayHelper.new(0)
    self.highScoresHelper = nil
    self.highScoreSubmitted = false
    self.realHighScoresPaintable = HighScoresPaintable.new()
    self.highScoresPaintable = NullPaintable.getInstance()
    self.localPlayerGameInputList = BasicArrayListD.new()
    self.isCheating = false
    self.hashtable = self.stdUtil.NULL_TABLE
    self.isSingleKeyRepeatableProcessing = false
    self.gameInitializationInterfaceFactoryInterface = BasicBuildGameInitializerFactory.NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY
    self.touchButtonsPaintable = NullPaintable.getInstance()
    self.touchPaintable = NullPaintable.getInstance()
    self.cheatProcessor = NoPlayerGameInput.getInstance()
    self.gameInputProcessor = Processor.getInstance()
    self.endGameProcessor = Processor.getInstance()
    self.realEndGameProcessor = Processor.getInstance()
    self.startIntermissionProcessor = Processor.getInstance()
    self.realStartIntermissionProcessor = Processor.getInstance()
    self.endGamePaintable = NullPaintable.getInstance()
    self.endGameStatePaintable = NullPaintable.getInstance()
    self.nonBotPaintable = NullPaintable.getInstance()
    self.intermissionPaintable = NullPaintable.getInstance()
    self.startIntermissionPaintable = NullInitUpdatePaintable.getInstance()
    self.mainStateProcessor = Processor.getInstance()
    self.processGameProcessor = Processor.getInstance()
    self.highScoresFactoryInterface = nil
    self.startLevel = 0
    self.mainMenuInputProcessor = NoMenuInputProcessor.getInstance()
    self.popupMenuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuForm = ScrollSelectionForm.getNullScrollSelectionForm()
    self.formPaintable = NullPaintable.getInstance()
    self.openMenuPaintable = NullPaintable.getInstance()
    self.menuPaintable = NullPaintable.getInstance()
    self.currentTouchInputFactory = NoButtonsTouchInputFactory.getInstance()
    self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(self.basicColorFactory.BLACK, true)
    self.baseGameStatistics = GameStatisticsFactory.getInstance()
    self.primaryPlayerQueue = PrimaryPlayerQueueFactory.getInstance()
    self.secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance()
    self.BUILD_GAME = "buildGame"
    self.gameTypeFactory = GameTypeFactory.getInstance()
    self.screenCapture = ScreenCaptureFactory.getInstance()
    self.basicMotionGesturesHandler = BasicMotionGesturesHandler.getInstance()
    self.gameKeyEventHandler = GameKeyEventHandler.getInstance()
    self.gameBehavior = nil
    self.menuBehavior = nil
    self.progressPaintable = ProgressCanvasFactory.getLazyInstance()
    self.fontHeightP = 0
    self.gameCanvasStartListener = NullDemoPaintable.NULL_DEMO_PAINTABLE
    self.rawGameInputProcessor = GameCanvasInputProcessor.new(self)
    self.rawInputProcessor = FormInputProcessor.new(self)
    self.inputProcessor = self:getRawGameInputProcessor()
    self.YIELD_SLEEP = 100
end


function AllBinaryGameCanvas.new(commandListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered)
    local self = setmetatable(RunnableCanvas.new(commandListener, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST, true), AllBinaryGameCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.highScoresHelper = highScoresFactoryInterface:createHighScoresHelper()
        self.gameInitializationInterfaceFactoryInterface = gameInitializationInterfaceFactoryInterface
        self:init(gameLayerManager, buffered)
        self.highScoresFactoryInterface = highScoresFactoryInterface
        if self.gameLayerManager:getGameInfo():getGameType() == self.gameTypeFactory.BOT or self.gameLayerManager:getGameInfo():getGameType() == self.gameTypeFactory.NONE then
            self.gameBehavior = DemoGameBehavior.getInstance()
            self.menuBehavior = BaseMenuBehavior.getInstance()
        else
            self.gameBehavior = BaseGameBehavior.getInstance()
            self.menuBehavior = self:getInGameMenuBehavior()
        end
        self:initPopupMenu()
        self:initMenu()
        self:initSpecialPaint()
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
    return self
end


function AllBinaryGameCanvas:updateMeasurement(graphics)
        local try_ok, try_error = pcall(function()
            local font = graphics:getFont()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(self.canvasStrings.FD_WIDTH):appendint(java_int(MyFontProcessor.defaultCharWidth(font))):append(self.canvasStrings.FD_HEIGHT):appendint(java_int(font:getHeight()))), self, self.canvasStrings.UPDATE_MEASUREMENT)
            self.fontHeightP = font:getHeight()
            self.myFormUtil:updateMeasurement(graphics)
            local popupMenuRectangle = self.myFormUtil:getPopupMenuRectangle()
            local basicPopupMenuPaintable = (self:getOpenMenuPaintable())
            basicPopupMenuPaintable:init(popupMenuRectangle)
            if self:getPopupMenuInputProcessor() ~= NoMenuInputProcessor.getInstance() then
                local popupMenuInputProcessor = (self:getPopupMenuInputProcessor())
                popupMenuInputProcessor:init(popupMenuRectangle)
            end
            self.myFontProcessor = MyFontProcessor.getInstance()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
end


function AllBinaryGameCanvas:getInGameMenuBehavior()
        return InGameMenuBehavior.getInstance()
end


function AllBinaryGameCanvas:setCurrentThread()
        if J2MEUtil.isHTML() then
            RunnableCanvas.setCurrentThreadFake(self)
        else
            RunnableCanvas.setCurrentThread(self)
        end
end


function AllBinaryGameCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function AllBinaryGameCanvas:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(tostring(DisplayInfoSingleton.getInstance()))), self, self.canvasStrings.UPDATE_MEASUREMENT)
            self.myFontProcessor = self.updateMyFontProcessor
            self.menuBehavior:onDisplayChangeEvent(self, displayChangeEvent)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
end


-- throws Exception
function AllBinaryGameCanvas:updateMenuFromEvent(displayChangeEvent)
        local formType = FormTypeFactory.getInstance():getFormType()
        local rectangle = self.formUtil:createFormRectangle()
        self.menuForm:init(rectangle, formType)
        if self.currentTouchInputFactory ~= NoButtonsTouchInputFactory.getInstance() then
            self.touchButtonFactory:toggle(self:isPaused(), self.currentTouchInputFactory:getList())
        end
        self.myFontProcessor = self.updateMyFontProcessor
end


-- throws Exception
function AllBinaryGameCanvas:processSleep()
        RunnableCanvas.processSleep(self)
        if AllBinaryMediaManager.update() then
            if not self.primaryPlayerQueue:process() then
                self.secondaryPlayerQueue:process()
            end
        end
        if self.menuInputProcessor:processInputList() ~= -1 then
            self.runnableCanvasRefreshHelper:process()
        end
end


-- throws Exception
function AllBinaryGameCanvas:initPopupMenu()
        if self.popupMenuInputProcessor == NoMenuInputProcessor.getInstance() then
            local features = Features.getInstance()
            local popupMenuRectangle = self.myFormUtil:getPopupMenuRectangle()
            if features:isFeature(self.touchFeatureFactory.TOUCH_ENABLED) then
                self:setOpenMenuPaintable(BasicPopupMenuPaintable.new(popupMenuRectangle, self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor()))
                self:setPopupMenuInputProcessor(PopupMenuInputProcessor.new(BasicArrayListD.new(), -1, self, popupMenuRectangle))
            end
        else
        end
end


function AllBinaryGameCanvas:initMenu()
        local try_ok, try_error = pcall(function()
            self.menuBehavior:initMenu(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "initMenu", e)
        end
end


-- throws Exception
function AllBinaryGameCanvas:initMenu2()
        self:closeMenu()
        local formType = FormTypeFactory.getInstance():getFormType()
        local gameLimitedCommandTextItemArrayFactory = GameLimitedCommandTextItemArrayFactory.getInstance()
        local commandTextItemArrayFactory = gameLimitedCommandTextItemArrayFactory:getCommandTextItemArrayFactory()
        local items = commandTextItemArrayFactory:getInstance(self:getCommandStack(), self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor())
        local rectangle = self.formUtil:createFormRectangle()
        self:setMenuForm(CommandCurrentSelectionFormFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, items, rectangle, formType, 25, false, self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor()))
        local scrollSelectionForm = self:getMenuForm()
        local features = Features.getInstance()
        if features:isFeature(self.touchFeatureFactory.TOUCH_ENABLED) then
            self.mainMenuInputProcessor = PopupCommandFormInputProcessor.new(BasicArrayListD.new(), -1, self, scrollSelectionForm, self:getPopupMenuInputProcessor())
        else
        end
        self:setMenuInputProcessor(self:getPopupMenuInputProcessor())
        if scrollSelectionForm ~= ScrollSelectionFormNoneFactory.getInstance() then
            self:setFormPaintable(FormPaintable.new(scrollSelectionForm))
        else
        end
        self:closeMenu()
end


function AllBinaryGameCanvas:updateMenu()
        local try_ok, try_error = pcall(function()
            self.menuBehavior:updateMenu(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "initMenu", e)
        end
end


-- throws Exception
function AllBinaryGameCanvas:updateMenu2()
        local scrollSelectionForm = self:getMenuForm()
        scrollSelectionForm:deleteAll()
        local gameLimitedCommandTextItemArrayFactory = GameLimitedCommandTextItemArrayFactory.getInstance()
        local commandTextItemArrayFactory = gameLimitedCommandTextItemArrayFactory:getCommandTextItemArrayFactory()
        local items = commandTextItemArrayFactory:getInstance(self:getCommandStack(), self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor())
        local size = (items.n or #items)
        for index = 0, size - 1 do
            scrollSelectionForm:append(items[index + 1])
        end
        local formType = FormTypeFactory.getInstance():getFormType()
        local rectangle = self.formUtil:createFormRectangle()
        scrollSelectionForm:init(rectangle, formType)
end


function AllBinaryGameCanvas:pause()
        self.gameBehavior:pause(self)
        self:closeMenu()
        RunnableCanvas.pause(self)
        self.touchButtonFactory:toggle(self:isPaused(), BasicArrayListUtil.getInstance():getImmutableInstance())
        self.tsUtil:gc()
end


function AllBinaryGameCanvas:unPause()
        self.logUtil:putF(self.commonStrings.START, self, self.gameStrings.UNPAUSE)
        self:closeMenu()
        self.tsUtil:gc()
        RunnableCanvas.unPause(self)
        self.touchButtonFactory:toggle(self:isPaused(), BasicArrayListUtil.getInstance():getImmutableInstance())
        self.gameBehavior:unPause(self)
end


function AllBinaryGameCanvas:isPausable()
        if CurrentDisplayableFactory.getInstance():getUsedRunnable() == NullWaitGameRunnable.getInstance() then
            return true
        else
            return false
        end
end


-- throws Exception
function AllBinaryGameCanvas:popupMenu()
        self.menuBehavior:popupMenu(self)
end


-- throws Exception
function AllBinaryGameCanvas:popupMenu2()
        self.primaryPlayerQueue:add(SelectSound.getInstance())
        self:setMenuPaintable(self:getFormPaintable())
        self:setMenuInputProcessor(self.mainMenuInputProcessor)
        self.basicMotionGesturesHandler:addListenerInterface(self.mainMenuInputProcessor)
        self.gameKeyEventHandler:addListener(self.mainMenuInputProcessor)
end


-- throws Exception
function AllBinaryGameCanvas:toggleMenu()
        self.logUtil:putF(self.commonStrings.START, self, self.gameStrings.TOGGLE_MENU)
        if self:getMenuPaintable() == self:getOpenMenuPaintable() then
            self:pause()
            self:updateMenu()
            self:popupMenu()
        elseif self:getMenuPaintable() == self:getFormPaintable() then
            self.primaryPlayerQueue:add(SelectSound.getInstance())
            self:unPause()
        end
end


function AllBinaryGameCanvas:closeMenu()
        self.menuBehavior:closeMenu(self)
end


function AllBinaryGameCanvas:closeMenu2()
        self:setMenuPaintable(self:getOpenMenuPaintable())
        self.basicMotionGesturesHandler:removeListener(self.mainMenuInputProcessor)
        self.gameKeyEventHandler:removeListener(self.mainMenuInputProcessor)
        self:setMenuInputProcessor(self:getPopupMenuInputProcessor())
end


function AllBinaryGameCanvas:open()
        self.basicMotionGesturesHandler:addListenerInterface(self.menuInputProcessor)
        self.gameKeyEventHandler:addListener(self.menuInputProcessor)
end


function AllBinaryGameCanvas:close()
        self.basicMotionGesturesHandler:removeListener(self.menuInputProcessor)
        self.gameKeyEventHandler:removeListener(self.menuInputProcessor)
        self.primaryPlayerQueue:clear()
        self.secondaryPlayerQueue:clear()
end


-- throws Exception
function AllBinaryGameCanvas:processorInit()
        self:setMainStateProcessor(Processor.getInstance())
        self:setProcessGameProcessorInit()
end


function AllBinaryGameCanvas:setProcessGameProcessorInit()
        self:setProcessGameProcessor(GameProcessor.new(self))
end


function AllBinaryGameCanvas:initSpecialPaint()
        self.menuBehavior:initSpecialPaint(self)
end


-- throws Exception
function AllBinaryGameCanvas:init(gameLayerManager, buffered)
        self.gameStateTimeHelper:setStartTimeTNT()
        self:setHighScoreSubmitted(false)
        self:setLayerManager(gameLayerManager)
        if not buffered then
            local BUFF_MESSAGE = "XXX Not Buffering Causes Concurrency Issues XXX"
            self.logUtil:putF(BUFF_MESSAGE, self, self.commonStrings.CONSTRUCTOR)
        else
            error(java_exception("Exception", "Buffering is disabled"), 0)
        end
        self:setGameInputProcessor(Processor.getInstance())
        local features = Features.getInstance()
        if features:isFeature(GameFeatureFactory.getInstance().CHEATING) then
            self.isCheating = true
            self.cheatProcessor = CheatGameInputProcessor.new(self)
            self.gameKeyEventHandler:addListener(self.cheatProcessor)
        else
            self.isCheating = false
            self.cheatProcessor = NoPlayerGameInput.getInstance()
        end
        self.realEndGameProcessor = EndGameProcessor.new(self)
        self:setEndGameProcessor(Processor.getInstance())
        self.realStartIntermissionProcessor = StartIntermissionProcessor.new(self)
        self.startIntermissionProcessor = Processor.getInstance()
        self:setEndGameStatePaintable(EndGamePaintable.new(self))
        self:setEndGamePaintable(NullPaintable.getInstance())
        self:setIntermissionPaintable(NullPaintable.getInstance())
        self:getStartIntermissionInterface():setListener(self)
end


function AllBinaryGameCanvas:notifyIntermission(enable)
        if enable then
            self.startIntermissionProcessor = self.realStartIntermissionProcessor
        else
            self.startIntermissionProcessor = Processor.getInstance()
        end
        if enable then
            self:setIntermissionPaintable(self:getStartIntermissionPaintable())
        else
            self:setIntermissionPaintable(NullPaintable.getInstance())
        end
end


-- throws Exception
function AllBinaryGameCanvas:mediaInit()
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end


-- throws Exception
function AllBinaryGameCanvas:initConfigurable(abeClientInformation)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:addNormalPortion(50, "Setting Configurables")
        GameInitializationUtil.getInstance():initGame(abeClientInformation, self, self.gameInitializationInterfaceFactoryInterface)
        local gameFeatureFactory = GameFeatureFactory.getInstance()
        local changedGameFeatureListener = ChangedGameFeatureListener.getInstance()
        if changedGameFeatureListener:isChangedFeature(gameFeatureFactory.SOUND) then
            local features = Features.getInstance()
            self.logUtil:putF(tostring(StringMaker.new():append("Sound Changing To: "):appendboolean(features:isFeature(gameFeatureFactory.SOUND))), self, "initConfigurable")
            self:mediaInit()
            changedGameFeatureListener:remove(gameFeatureFactory.SOUND)
        end
        local sensorFeatureFactory = SensorFeatureFactory.getInstance()
        if changedGameFeatureListener:isChangedFeature(sensorFeatureFactory.ORIENTATION_SENSORS) or changedGameFeatureListener:isChangedFeature(sensorFeatureFactory.NO_ORIENTATION) or changedGameFeatureListener:isChangedFeature(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS) then
            changedGameFeatureListener:remove(sensorFeatureFactory.NO_ORIENTATION)
            changedGameFeatureListener:remove(sensorFeatureFactory.ORIENTATION_SENSORS)
            changedGameFeatureListener:remove(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS)
        end
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        self:loadResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_GAME)
end


-- throws Exception
function AllBinaryGameCanvas:initApp(abeClientInformation)
        self:initConfigurable(abeClientInformation)
        self:processorInit()
        self.sensorGameUpdateProcessor:process(self.gameLayerManager)
        self.sensorGameUpdateProcessor:sendNotifications(self.gameLayerManager)
        self:initTouch()
end


-- throws Exception
function AllBinaryGameCanvas:initTouch()
        local gameInitializedEvent = GameInitializationUtil.getInstance().EVENT
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        gameInitializedEvent:setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_TOUCH)
        GameInitializedEventHandler.getInstance():fireEvent(gameInitializedEvent)
        self.touchButtonFactory:defaultList()
        self:updateTouch()
        self:postInitTouch()
end


-- throws Exception
function AllBinaryGameCanvas:updateCurrentTouchInputFactory(nextTouchInput)
        if nextTouchInput ~= self.currentTouchInputFactory then
            self.currentTouchInputFactory = nextTouchInput
            PreLogUtil.put(tostring(self.currentTouchInputFactory), self, self.gameInputStrings.UDPATE_CURRENT_TOUCH_INPUT_FACTORY)
            self.touchButtonFactory:toggle(self:isPaused(), self.currentTouchInputFactory:getList())
        end
end


-- throws Exception
function AllBinaryGameCanvas:updateTouch()
        self.gameBehavior:updateTouch(self)
end


-- throws Exception
function AllBinaryGameCanvas:updateTouch2()
        local features = Features.getInstance()
        if features:isFeature(self.touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS) then
            if self.gameLayerManager:getGameInfo():getCurrentLevel() - self:getStartLevel() == 1 then
                self:setTouchPaintableP(NullPaintable.getInstance())
            end
        end
end


-- throws Exception
function AllBinaryGameCanvas:postInitTouch()
        self:setTouchButtonsPaintable(TouchButtonsPaintableFactory.getInstance(self.gameLayerManager:getForegroundBasicColor()))
        self:updateScreenButtonPaintable()
end


function AllBinaryGameCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommands()
        self:setCommandListener(cmdListener)
end


function AllBinaryGameCanvas:addCommands()
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        local myCommandsFactory = MyCommandsFactory.getInstance()
        if DebugFactory.getInstance() ~= NoDebug.getInstance() then
            self:addCommand(gameCommandsFactory.START_TRACE)
        end
        self:addCommand(gameCommandsFactory.RESTART_COMMAND)
        self:addCommand(myCommandsFactory.PAUSE_COMMAND)
        self:addCommand(gameCommandsFactory.QUIT_COMMAND)
        local isOverScan = OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan()
        if J2MEUtil.isHTML() then
        elseif SWTUtil.isSWT then
        elseif not isOverScan then
            if TouchScreenFactory.getInstance():isTouch() and InGameFeatures.new():isAny() then
                self:addCommand(InGameOptionsForm.DISPLAY)
            end
            self:addCommand(gameCommandsFactory.SAVE)
            self:addCommand(gameCommandsFactory.DISPLAY_LOAD_FORM)
        end
end


function AllBinaryGameCanvas:itemStateChanged(item)
        local try_ok, try_error = pcall(function()
            local itemLabel = item:getLabel()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonLabels.ITEM_LABEL):append(itemLabel)), self, "itemStateChanged")
            if java_instanceof(item, ChoiceGroup) then
                local gameFeatureUtil = GameFeatureUtil.getInstance()
                if gameFeatureUtil:isExclusive(itemLabel) then
                    gameFeatureUtil:updateExclusiveForChoiceGroup(item)
                else
                    gameFeatureUtil:updateMultiple(item)
                end
            end
            self.sensorGameUpdateProcessor:process(self.gameLayerManager)
            self:updateTouch()
            self:updateScreenButtonPaintable()
            self.sensorGameUpdateProcessor:sendNotifications(self.gameLayerManager)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "itemStateChanged", e)
        end
end


-- throws Exception
function AllBinaryGameCanvas:updateScreenButtonPaintable()
        self.gameBehavior:updateScreenButtonPaintable(self)
end


function AllBinaryGameCanvas:updateScreenButtonPaintable2()
        local features = Features.getInstance()
        if features:isFeature(self.touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS) then
            self:setTouchPaintableP(self:getTouchButtonsPaintable())
            self:setStartLevel(self.gameLayerManager:getGameInfo():getCurrentLevel())
        elseif features:isFeature(self.touchFeatureFactory.SHOW_SCREEN_BUTTONS) then
            self:setTouchPaintableP(self:getTouchButtonsPaintable())
        elseif features:isFeature(self.touchFeatureFactory.HIDE_SCREEN_BUTTONS) then
            self:setTouchPaintableP(NullPaintable.getInstance())
        else
            self:setTouchPaintableP(NullPaintable.getInstance())
        end
end


function AllBinaryGameCanvas:getLayerManager()
        return self.gameLayerManager
end


function AllBinaryGameCanvas:setLayerManager(layerManager)
        self.gameLayerManager = layerManager
end


function AllBinaryGameCanvas:isGameOver()
        return self.gameOver
end


function AllBinaryGameCanvas:setGameOver(gameOver)
        self.gameOver = gameOver
end


-- throws Exception
function AllBinaryGameCanvas:processGameOver()
        PreLogUtil.put(self.commonStrings.START, self, self.gameStrings.SET_GAME_OVER)
        self:setGameOver(true)
        self:removePauseCommand()
        self:setGameState(self.gameStateFactory.SHOW_END_RESULT_GAME_STATE)
        self:setEndGamePaintable(self:getEndGameStatePaintable())
end


function AllBinaryGameCanvas:isHighScoreSubmitted()
        return self.highScoreSubmitted
end


-- throws Exception
function AllBinaryGameCanvas:setHighScoreSubmitted(highScoreSubmitted)
        self.highScoreSubmitted = highScoreSubmitted
        if highScoreSubmitted then
            self.highScoresHelper:setSelectedHighScores(NullHighScoresSingletonFactory.getInstance())
        end
        self.logUtil:putF(tostring(StringMaker.new():append("isHighScoreSubmitted: "):appendboolean(highScoreSubmitted)), self, "setHighScoreSubmitted")
end


function AllBinaryGameCanvas:getGameState()
        return self.gameState
end


-- throws Exception
function AllBinaryGameCanvas:setGameState(gameState)
        self.logUtil:putF(tostring(StringMaker.new():append(self.gameStrings.GAME_STATE):append(self.stringUtil:toString(gameState))), self, self.gameStrings.SET_GAME_STATE)
        self.gameState = gameState
        self.gameStateTimeHelper:setStartTimeTNT()
        self:updateEndGameProcessor()
        self:updateGameKeyEventProcessor()
        self.gameBehavior:setGameState(self)
end


-- throws Exception
function AllBinaryGameCanvas:updateGameState()
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:processAdState(self.gameState, self.gameLayerManager:getGameInfo():getGameType())
        if self.gameState ~= self.gameStateFactory.PLAYING_GAME_STATE then
            gameAdState:processPageAdState()
        end
end


function AllBinaryGameCanvas:updateGameKeyEventProcessor()
        if self:getGameState() ~= self.gameStateFactory.PLAYING_GAME_STATE or self.isCheating then
        else
        end
end


function AllBinaryGameCanvas:removeAllGameKeyInputListenersOnBuild()
        self:removeAllGameKeyInputListeners()
end


function AllBinaryGameCanvas:removeAllGameKeyInputListeners()
        self.gameBehavior:removeAllGameKeyInputListeners(self)
end


function AllBinaryGameCanvas:removeAllGameKeyInputListeners2()
        self.logUtil:putF("Remove PlayerInput Listeners", self, "removeAllGameKeyInputListeners")
        for index = self.localPlayerGameInputList:size() - 1, 0, -1 do
            local playerGameInput = self.localPlayerGameInputList:get(index)
            self:removeKeyInputListener(playerGameInput)
            playerGameInput:removeNonAIInputGameKeyEvents()
        end
end


function AllBinaryGameCanvas:removeKeyInputListener(playerGameInput)
        self.gameKeyEventHandler:removeListener(playerGameInput)
end


-- throws Exception
function AllBinaryGameCanvas:updateEndGameProcessor()
        self.gameBehavior:updateEndGameProcessor(self)
end


-- throws Exception
function AllBinaryGameCanvas:updateEndGameProcessor2()
        if self:getGameState() == self.gameStateFactory.SHOW_END_RESULT_GAME_STATE or self:getGameState() == self.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE then
            self:setEndGameProcessor(self.realEndGameProcessor)
        else
            self:setEndGameProcessor(Processor.getInstance())
        end
end


-- throws Exception
function AllBinaryGameCanvas:buildGameInit(isPortion)
end


-- throws Exception
function AllBinaryGameCanvas:cleanupGame()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CLEANUP)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:addNormalPortion(10, "Cleaning Up")
        self.primaryPlayerQueue:clear()
        self.secondaryPlayerQueue:clear()
        GameLevelDisplayChangeEventListenersFactory.getInstance():clear()
end


-- throws Exception
function AllBinaryGameCanvas:loadResourceLoadingLevel(resourceLoadingLevel)
        local gameInitializedEvent = GameInitializationUtil.getInstance().EVENT
        gameInitializedEvent:setResourceLoadingLevel(resourceLoadingLevel)
        GameInitializedEventHandler.getInstance():fireEvent(gameInitializedEvent)
end


-- throws Exception
function AllBinaryGameCanvas:loadResources(level)
        local gameInitializedEvent = GameInitializationUtil.getInstance().EVENT
        gameInitializedEvent:setLevel(level)
        GameInitializedEventHandler.getInstance():fireEvent(gameInitializedEvent)
end


-- throws Exception
function AllBinaryGameCanvas:updateColor()
end


-- throws Exception
function AllBinaryGameCanvas:buildGame(portion)
        self.screenCapture:endRecording()
        self.screenCapture:startRecording()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        local features = Features.getInstance()
        progressCanvas:addNormalPortion(portion, "Generic Build")
        self:removeAllGameKeyInputListenersOnBuild()
        self:updateTouch()
        progressCanvas:addNormalPortion(portion, "High Scores")
        self.highScoresFactoryInterface:fetchHighScores(self.gameLayerManager:getGameInfo(), self.highScoresHelper)
        self:setHighScoresPaintable(NullPaintable.getInstance())
        progressCanvas:addNormalPortion(portion, "Finishing.")
        self:getEndGameInfoP():update(self:getLayerManager():getGameInfo(), self)
        self.isSingleKeyRepeatableProcessing = features:isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
        self:setGameOver(false)
        progressCanvas:addNormalPortion(portion, "Finishing..")
        self:updateColor()
        self:getStartIntermissionPaintable():update()
        if not self:isRunningInAnotherThread() then
            return
        end
        progressCanvas:addNormalPortion(portion, "Finishing...")
        if self:isMainCanvas() or not self:isInitialized() then
            if features:isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND) then
                if self:getCustomCommandListener() ~= nil then
                    progressCanvas:end_()
                end
            else
                progressCanvas:end_()
            end
            self:setInitialized(true)
        end
        if self:getCustomCommandListener() == NullCommandListener.NULL_COMMAND_LISTENER then
            self.logUtil:putF("Show Game Paintable in DemoCanvas Thread", self, self.BUILD_GAME)
            self.gameCanvasStartListener:showGamePaintable()
        else
            self.logUtil:putF("No GameCanvasStartListener", self, self.BUILD_GAME)
        end
        self.colorFillPaintable:setBasicColorP(self.gameLayerManager:getBackgroundBasicColor())
        self.gameBehavior:buildGame(self)
end


function AllBinaryGameCanvas:buildGame2()
        PreLogUtil.put(tostring(StringMaker.new():append(self.gameInputStrings.ENABLE_PLAYER_GAME_INPUTS):appendint(self.localPlayerGameInputList:size())), self, self.BUILD_GAME)
        local playerGameInput = nil
        for index = self.localPlayerGameInputList:size() - 1, 0, -1 do
            playerGameInput = self.localPlayerGameInputList:get(index)
            PreLogUtil.put(tostring(StringMaker.new():append(self.gameInputStrings.ENABLE_PLAYER_GAME_INPUT):append(tostring(playerGameInput))), self, self.BUILD_GAME)
            playerGameInput:removeNonAIInputGameKeyEvents()
            self:addKeyInputListener(playerGameInput)
        end
end


function AllBinaryGameCanvas:addKeyInputListener(playerGameInput)
        GameKeyEventHandler.getInstance():addListenerForPlayer(playerGameInput, playerGameInput:getPlayerInputId())
end


function AllBinaryGameCanvas:setGameCanvasStartListener(gameCanvasStartListener)
        self.gameCanvasStartListener = gameCanvasStartListener
end


-- throws Exception
function AllBinaryGameCanvas:loadState()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.LOAD)
        local hashtable = self:getLoadStateHashtable()
        if hashtable ~= nil and hashtable:size() > 0 then
            local levelAsString = hashtable:get(GameInfo.LEVEL_NAME)
            local level = math.tointeger(tostring(levelAsString) // 1)
            local gameInfo = self.gameLayerManager:getGameInfo()
            gameInfo:setCurrentLevel(level)
        end
end


-- throws Exception
function AllBinaryGameCanvas:getLoadStateHashtable()
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonLabels.START_LABEL):append(self.stringUtil:toString(self.hashtable))), self, "getLoadStateHashtable")
        return self.hashtable
end


function AllBinaryGameCanvas:setLoadStateHashtable(hashtable)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonLabels.START_LABEL):append(self.stringUtil:toString(hashtable))), self, "setLoadStateHashtable")
        self.hashtable = hashtable
end


function AllBinaryGameCanvas:getCurrentStateHashtable()
        local hashtable = self.stdUtil:createHashtable()
        local level = self.gameLayerManager:getGameInfo():getCurrentLevel()
        hashtable:put(tostring(GameInfo.LEVEL_NAME), tostring(level))
        self.logUtil:putF(tostring(StringMaker.new():append("End: "):append(self.stringUtil:toString(hashtable))), self, "getCurrentStateHashtable")
        return hashtable
end


function AllBinaryGameCanvas:paintGameOver(graphics)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end


function AllBinaryGameCanvas:draw(graphics)
        self.colorFillPaintable:paint(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self.gameLayerManager:getForegroundBasicColor())
        self.gameSpecificPaintable:paint(graphics)
end


function AllBinaryGameCanvas:clear(graphics)
        self.colorFillPaintable:paint(graphics)
end


function AllBinaryGameCanvas:paint(graphics)
        self.myFontProcessor:process(graphics)
        self.baseGameStatistics:nextRefresh()
        self:draw(graphics)
        self.menuPaintable:paint(graphics)
        self.progressPaintable:paint(graphics)
end


function AllBinaryGameCanvas:paintThreed(graphics)
end


-- throws Exception
function AllBinaryGameCanvas:processEndLevelIntermissionGameState()
end


function AllBinaryGameCanvas:nonBotPaint(graphics)
        self.endGamePaintable:paint(graphics)
        self.intermissionPaintable:paint(graphics)
        self:paintIntermission(graphics)
        self.touchPaintable:paint(graphics)
end


function AllBinaryGameCanvas:paintIntermission(graphics)
end


function AllBinaryGameCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end


function AllBinaryGameCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end


function AllBinaryGameCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end


function AllBinaryGameCanvas:keyPressedByDevice(keyCode, deviceId)
        self.inputProcessor:keyPressedByDevice(keyCode, deviceId)
end


function AllBinaryGameCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self.inputProcessor:keyPressedByDevice(keyCode, deviceId)
        end
end


function AllBinaryGameCanvas:keyReleasedByDevice(keyCode, deviceId)
        self.inputProcessor:keyReleasedByDevice(self, keyCode, deviceId)
end


-- throws Exception
function AllBinaryGameCanvas:handleRawKey(keyCode, deviceId, repeated)
end


function AllBinaryGameCanvas:endProgress(isProgress)
        local portion = 30
        if isProgress and self:isMainCanvas() then
            local myCommandsFactory = MyCommandsFactory.getInstance()
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:start()
            self:getCustomCommandListener():commandAction(myCommandsFactory.SET_DISPLAYABLE, progressCanvas)
            portion = 4
        end
        return portion
end


-- throws Exception
function AllBinaryGameCanvas:processPlayingGame()
        self.cheatProcessor:update()
        self.sensorGameUpdateProcessor:getInputSensor():update()
        self.gameInputProcessor:process()
        self.gameLayerManager:process()
        self.startIntermissionProcessor:process()
end


-- throws Exception
function AllBinaryGameCanvas:threadInit()
end


-- throws Exception
function AllBinaryGameCanvas:processGame()
        RunnableCanvas.process(self)
        if AllBinaryMediaManager.update() then
            if not self.primaryPlayerQueue:process() then
                self.secondaryPlayerQueue:process()
            end
        end
        self.mainStateProcessor:process()
        self.menuInputProcessor:processInputList()
        self.endGameProcessor:process()
        self.baseGameStatistics:nextFrame()
end


function AllBinaryGameCanvas:notifyDonePainting()
        do -- synchronized (self)
            self.threadObjectUtil:notifyObject(self)
        end
end


-- throws Exception
function AllBinaryGameCanvas:shouldWait()
        local features = Features.getInstance()
        if AndroidUtil.isAndroid() then
        elseif features:isFeature(self.openGLFeatureFactory.OPENGL_2D) then
        else
            if features:isDefault(self.openGLFeatureFactory.OPENGL) then
                local openGLImageSpecificFactory = OpenGLImageSpecificFactory.getInstance()
                while openGLImageSpecificFactory.updating do
                    java_sleep(self.YIELD_SLEEP)
                end
            end
        end
end


function AllBinaryGameCanvas:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:addNormalPortion(50, "Game Thread")
            self:setCurrentThread()
            self:setRunning(true)
            if self:getCustomCommandListener() == NullCommandListener.NULL_COMMAND_LISTENER then
                java_sleep(self.YIELD_SLEEP)
            end
            self:shouldWait()
            self:threadInit()
            if self:getCustomCommandListener() == NullCommandListener.NULL_COMMAND_LISTENER then
                java_sleep(self.YIELD_SLEEP)
            end
            self:open()
            local gameAdState = self.gameAdStateFactory:getCurrentInstance()
            gameAdState:init()
            gameAdState:setGameIsReady(true)
            self.gameBehavior:run(self)
            self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end


-- throws Exception
function AllBinaryGameCanvas:run2()
        local features = Features.getInstance()
        if features:isDefault(self.openGLFeatureFactory.OPENGL_AS_GAME_THREAD) or J2MEUtil.isHTML() then
            if features:isDefault(self.openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
                self.logUtil:putF(self.openGLFeatureFactory.OPENGL_AS_GAME_THREAD:getName(), self, self.commonStrings.RUN)
            end
            if J2MEUtil.isHTML() then
                self.logUtil:putF(GraphicsStrings.getInstance().HTML, self, self.commonStrings.RUN)
            end
            local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
            currentDisplayableFactory:setRunnable(self.gameRunnable)
            currentDisplayableFactory:setDisplayable(self)
            OpenGLThreadUtil.getInstance():onResume()
        elseif features:isDefault(self.openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS) then
            self.logUtil:putF(self.openGLFeatureFactory.OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS:getName(), self, self.commonStrings.RUN)
            OpenGLThreadUtil.getInstance():onResume()
            while self:isRunning() do
                self:run3()
            end
            self:end_()
        else
            self.logUtil:putF("this thread", self, self.commonStrings.RUN)
            while self:isRunning() do
                self:run3()
            end
            self:end_()
        end
end


-- throws Exception
function AllBinaryGameCanvas:run3()
        self.loopTimeHelper:setStartTime(self.gameTickTimeDelayHelper:setStartTime())
        self.gameTickDisplayInfoSingleton:update()
        self:processGame()
        self:processLoopSleep()
end


function AllBinaryGameCanvas:setRunning(running)
        RunnableCanvas.setRunning(self, running)
        local try_ok, try_error = pcall(function()
            local features = Features.getInstance()
            if running then
            else
                if features:isDefault(self.openGLFeatureFactory.OPENGL) or SWTUtil.isSWT then
                    if self.gameLayerManager:getGameInfo():getGameType() ~= self.gameTypeFactory.BOT then
                        local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                        currentDisplayableFactory:clearRunnable()
                    end
                    self:end_()
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.SET_RUNNING, e)
        end
end


-- throws Exception
function AllBinaryGameCanvas:end_()
        self.screenCapture:endRecording()
        self.baseGameStatistics:add(tostring(StringMaker.new():append(tostring(self.baseGameStatistics)):append(CommonSeps.getInstance().NEW_LINE)))
        self.baseGameStatistics:init()
        self.gameKeyEventHandler:removeListener(self.cheatProcessor)
        self:close()
        self:removeAllGameKeyInputListeners()
        self:endGameThread()
end


-- throws Exception
function AllBinaryGameCanvas:endGameThread()
        DisplayChangeEventHandler.getInstance():removeListener(self)
        GameLevelDisplayChangeEventListenersFactory.getInstance():clear()
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:notPlayingAdState()
end


function AllBinaryGameCanvas:createHighScore(score)
        local gameInfo = self.gameLayerManager:getGameInfo()
        return HighScore.new(0, "NONE", GameInfo.new(gameInfo:getGameType(), gameInfo:getGameMode(), PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0), score)
end


-- throws Exception
function AllBinaryGameCanvas:setHighScore(abeClientInformation, name, score, autoSubmit, isLast)
        self.gameBehavior:setHighScore(abeClientInformation, self, name, score, autoSubmit, isLast)
end


-- throws Exception
function AllBinaryGameCanvas:setHighScore2(abeClientInformation, name, score, autoSubmit, isLast)
        local highScore = self:createHighScore(score)
        local textBox = HighScoreTextBox.new(self.highScoresFactoryInterface, self.highScoresHelper, abeClientInformation, self.gameLayerManager:getGameInfo(), self:getCustomCommandListener(), name, highScore, self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor())
        if isLast then
            self:getCustomCommandListener():commandAction(GameCommandsFactory.getInstance().SET_MENU_DISPLAYABLE, textBox)
        end
        if autoSubmit then
            local SaveHighScoreRunnable = {}
            SaveHighScoreRunnable.__index = SaveHighScoreRunnable
            SaveHighScoreRunnable.className = "SaveHighScoreRunnable"

            function SaveHighScoreRunnable:_init_fields()
                self.progressCanvas = ProgressCanvasFactory.getInstance()
            end

            function SaveHighScoreRunnable.new()
                local self = setmetatable({}, SaveHighScoreRunnable)
                self:_init_fields()
                return self
            end
            

            function AllBinaryGameCanvas:run()
                    local logUtil = LogUtil.getInstance()
                    local try_ok, try_error = pcall(function()
                        if self.isLast then
                            self.textBox:submit()
                        else
                            self.textBox:saveHighScore()
                        end
                    end)
                    if not try_ok then
                        local e = try_error
                        local commonStrings = CommonStrings.getInstance()
                        logUtil:put(commonStrings.EXCEPTION, self, "run", e)
                        self.progressCanvas:end_()
                    end
            end

            SecondaryThreadPool.getInstance():runTask(SaveHighScoreRunnable.new())
        end
end


function AllBinaryGameCanvas:getGameStateTimeHelper()
        return self.gameStateTimeHelper
end


function AllBinaryGameCanvas:setInitialized(initialized)
        self.initialized = initialized
end


function AllBinaryGameCanvas:isInitialized()
        return self.initialized
end


function AllBinaryGameCanvas:getSourceId()
        return AllBinaryGameCanvas.id
end


function AllBinaryGameCanvas:setProgressPaintable(paintable)
        self.progressPaintable = paintable
end


function AllBinaryGameCanvas:getStartIntermissionInterface()
        return self.startIntermissionInterface
end


function AllBinaryGameCanvas:getEndLevelIntermissionInterface()
        return self.endLevelIntermissionInterface
end


function AllBinaryGameCanvas:setTouchPaintableP(paintable)
        self.touchPaintable = paintable
end


function AllBinaryGameCanvas:getTouchPaintableP()
        return self.touchPaintable
end


function AllBinaryGameCanvas:setEndGamePaintable(endGamePaintable)
        self.endGamePaintable = endGamePaintable
end


function AllBinaryGameCanvas:getEndGamePaintable()
        return self.endGamePaintable
end


function AllBinaryGameCanvas:setIntermissionPaintable(intermissionPaintable)
        self.intermissionPaintable = intermissionPaintable
end


function AllBinaryGameCanvas:getIntermissionPaintable()
        return self.intermissionPaintable
end


function AllBinaryGameCanvas:getEndGameInfoP()
        return self.endGameInfo
end


function AllBinaryGameCanvas:setHighScoresPaintable(highScoresPaintable)
        self.highScoresPaintable = highScoresPaintable
end


function AllBinaryGameCanvas:getHighScoresPaintable()
        return self.highScoresPaintable
end


function AllBinaryGameCanvas:getRealHighScoresPaintable()
        return self.realHighScoresPaintable
end


function AllBinaryGameCanvas:clearPlayerGameInputList()
        local playerGameInput = nil
        for index = self.localPlayerGameInputList:size() - 1, 0, -1 do
            playerGameInput = self.localPlayerGameInputList:get(index)
            self.gameKeyEventHandler:removeListener(playerGameInput)
        end
        self.localPlayerGameInputList:clear()
end


function AllBinaryGameCanvas:addPlayerGameInput(playerGameInput)
        self.localPlayerGameInputList:add(playerGameInput)
end


function AllBinaryGameCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end


function AllBinaryGameCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end


function AllBinaryGameCanvas:getMenuForm()
        return self.menuForm
end


function AllBinaryGameCanvas:setMenuForm(menuForm)
        self.menuForm = menuForm
end


function AllBinaryGameCanvas:getStartLevel()
        return self.startLevel
end


function AllBinaryGameCanvas:setStartLevel(startLevel)
        self.startLevel = startLevel
end


function AllBinaryGameCanvas:setTouchButtonsPaintable(touchButtonsPaintable)
        self.touchButtonsPaintable = touchButtonsPaintable
end


function AllBinaryGameCanvas:getTouchButtonsPaintable()
        return self.touchButtonsPaintable
end


function AllBinaryGameCanvas:setGameInputProcessor(gameInputProcessor)
        self.gameInputProcessor = gameInputProcessor
end


function AllBinaryGameCanvas:getGameInputProcessor()
        return self.gameInputProcessor
end


function AllBinaryGameCanvas:setEndGameProcessor(endGameProcessor)
        self.endGameProcessor = endGameProcessor
end


function AllBinaryGameCanvas:getEndGameProcessor()
        return self.endGameProcessor
end


function AllBinaryGameCanvas:setEndGameStatePaintable(endGameStatePaintable)
        self.endGameStatePaintable = endGameStatePaintable
end


function AllBinaryGameCanvas:getEndGameStatePaintable()
        return self.endGameStatePaintable
end


function AllBinaryGameCanvas:setNonBotPaintableP(nonBotPaintable)
        self.nonBotPaintable = nonBotPaintable
end


function AllBinaryGameCanvas:getNonBotPaintableP()
        return self.nonBotPaintable
end


function AllBinaryGameCanvas:setStartIntermissionPaintable(startIntermissionPaintable)
        self.startIntermissionPaintable = startIntermissionPaintable
end


function AllBinaryGameCanvas:getStartIntermissionPaintable()
        return self.startIntermissionPaintable
end


function AllBinaryGameCanvas:setMainStateProcessor(mainStateProcessor)
        self.mainStateProcessor = mainStateProcessor
end


function AllBinaryGameCanvas:getMainStateProcessor()
        return self.mainStateProcessor
end


function AllBinaryGameCanvas:setProcessGameProcessor(processGameProcessor)
        self.processGameProcessor = processGameProcessor
end


function AllBinaryGameCanvas:getProcessGameProcessor()
        return self.processGameProcessor
end


function AllBinaryGameCanvas:setOpenMenuPaintable(openMenuPaintable)
        self.openMenuPaintable = openMenuPaintable
end


function AllBinaryGameCanvas:getOpenMenuPaintable()
        return self.openMenuPaintable
end


function AllBinaryGameCanvas:setPopupMenuInputProcessor(popupMenuInputProcessor)
        self.popupMenuInputProcessor = popupMenuInputProcessor
end


function AllBinaryGameCanvas:getPopupMenuInputProcessor()
        return self.popupMenuInputProcessor
end


function AllBinaryGameCanvas:getSensorGameUpdateProcessor()
        return self.sensorGameUpdateProcessor
end


function AllBinaryGameCanvas:getRawGameInputProcessor()
        return self.rawGameInputProcessor
end


function AllBinaryGameCanvas:getRawInputProcessor()
        return self.rawInputProcessor
end


function AllBinaryGameCanvas:setInputProcessor(inputProcessor)
        self.inputProcessor = inputProcessor
end


function AllBinaryGameCanvas:getInputProcessor()
        return self.inputProcessor
end


function AllBinaryGameCanvas:setMenuPaintable(menuPaintable)
        self.menuPaintable = menuPaintable
end


function AllBinaryGameCanvas:getMenuPaintable()
        return self.menuPaintable
end


function AllBinaryGameCanvas:setFormPaintable(formPaintable)
        self.formPaintable = formPaintable
end


function AllBinaryGameCanvas:getFormPaintable()
        return self.formPaintable
end


function AllBinaryGameCanvas:setGameSpecificPaintableP(gameSpecificPaintable)
        self.gameSpecificPaintable = gameSpecificPaintable
end


function AllBinaryGameCanvas:getGameSpecificPaintableP()
        return self.gameSpecificPaintable
end


function AllBinaryGameCanvas:isSingleThread()
        return OpenGLFeatureUtil.getInstance():isAnyThreed() or SWTUtil.isSWT
end


function AllBinaryGameCanvas:isRunningInAnotherThread()
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
            return true
        else
            return self:isRunning()
        end
end


function AllBinaryGameCanvas:getType()
        return AllBinaryGameCanvas.TYPE
end

AllBinaryGameCanvas.id = 0
AllBinaryGameCanvas.TYPE = 2

return AllBinaryGameCanvas

