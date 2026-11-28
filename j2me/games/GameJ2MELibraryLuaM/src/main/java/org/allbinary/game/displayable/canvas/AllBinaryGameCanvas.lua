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

local AllBinaryGameCanvas = {}
package.loaded["org.allbinary.game.displayable.canvas.AllBinaryGameCanvas"] = AllBinaryGameCanvas

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

local ChoiceGroup = java_lazy("javax.microedition.lcdui.ChoiceGroup")
local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Item = java_lazy("javax.microedition.lcdui.Item")
local NullCommandListener = java_lazy("javax.microedition.lcdui.NullCommandListener")
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local GameAdStateFactory = java_lazy("org.allbinary.business.advertisement.GameAdStateFactory")
local BaseGameStatistics = java_lazy("org.allbinary.canvas.BaseGameStatistics")
local GameStatisticsFactory = java_lazy("org.allbinary.canvas.GameStatisticsFactory")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local DebugFactory = java_lazy("org.allbinary.debug.DebugFactory")
local NoDebug = java_lazy("org.allbinary.debug.NoDebug")
local GameAdState = java_lazy("org.allbinary.game.GameAdState")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local GameStrings = java_lazy("org.allbinary.game.GameStrings")
local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local Intermission = java_lazy("org.allbinary.game.Intermission")
local IntermissionCompositeInterface = java_lazy("org.allbinary.game.IntermissionCompositeInterface")
local IntermissionEnableListenerInterface = java_lazy("org.allbinary.game.IntermissionEnableListenerInterface")
local IntermissionInterface = java_lazy("org.allbinary.game.IntermissionInterface")
local PlayerTypesFactory = java_lazy("org.allbinary.game.PlayerTypesFactory")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local InGameFeatures = java_lazy("org.allbinary.game.configuration.InGameFeatures")
local InGameOptionsForm = java_lazy("org.allbinary.game.configuration.InGameOptionsForm")
local ChangedGameFeatureListener = java_lazy("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local GameInitializedEvent = java_lazy("org.allbinary.game.configuration.event.GameInitializedEvent")
local GameInitializedEventHandler = java_lazy("org.allbinary.game.configuration.event.GameInitializedEventHandler")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local GameFeatureUtil = java_lazy("org.allbinary.game.configuration.feature.GameFeatureUtil")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local SensorFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local TouchFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.TouchFeatureFactory")
local GameLevelDisplayChangeEventListenersFactory = java_lazy("org.allbinary.game.displayable.GameLevelDisplayChangeEventListenersFactory")
local BasicBuildGameInitializerFactory = java_lazy("org.allbinary.game.init.BasicBuildGameInitializerFactory")
local GameInitializationUtil = java_lazy("org.allbinary.game.init.GameInitializationUtil")
local GameInputStrings = java_lazy("org.allbinary.game.input.GameInputStrings")
local InputProcessor = java_lazy("org.allbinary.game.input.InputProcessor")
local NoPlayerGameInput = java_lazy("org.allbinary.game.input.NoPlayerGameInput")
local PlayerGameInput = java_lazy("org.allbinary.game.input.PlayerGameInput")
local GameKeyEventHandler = java_lazy("org.allbinary.game.input.event.GameKeyEventHandler")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local SWTUtil = java_lazy("org.allbinary.game.layer.SWTUtil")
local ColorFillBasePaintable = java_lazy("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = java_lazy("org.allbinary.game.paint.ColorFillPaintableFactory")
local ResourceLoadingLevel = java_lazy("org.allbinary.game.resource.ResourceLoadingLevel")
local ResourceLoadingLevelFactory = java_lazy("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")
local HighScoresHelperBaseInterface = java_lazy("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresPaintable = java_lazy("org.allbinary.game.score.HighScoresPaintable")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")
local HighScoreTextBox = java_lazy("org.allbinary.game.score.displayable.HighScoreTextBox")
local GameState = java_lazy("org.allbinary.game.state.GameState")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local GraphicsStrings = java_lazy("org.allbinary.graphics.GraphicsStrings")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local ScreenCapture = java_lazy("org.allbinary.graphics.ScreenCapture")
local ScreenCaptureFactory = java_lazy("org.allbinary.graphics.ScreenCaptureFactory")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = java_lazy("org.allbinary.graphics.color.BasicColorSetUtil")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GameTickDisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local CommandCurrentSelectionFormFactory = java_lazy("org.allbinary.graphics.form.CommandCurrentSelectionFormFactory")
local FormPaintable = java_lazy("org.allbinary.graphics.form.FormPaintable")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")
local FormTypeFactory = java_lazy("org.allbinary.graphics.form.FormTypeFactory")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local ScrollSelectionFormNoneFactory = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormNoneFactory")
local CommandTextItemArrayFactory = java_lazy("org.allbinary.graphics.form.item.CommandTextItemArrayFactory")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local CurrentDisplayableFactory = java_lazy("org.allbinary.graphics.opengles.CurrentDisplayableFactory")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLFeatureUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local OpenGLThreadUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLThreadUtil")
local InitUpdatePaintable = java_lazy("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullInitUpdatePaintable = java_lazy("org.allbinary.graphics.paint.NullInitUpdatePaintable")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local OpenGLImageSpecificFactory = java_lazy("org.allbinary.image.opengles.OpenGLImageSpecificFactory")
local SensorGameUpdateProcessor = java_lazy("org.allbinary.input.gyro.SensorGameUpdateProcessor")
local SingleSensorGameUpdateProcessor = java_lazy("org.allbinary.input.gyro.SingleSensorGameUpdateProcessor")
local BaseTouchInput = java_lazy("org.allbinary.input.motion.button.BaseTouchInput")
local NoButtonsTouchInputFactory = java_lazy("org.allbinary.input.motion.button.NoButtonsTouchInputFactory")
local TouchButtonFactory = java_lazy("org.allbinary.input.motion.button.TouchButtonFactory")
local TouchButtonsPaintableFactory = java_lazy("org.allbinary.input.motion.button.TouchButtonsPaintableFactory")
local TouchScreenFactory = java_lazy("org.allbinary.input.motion.button.TouchScreenFactory")
local BasicMotionGesturesHandler = java_lazy("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ABSystemWrapper = java_lazy("org.allbinary.logic.ABSystemWrapper")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local OperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = java_lazy("org.allbinary.media.audio.AllBinaryMediaManager")
local PlayerQueue = java_lazy("org.allbinary.media.audio.PlayerQueue")
local PrimaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local SelectSound = java_lazy("org.allbinary.media.audio.SelectSound")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local SecondaryThreadPool = java_lazy("org.allbinary.thread.SecondaryThreadPool")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local AllBinaryGameCanvasInterface = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local PopupMenuInterface = require("org.allbinary.game.displayable.canvas.PopupMenuInterface")
local BaseGameBehavior = java_lazy("org.allbinary.game.displayable.canvas.BaseGameBehavior")
local BaseMenuBehavior = java_lazy("org.allbinary.game.displayable.canvas.BaseMenuBehavior")
local BasicMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")
local BasicPopupMenuPaintable = java_lazy("org.allbinary.game.displayable.canvas.BasicPopupMenuPaintable")
local CheatGameInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.CheatGameInputProcessor")
local DemoGameBehavior = java_lazy("org.allbinary.game.displayable.canvas.DemoGameBehavior")
local DemoPaintableInterface = java_lazy("org.allbinary.game.displayable.canvas.DemoPaintableInterface")
local EndGameInfo = java_lazy("org.allbinary.game.displayable.canvas.EndGameInfo")
local EndGamePaintable = java_lazy("org.allbinary.game.displayable.canvas.EndGamePaintable")
local EndGameProcessor = java_lazy("org.allbinary.game.displayable.canvas.EndGameProcessor")
local FormInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.FormInputProcessor")
local FormUtil = java_lazy("org.allbinary.game.displayable.canvas.FormUtil")
local GameCanvasInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.GameCanvasInputProcessor")
local GameCanvasPauseRunnable = java_lazy("org.allbinary.game.displayable.canvas.GameCanvasPauseRunnable")
local GameCanvasRunnable = java_lazy("org.allbinary.game.displayable.canvas.GameCanvasRunnable")
local GameLimitedCommandTextItemArrayFactory = java_lazy("org.allbinary.game.displayable.canvas.GameLimitedCommandTextItemArrayFactory")
local GameProcessor = java_lazy("org.allbinary.game.displayable.canvas.GameProcessor")
local InGameMenuBehavior = java_lazy("org.allbinary.game.displayable.canvas.InGameMenuBehavior")
local MyFormUtil = java_lazy("org.allbinary.game.displayable.canvas.MyFormUtil")
local NoMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.NoMenuInputProcessor")
local NullDemoPaintable = java_lazy("org.allbinary.game.displayable.canvas.NullDemoPaintable")
local NullWaitGameRunnable = java_lazy("org.allbinary.game.displayable.canvas.NullWaitGameRunnable")
local PopupCommandFormInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.PopupCommandFormInputProcessor")
local PopupMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.PopupMenuInputProcessor")
local SaveHighScoreRunnable = java_lazy("org.allbinary.game.displayable.canvas.SaveHighScoreRunnable")
local StartIntermissionProcessor = java_lazy("org.allbinary.game.displayable.canvas.StartIntermissionProcessor")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table AllBinaryGameCanvas is declared before the requires
AllBinaryGameCanvas.__index = AllBinaryGameCanvas
AllBinaryGameCanvas.className = "AllBinaryGameCanvas"
AllBinaryGameCanvas.javaClassName = "org.allbinary.game.displayable.canvas.AllBinaryGameCanvas"
setmetatable(AllBinaryGameCanvas, {__index = RunnableCanvas})
AllBinaryGameCanvas.java_implements = " AllBinaryGameCanvasInterface GameCanvasRunnableInterface MenuListener IntermissionCompositeInterface IntermissionEnableListenerInterface PopupMenuInterface DisplayChangeEventListener UpdateMyFontInterface "
AllBinaryGameCanvas.java_interfaces = function() return {AllBinaryGameCanvasInterface, GameCanvasRunnableInterface, MenuListener, IntermissionCompositeInterface, IntermissionEnableListenerInterface, PopupMenuInterface, DisplayChangeEventListener, UpdateMyFontInterface} end

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
    if self.gameOver == nil then self.gameOver = false end
    if self.initialized == nil then self.initialized = false end
    self.gameStateTimeHelper = TimeDelayHelper.new(0)
    if self.highScoresHelper == nil then self.highScoresHelper = nil end
    if self.highScoreSubmitted == nil then self.highScoreSubmitted = false end
    self.realHighScoresPaintable = HighScoresPaintable.new()
    self.highScoresPaintable = NullPaintable.getInstance()
    self.localPlayerGameInputList = BasicArrayListD.new()
    if self.isCheating == nil then self.isCheating = false end
    self.hashtable = self.stdUtil.NULL_TABLE
    if self.isSingleKeyRepeatableProcessing == nil then self.isSingleKeyRepeatableProcessing = false end
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
    if self.highScoresFactoryInterface == nil then self.highScoresFactoryInterface = nil end
    if self.startLevel == nil then self.startLevel = 0 end
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
    if self.gameBehavior == nil then self.gameBehavior = nil end
    if self.menuBehavior == nil then self.menuBehavior = nil end
    self.progressPaintable = ProgressCanvasFactory.getLazyInstance()
    if self.fontHeightP == nil then self.fontHeightP = 0 end
    self.gameCanvasStartListener = NullDemoPaintable.NULL_DEMO_PAINTABLE
    self.rawGameInputProcessor = GameCanvasInputProcessor.new(self)
    self.rawInputProcessor = FormInputProcessor.new(self)
    self.inputProcessor = self:getRawGameInputProcessor()
    self.YIELD_SLEEP = 100
end


function AllBinaryGameCanvas._jinit(self, commandListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered)
    java_super_init(RunnableCanvas, self, commandListener, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST, true)
    AllBinaryGameCanvas._init_fields(self)
        -- super(...) made self above
        self.highScoresHelper = highScoresFactoryInterface:createHighScoresHelper()
        self.gameInitializationInterfaceFactoryInterface = gameInitializationInterfaceFactoryInterface
        self:init(gameLayerManager, buffered)
        self.highScoresFactoryInterface = highScoresFactoryInterface
        if rawequal(self.gameLayerManager:getGameInfo():getGameType(), self.gameTypeFactory.BOT) or rawequal(self.gameLayerManager:getGameInfo():getGameType(), self.gameTypeFactory.NONE) then
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

function AllBinaryGameCanvas.new(...)
    local self = setmetatable({}, AllBinaryGameCanvas)
    AllBinaryGameCanvas._jinit(self, ...)
    return self
end


function AllBinaryGameCanvas:updateMeasurement(graphics)
        local try_ok, try_error, try_value = pcall(function()
            local font = graphics:getFont()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(self.canvasStrings.FD_WIDTH):appendint(java_int(MyFontProcessor.defaultCharWidth(font))):append(self.canvasStrings.FD_HEIGHT):appendint(java_int(font:getHeight()))), self, self.canvasStrings.UPDATE_MEASUREMENT)
            self.fontHeightP = font:getHeight()
            self.myFormUtil:updateMeasurement(graphics)
            local popupMenuRectangle = self.myFormUtil:getPopupMenuRectangle()
            local basicPopupMenuPaintable = (self:getOpenMenuPaintable())
            basicPopupMenuPaintable:init(popupMenuRectangle)
            if not rawequal(self:getPopupMenuInputProcessor(), NoMenuInputProcessor.getInstance()) then
                local popupMenuInputProcessor = (self:getPopupMenuInputProcessor())
                popupMenuInputProcessor:init(popupMenuRectangle)
            end
            self.myFontProcessor = MyFontProcessor.getInstance()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
end
java_overload(AllBinaryGameCanvas, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:getInGameMenuBehavior()
        return InGameMenuBehavior.getInstance()
end
java_overload(AllBinaryGameCanvas, "getInGameMenuBehavior", 0)


function AllBinaryGameCanvas:setCurrentThread()
        if J2MEUtil.isHTML() then
            java_super(RunnableCanvas, "setCurrentThreadFake", 0)(self)
        else
            java_super(RunnableCanvas, "setCurrentThread", 0)(self)
        end
end
java_overload(AllBinaryGameCanvas, "setCurrentThread", 0)


function AllBinaryGameCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(AllBinaryGameCanvas, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function AllBinaryGameCanvas:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(tostring(DisplayInfoSingleton.getInstance()))), self, self.canvasStrings.UPDATE_MEASUREMENT)
            self.myFontProcessor = self.updateMyFontProcessor
            self.menuBehavior:onDisplayChangeEvent(self, displayChangeEvent)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
end
java_overload(AllBinaryGameCanvas, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


-- throws Exception
function AllBinaryGameCanvas:updateMenuFromEvent(displayChangeEvent)
        local formType = FormTypeFactory.getInstance():getFormType()
        local rectangle = self.formUtil:createFormRectangle()
        self.menuForm:init(rectangle, formType)
        if not rawequal(self.currentTouchInputFactory, NoButtonsTouchInputFactory.getInstance()) then
            self.touchButtonFactory:toggle(self:isPaused(), self.currentTouchInputFactory:getList())
        end
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(AllBinaryGameCanvas, "updateMenuFromEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


-- throws Exception
function AllBinaryGameCanvas:processSleep()
        java_super(RunnableCanvas, "processSleep", 0)(self)
        if AllBinaryMediaManager.update() then
            if not (self.primaryPlayerQueue:process()) then
                self.secondaryPlayerQueue:process()
            end
        end
        if not rawequal(self.menuInputProcessor:processInputList(), -1) then
            self.runnableCanvasRefreshHelper:process()
        end
end
java_overload(AllBinaryGameCanvas, "processSleep", 0)


-- throws Exception
function AllBinaryGameCanvas:initPopupMenu()
        if rawequal(self.popupMenuInputProcessor, NoMenuInputProcessor.getInstance()) then
            local features = Features.getInstance()
            local popupMenuRectangle = self.myFormUtil:getPopupMenuRectangle()
            if features:isFeature(self.touchFeatureFactory.TOUCH_ENABLED) then
                self:setOpenMenuPaintable(BasicPopupMenuPaintable.new(popupMenuRectangle, self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor()))
                self:setPopupMenuInputProcessor(PopupMenuInputProcessor.new(BasicArrayListD.new(), -1, self, popupMenuRectangle))
            end
        else
        end
end
java_overload(AllBinaryGameCanvas, "initPopupMenu", 0)


function AllBinaryGameCanvas:initMenu()
        local try_ok, try_error, try_value = pcall(function()
            self.menuBehavior:initMenu(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "initMenu", e)
        end
end
java_overload(AllBinaryGameCanvas, "initMenu", 0)


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
        if not rawequal(scrollSelectionForm, ScrollSelectionFormNoneFactory.getInstance()) then
            self:setFormPaintable(FormPaintable.new(scrollSelectionForm))
        else
        end
        self:closeMenu()
end
java_overload(AllBinaryGameCanvas, "initMenu2", 0)


function AllBinaryGameCanvas:updateMenu()
        local try_ok, try_error, try_value = pcall(function()
            self.menuBehavior:updateMenu(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "initMenu", e)
        end
end
java_overload(AllBinaryGameCanvas, "updateMenu", 0)


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
java_overload(AllBinaryGameCanvas, "updateMenu2", 0)


function AllBinaryGameCanvas:pause()
        self.gameBehavior:pause(self)
        self:closeMenu()
        java_super(RunnableCanvas, "pause", 0)(self)
        self.touchButtonFactory:toggle(self:isPaused(), BasicArrayListUtil.getInstance():getImmutableInstance())
        self.tsUtil:gc()
end
java_overload(AllBinaryGameCanvas, "pause", 0)


function AllBinaryGameCanvas:unPause()
        self.logUtil:putF(self.commonStrings.START, self, self.gameStrings.UNPAUSE)
        self:closeMenu()
        self.tsUtil:gc()
        java_super(RunnableCanvas, "unPause", 0)(self)
        self.touchButtonFactory:toggle(self:isPaused(), BasicArrayListUtil.getInstance():getImmutableInstance())
        self.gameBehavior:unPause(self)
end
java_overload(AllBinaryGameCanvas, "unPause", 0)


function AllBinaryGameCanvas:isPausable()
        if rawequal(CurrentDisplayableFactory.getInstance():getUsedRunnable(), NullWaitGameRunnable.getInstance()) then
            return true
        else
            return false
        end
end
java_overload(AllBinaryGameCanvas, "isPausable", 0)


-- throws Exception
function AllBinaryGameCanvas:popupMenu()
        self.menuBehavior:popupMenu(self)
end
java_overload(AllBinaryGameCanvas, "popupMenu", 0)


-- throws Exception
function AllBinaryGameCanvas:popupMenu2()
        self.primaryPlayerQueue:add(SelectSound.getInstance())
        self:setMenuPaintable(self:getFormPaintable())
        self:setMenuInputProcessor(self.mainMenuInputProcessor)
        self.basicMotionGesturesHandler:addListenerInterface(self.mainMenuInputProcessor)
        self.gameKeyEventHandler:addListener(self.mainMenuInputProcessor)
end
java_overload(AllBinaryGameCanvas, "popupMenu2", 0)


-- throws Exception
function AllBinaryGameCanvas:toggleMenu()
        self.logUtil:putF(self.commonStrings.START, self, self.gameStrings.TOGGLE_MENU)
        if rawequal(self:getMenuPaintable(), self:getOpenMenuPaintable()) then
            self:pause()
            self:updateMenu()
            self:popupMenu()
        elseif rawequal(self:getMenuPaintable(), self:getFormPaintable()) then
            self.primaryPlayerQueue:add(SelectSound.getInstance())
            self:unPause()
        end
end
java_overload(AllBinaryGameCanvas, "toggleMenu", 0)


function AllBinaryGameCanvas:closeMenu()
        self.menuBehavior:closeMenu(self)
end
java_overload(AllBinaryGameCanvas, "closeMenu", 0)


function AllBinaryGameCanvas:closeMenu2()
        self:setMenuPaintable(self:getOpenMenuPaintable())
        self.basicMotionGesturesHandler:removeListener(self.mainMenuInputProcessor)
        self.gameKeyEventHandler:removeListener(self.mainMenuInputProcessor)
        self:setMenuInputProcessor(self:getPopupMenuInputProcessor())
end
java_overload(AllBinaryGameCanvas, "closeMenu2", 0)


function AllBinaryGameCanvas:open()
        self.basicMotionGesturesHandler:addListenerInterface(self.menuInputProcessor)
        self.gameKeyEventHandler:addListener(self.menuInputProcessor)
end
java_overload(AllBinaryGameCanvas, "open", 0)


function AllBinaryGameCanvas:close()
        self.basicMotionGesturesHandler:removeListener(self.menuInputProcessor)
        self.gameKeyEventHandler:removeListener(self.menuInputProcessor)
        self.primaryPlayerQueue:clear()
        self.secondaryPlayerQueue:clear()
end
java_overload(AllBinaryGameCanvas, "close", 0)


-- throws Exception
function AllBinaryGameCanvas:processorInit()
        self:setMainStateProcessor(Processor.getInstance())
        self:setProcessGameProcessorInit()
end
java_overload(AllBinaryGameCanvas, "processorInit", 0)


function AllBinaryGameCanvas:setProcessGameProcessorInit()
        self:setProcessGameProcessor(GameProcessor.new(self))
end
java_overload(AllBinaryGameCanvas, "setProcessGameProcessorInit", 0)


function AllBinaryGameCanvas:initSpecialPaint()
        self.menuBehavior:initSpecialPaint(self)
end
java_overload(AllBinaryGameCanvas, "initSpecialPaint", 0)


-- throws Exception
function AllBinaryGameCanvas:init(gameLayerManager, buffered)
        self.gameStateTimeHelper:setStartTimeTNT()
        self:setHighScoreSubmitted(false)
        self:setLayerManager(gameLayerManager)
        if not (buffered) then
            local BUFF_MESSAGE = "XXX Not Buffering Causes Concurrency Issues XXX"
            self.logUtil:putF(BUFF_MESSAGE, self, self.commonStrings.CONSTRUCTOR)
        else
            error(require("java.lang.Exception").new("Buffering is disabled"), 0)
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
java_overload(AllBinaryGameCanvas, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) and type(java_a2) == "boolean" end)


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
java_overload(AllBinaryGameCanvas, "notifyIntermission", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function AllBinaryGameCanvas:mediaInit()
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end
java_overload(AllBinaryGameCanvas, "mediaInit", 0)


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
java_overload(AllBinaryGameCanvas, "initConfigurable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)


-- throws Exception
function AllBinaryGameCanvas:initApp(abeClientInformation)
        self:initConfigurable(abeClientInformation)
        self:processorInit()
        self.sensorGameUpdateProcessor:process(self.gameLayerManager)
        self.sensorGameUpdateProcessor:sendNotifications(self.gameLayerManager)
        self:initTouch()
end
java_overload(AllBinaryGameCanvas, "initApp", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) end)


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
java_overload(AllBinaryGameCanvas, "initTouch", 0)


-- throws Exception
function AllBinaryGameCanvas:updateCurrentTouchInputFactory(nextTouchInput)
        if not rawequal(nextTouchInput, self.currentTouchInputFactory) then
            self.currentTouchInputFactory = nextTouchInput
            PreLogUtil.put(tostring(self.currentTouchInputFactory), self, self.gameInputStrings.UDPATE_CURRENT_TOUCH_INPUT_FACTORY)
            self.touchButtonFactory:toggle(self:isPaused(), self.currentTouchInputFactory:getList())
        end
end
java_overload(AllBinaryGameCanvas, "updateCurrentTouchInputFactory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BaseTouchInput")) end)


-- throws Exception
function AllBinaryGameCanvas:updateTouch()
        self.gameBehavior:updateTouch(self)
end
java_overload(AllBinaryGameCanvas, "updateTouch", 0)


-- throws Exception
function AllBinaryGameCanvas:updateTouch2()
        local features = Features.getInstance()
        if features:isFeature(self.touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS) then
            if rawequal(self.gameLayerManager:getGameInfo():getCurrentLevel() - self:getStartLevel(), 1) then
                self:setTouchPaintableP(NullPaintable.getInstance())
            end
        end
end
java_overload(AllBinaryGameCanvas, "updateTouch2", 0)


-- throws Exception
function AllBinaryGameCanvas:postInitTouch()
        self:setTouchButtonsPaintable(TouchButtonsPaintableFactory.getInstance(self.gameLayerManager:getForegroundBasicColor()))
        self:updateScreenButtonPaintable()
end
java_overload(AllBinaryGameCanvas, "postInitTouch", 0)


function AllBinaryGameCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommands()
        self:setCommandListener(cmdListener)
end
java_overload(AllBinaryGameCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function AllBinaryGameCanvas:addCommands()
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        local myCommandsFactory = MyCommandsFactory.getInstance()
        if not rawequal(DebugFactory.getInstance(), NoDebug.getInstance()) then
            self:addCommand(gameCommandsFactory.START_TRACE)
        end
        self:addCommand(gameCommandsFactory.RESTART_COMMAND)
        self:addCommand(myCommandsFactory.PAUSE_COMMAND)
        self:addCommand(gameCommandsFactory.QUIT_COMMAND)
        local isOverScan = OperatingSystemFactory.getInstance():getOperatingSystemInstance():isOverScan()
        if J2MEUtil.isHTML() then
        elseif SWTUtil.isSWT then
        elseif not (isOverScan) then
            if TouchScreenFactory.getInstance():isTouch() and InGameFeatures.new():isAny() then
                self:addCommand(InGameOptionsForm.DISPLAY)
            end
            self:addCommand(gameCommandsFactory.SAVE)
            self:addCommand(gameCommandsFactory.DISPLAY_LOAD_FORM)
        end
end
java_overload(AllBinaryGameCanvas, "addCommands", 0)


function AllBinaryGameCanvas:itemStateChanged(item)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "itemStateChanged", e)
        end
end
java_overload(AllBinaryGameCanvas, "itemStateChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Item")) end)


-- throws Exception
function AllBinaryGameCanvas:updateScreenButtonPaintable()
        self.gameBehavior:updateScreenButtonPaintable(self)
end
java_overload(AllBinaryGameCanvas, "updateScreenButtonPaintable", 0)


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
java_overload(AllBinaryGameCanvas, "updateScreenButtonPaintable2", 0)


function AllBinaryGameCanvas:getLayerManager()
        return self.gameLayerManager
end
java_overload(AllBinaryGameCanvas, "getLayerManager", 0)


function AllBinaryGameCanvas:setLayerManager(layerManager)
        self.gameLayerManager = layerManager
end
java_overload(AllBinaryGameCanvas, "setLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


function AllBinaryGameCanvas:isGameOver()
        return self.gameOver
end
java_overload(AllBinaryGameCanvas, "isGameOver", 0)


function AllBinaryGameCanvas:setGameOver(gameOver)
        self.gameOver = gameOver
end
java_overload(AllBinaryGameCanvas, "setGameOver", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function AllBinaryGameCanvas:processGameOver()
        PreLogUtil.put(self.commonStrings.START, self, self.gameStrings.SET_GAME_OVER)
        self:setGameOver(true)
        self:removePauseCommand()
        self:setGameState(self.gameStateFactory.SHOW_END_RESULT_GAME_STATE)
        self:setEndGamePaintable(self:getEndGameStatePaintable())
end
java_overload(AllBinaryGameCanvas, "processGameOver", 0)


function AllBinaryGameCanvas:isHighScoreSubmitted()
        return self.highScoreSubmitted
end
java_overload(AllBinaryGameCanvas, "isHighScoreSubmitted", 0)


-- throws Exception
function AllBinaryGameCanvas:setHighScoreSubmitted(highScoreSubmitted)
        self.highScoreSubmitted = highScoreSubmitted
        if highScoreSubmitted then
            self.highScoresHelper:setSelectedHighScores(NullHighScoresSingletonFactory.getInstance())
        end
        self.logUtil:putF(tostring(StringMaker.new():append("isHighScoreSubmitted: "):appendboolean(highScoreSubmitted)), self, "setHighScoreSubmitted")
end
java_overload(AllBinaryGameCanvas, "setHighScoreSubmitted", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function AllBinaryGameCanvas:getGameState()
        return self.gameState
end
java_overload(AllBinaryGameCanvas, "getGameState", 0)


-- throws Exception
function AllBinaryGameCanvas:setGameState(gameState)
        self.logUtil:putF(tostring(StringMaker.new():append(self.gameStrings.GAME_STATE):append(self.stringUtil:toString(gameState))), self, self.gameStrings.SET_GAME_STATE)
        self.gameState = gameState
        self.gameStateTimeHelper:setStartTimeTNT()
        self:updateEndGameProcessor()
        self:updateGameKeyEventProcessor()
        self.gameBehavior:setGameState(self)
end
java_overload(AllBinaryGameCanvas, "setGameState", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameState")) end)


-- throws Exception
function AllBinaryGameCanvas:updateGameState()
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:processAdState(self.gameState, self.gameLayerManager:getGameInfo():getGameType())
        if not rawequal(self.gameState, self.gameStateFactory.PLAYING_GAME_STATE) then
            gameAdState:processPageAdState()
        end
end
java_overload(AllBinaryGameCanvas, "updateGameState", 0)


function AllBinaryGameCanvas:updateGameKeyEventProcessor()
        if not rawequal(self:getGameState(), self.gameStateFactory.PLAYING_GAME_STATE) or self.isCheating then
        else
        end
end
java_overload(AllBinaryGameCanvas, "updateGameKeyEventProcessor", 0)


function AllBinaryGameCanvas:removeAllGameKeyInputListenersOnBuild()
        self:removeAllGameKeyInputListeners()
end
java_overload(AllBinaryGameCanvas, "removeAllGameKeyInputListenersOnBuild", 0)


function AllBinaryGameCanvas:removeAllGameKeyInputListeners()
        self.gameBehavior:removeAllGameKeyInputListeners(self)
end
java_overload(AllBinaryGameCanvas, "removeAllGameKeyInputListeners", 0)


function AllBinaryGameCanvas:removeAllGameKeyInputListeners2()
        self.logUtil:putF("Remove PlayerInput Listeners", self, "removeAllGameKeyInputListeners")
        for index = self.localPlayerGameInputList:size() - 1, 0, -1 do
            local playerGameInput = self.localPlayerGameInputList:get(index)
            self:removeKeyInputListener(playerGameInput)
            playerGameInput:removeNonAIInputGameKeyEvents()
        end
end
java_overload(AllBinaryGameCanvas, "removeAllGameKeyInputListeners2", 0)


function AllBinaryGameCanvas:removeKeyInputListener(playerGameInput)
        self.gameKeyEventHandler:removeListener(playerGameInput)
end
java_overload(AllBinaryGameCanvas, "removeKeyInputListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PlayerGameInput")) end)


-- throws Exception
function AllBinaryGameCanvas:updateEndGameProcessor()
        self.gameBehavior:updateEndGameProcessor(self)
end
java_overload(AllBinaryGameCanvas, "updateEndGameProcessor", 0)


-- throws Exception
function AllBinaryGameCanvas:updateEndGameProcessor2()
        if rawequal(self:getGameState(), self.gameStateFactory.SHOW_END_RESULT_GAME_STATE) or rawequal(self:getGameState(), self.gameStateFactory.SHOW_HIGH_SCORE_GAME_STATE) then
            self:setEndGameProcessor(self.realEndGameProcessor)
        else
            self:setEndGameProcessor(Processor.getInstance())
        end
end
java_overload(AllBinaryGameCanvas, "updateEndGameProcessor2", 0)


-- throws Exception
function AllBinaryGameCanvas:buildGameInit(isPortion)
end
java_overload(AllBinaryGameCanvas, "buildGameInit", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function AllBinaryGameCanvas:cleanupGame()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CLEANUP)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:addNormalPortion(10, "Cleaning Up")
        self.primaryPlayerQueue:clear()
        self.secondaryPlayerQueue:clear()
        GameLevelDisplayChangeEventListenersFactory.getInstance():clear()
end
java_overload(AllBinaryGameCanvas, "cleanupGame", 0)


-- throws Exception
function AllBinaryGameCanvas:loadResourceLoadingLevel(resourceLoadingLevel)
        local gameInitializedEvent = GameInitializationUtil.getInstance().EVENT
        gameInitializedEvent:setResourceLoadingLevel(resourceLoadingLevel)
        GameInitializedEventHandler.getInstance():fireEvent(gameInitializedEvent)
end
java_overload(AllBinaryGameCanvas, "loadResourceLoadingLevel", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ResourceLoadingLevel")) end)


-- throws Exception
function AllBinaryGameCanvas:loadResources(level)
        local gameInitializedEvent = GameInitializationUtil.getInstance().EVENT
        gameInitializedEvent:setLevel(level)
        GameInitializedEventHandler.getInstance():fireEvent(gameInitializedEvent)
end
java_overload(AllBinaryGameCanvas, "loadResources", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function AllBinaryGameCanvas:updateColor()
end
java_overload(AllBinaryGameCanvas, "updateColor", 0)


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
        if not (self:isRunningInAnotherThread()) then
            return
        end
        progressCanvas:addNormalPortion(portion, "Finishing...")
        if self:isMainCanvas() or not (self:isInitialized()) then
            if features:isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND) then
                if not rawequal(self:getCustomCommandListener(), nil) then
                    progressCanvas:end_()
                end
            else
                progressCanvas:end_()
            end
            self:setInitialized(true)
        end
        if rawequal(self:getCustomCommandListener(), NullCommandListener.NULL_COMMAND_LISTENER) then
            self.logUtil:putF("Show Game Paintable in DemoCanvas Thread", self, self.BUILD_GAME)
            self.gameCanvasStartListener:showGamePaintable()
        else
            self.logUtil:putF("No GameCanvasStartListener", self, self.BUILD_GAME)
        end
        self.colorFillPaintable:setBasicColorP(self.gameLayerManager:getBackgroundBasicColor())
        self.gameBehavior:buildGame(self)
end
java_overload(AllBinaryGameCanvas, "buildGame", 1, function(java_a1) return true and type(java_a1) == "number" end)


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
java_overload(AllBinaryGameCanvas, "buildGame2", 0)


function AllBinaryGameCanvas:addKeyInputListener(playerGameInput)
        GameKeyEventHandler.getInstance():addListenerForPlayer(playerGameInput, playerGameInput:getPlayerInputId())
end
java_overload(AllBinaryGameCanvas, "addKeyInputListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PlayerGameInput")) end)


function AllBinaryGameCanvas:setGameCanvasStartListener(gameCanvasStartListener)
        self.gameCanvasStartListener = gameCanvasStartListener
end
java_overload(AllBinaryGameCanvas, "setGameCanvasStartListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DemoPaintableInterface")) end)


-- throws Exception
function AllBinaryGameCanvas:loadState()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.LOAD)
        local hashtable = self:getLoadStateHashtable()
        if not rawequal(hashtable, nil) and hashtable:size() > 0 then
            local levelAsString = hashtable:get(GameInfo.LEVEL_NAME)
            local level = require("allbinary_java").number_value(tostring(levelAsString), "intValue")
            local gameInfo = self.gameLayerManager:getGameInfo()
            gameInfo:setCurrentLevel(level)
        end
end
java_overload(AllBinaryGameCanvas, "loadState", 0)


-- throws Exception
function AllBinaryGameCanvas:getLoadStateHashtable()
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonLabels.START_LABEL):append(self.stringUtil:toString(self.hashtable))), self, "getLoadStateHashtable")
        return self.hashtable
end
java_overload(AllBinaryGameCanvas, "getLoadStateHashtable", 0)


function AllBinaryGameCanvas:setLoadStateHashtable(hashtable)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonLabels.START_LABEL):append(self.stringUtil:toString(hashtable))), self, "setLoadStateHashtable")
        self.hashtable = hashtable
end
java_overload(AllBinaryGameCanvas, "setLoadStateHashtable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABHashtable")) end)


function AllBinaryGameCanvas:getCurrentStateHashtable()
        local hashtable = self.stdUtil:createHashtable()
        local level = self.gameLayerManager:getGameInfo():getCurrentLevel()
        hashtable:put(tostring(GameInfo.LEVEL_NAME), tostring(level))
        self.logUtil:putF(tostring(StringMaker.new():append("End: "):append(self.stringUtil:toString(hashtable))), self, "getCurrentStateHashtable")
        return hashtable
end
java_overload(AllBinaryGameCanvas, "getCurrentStateHashtable", 0)


function AllBinaryGameCanvas:paintGameOver(graphics)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end
java_overload(AllBinaryGameCanvas, "paintGameOver", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:draw(graphics)
        self.colorFillPaintable:paint(graphics)
        self.basicSetColorUtil:setBasicColorP(graphics, self.gameLayerManager:getForegroundBasicColor())
        self.gameSpecificPaintable:paint(graphics)
end
java_overload(AllBinaryGameCanvas, "draw", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:clear(graphics)
        self.colorFillPaintable:paint(graphics)
end
java_overload(AllBinaryGameCanvas, "clear", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:paint(graphics)
        self.myFontProcessor:process(graphics)
        self.baseGameStatistics:nextRefresh()
        self:draw(graphics)
        self.menuPaintable:paint(graphics)
        self.progressPaintable:paint(graphics)
end
java_overload(AllBinaryGameCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:paintThreed(graphics)
end
java_overload(AllBinaryGameCanvas, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function AllBinaryGameCanvas:processEndLevelIntermissionGameState()
end
java_overload(AllBinaryGameCanvas, "processEndLevelIntermissionGameState", 0)


function AllBinaryGameCanvas:nonBotPaint(graphics)
        self.endGamePaintable:paint(graphics)
        self.intermissionPaintable:paint(graphics)
        self:paintIntermission(graphics)
        self.touchPaintable:paint(graphics)
end
java_overload(AllBinaryGameCanvas, "nonBotPaint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:paintIntermission(graphics)
end
java_overload(AllBinaryGameCanvas, "paintIntermission", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AllBinaryGameCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end
java_overload(AllBinaryGameCanvas, "keyPressed", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryGameCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end
java_overload(AllBinaryGameCanvas, "keyReleased", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryGameCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end
java_overload(AllBinaryGameCanvas, "keyRepeated", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryGameCanvas:keyPressedByDevice(keyCode, deviceId)
        self.inputProcessor:keyPressedByDevice(keyCode, deviceId)
end
java_overload(AllBinaryGameCanvas, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryGameCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self.inputProcessor:keyPressedByDevice(keyCode, deviceId)
        end
end
java_overload(AllBinaryGameCanvas, "keyRepeatedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AllBinaryGameCanvas:keyReleasedByDevice(keyCode, deviceId)
        self.inputProcessor:keyReleasedByDevice(self, keyCode, deviceId)
end
java_overload(AllBinaryGameCanvas, "keyReleasedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function AllBinaryGameCanvas:handleRawKey(keyCode, deviceId, repeated)
end
java_overload(AllBinaryGameCanvas, "handleRawKey", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "boolean" end)


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
java_overload(AllBinaryGameCanvas, "endProgress", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function AllBinaryGameCanvas:processPlayingGame()
        self.cheatProcessor:update()
        self.sensorGameUpdateProcessor:getInputSensor():update()
        self.gameInputProcessor:process()
        self.gameLayerManager:process()
        self.startIntermissionProcessor:process()
end
java_overload(AllBinaryGameCanvas, "processPlayingGame", 0)


-- throws Exception
function AllBinaryGameCanvas:threadInit()
end
java_overload(AllBinaryGameCanvas, "threadInit", 0)


-- throws Exception
function AllBinaryGameCanvas:processGame()
        java_super(RunnableCanvas, "process", 0)(self)
        if AllBinaryMediaManager.update() then
            if not (self.primaryPlayerQueue:process()) then
                self.secondaryPlayerQueue:process()
            end
        end
        self.mainStateProcessor:process()
        self.menuInputProcessor:processInputList()
        self.endGameProcessor:process()
        self.baseGameStatistics:nextFrame()
end
java_overload(AllBinaryGameCanvas, "processGame", 0)


function AllBinaryGameCanvas:notifyDonePainting()
        do -- synchronized (self)
            self.threadObjectUtil:notifyObject(self)
        end
end
java_overload(AllBinaryGameCanvas, "notifyDonePainting", 0)


-- throws Exception
function AllBinaryGameCanvas:shouldWait()
        local features = Features.getInstance()
        if AndroidUtil.isAndroid() then
        elseif features:isFeature(self.openGLFeatureFactory.OPENGL_2D) then
        else
            if features:isDefault(self.openGLFeatureFactory.OPENGL) then
                local openGLImageSpecificFactory = OpenGLImageSpecificFactory.getInstance()
                while openGLImageSpecificFactory.updating do
                    require("java.lang.Thread").sleep(self.YIELD_SLEEP)
                end
            end
        end
end
java_overload(AllBinaryGameCanvas, "shouldWait", 0)


function AllBinaryGameCanvas:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
            local progressCanvas = ProgressCanvasFactory.getInstance()
            progressCanvas:addNormalPortion(50, "Game Thread")
            self:setCurrentThread()
            self:setRunning(true)
            if rawequal(self:getCustomCommandListener(), NullCommandListener.NULL_COMMAND_LISTENER) then
                require("java.lang.Thread").sleep(self.YIELD_SLEEP)
            end
            self:shouldWait()
            self:threadInit()
            if rawequal(self:getCustomCommandListener(), NullCommandListener.NULL_COMMAND_LISTENER) then
                require("java.lang.Thread").sleep(self.YIELD_SLEEP)
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end
java_overload(AllBinaryGameCanvas, "run", 0)


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
java_overload(AllBinaryGameCanvas, "run2", 0)


-- throws Exception
function AllBinaryGameCanvas:run3()
        self.loopTimeHelper:setStartTime(self.gameTickTimeDelayHelper:setStartTime())
        self.gameTickDisplayInfoSingleton:update()
        self:processGame()
        self:processLoopSleep()
end
java_overload(AllBinaryGameCanvas, "run3", 0)


function AllBinaryGameCanvas:setRunning(running)
        java_super(RunnableCanvas, "setRunning", 1)(self, running)
        local try_ok, try_error, try_value = pcall(function()
            local features = Features.getInstance()
            if running then
            else
                if features:isDefault(self.openGLFeatureFactory.OPENGL) or SWTUtil.isSWT then
                    if not rawequal(self.gameLayerManager:getGameInfo():getGameType(), self.gameTypeFactory.BOT) then
                        local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                        currentDisplayableFactory:clearRunnable()
                    end
                    self:end_()
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.SET_RUNNING, e)
        end
end
java_overload(AllBinaryGameCanvas, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


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
java_overload(AllBinaryGameCanvas, "end_", 0)


-- throws Exception
function AllBinaryGameCanvas:endGameThread()
        DisplayChangeEventHandler.getInstance():removeListener(self)
        GameLevelDisplayChangeEventListenersFactory.getInstance():clear()
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:notPlayingAdState()
end
java_overload(AllBinaryGameCanvas, "endGameThread", 0)


function AllBinaryGameCanvas:createHighScore(score)
        local gameInfo = self.gameLayerManager:getGameInfo()
        return HighScore.new(0, "NONE", GameInfo.new(gameInfo:getGameType(), gameInfo:getGameMode(), PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0), score)
end
java_overload(AllBinaryGameCanvas, "createHighScore", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function AllBinaryGameCanvas:setHighScore(abeClientInformation, name, score, autoSubmit, isLast)
        self.gameBehavior:setHighScore(abeClientInformation, self, name, score, autoSubmit, isLast)
end
java_overload(AllBinaryGameCanvas, "setHighScore", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" and type(java_a4) == "boolean" and type(java_a5) == "boolean" end)


-- throws Exception
function AllBinaryGameCanvas:setHighScore2(abeClientInformation, name, score, autoSubmit, isLast)
        local highScore = self:createHighScore(score)
        local textBox = HighScoreTextBox.new(self.highScoresFactoryInterface, self.highScoresHelper, abeClientInformation, self.gameLayerManager:getGameInfo(), self:getCustomCommandListener(), name, highScore, self.gameLayerManager:getBackgroundBasicColor(), self.gameLayerManager:getForegroundBasicColor())
        if isLast then
            self:getCustomCommandListener():commandAction(GameCommandsFactory.getInstance().SET_MENU_DISPLAYABLE, textBox)
        end
        if autoSubmit then
            SecondaryThreadPool.getInstance():runTask(SaveHighScoreRunnable.new(isLast, textBox))
        end
end
java_overload(AllBinaryGameCanvas, "setHighScore2", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" and type(java_a4) == "boolean" and type(java_a5) == "boolean" end)


function AllBinaryGameCanvas:getGameStateTimeHelper()
        return self.gameStateTimeHelper
end
java_overload(AllBinaryGameCanvas, "getGameStateTimeHelper", 0)


function AllBinaryGameCanvas:setInitialized(initialized)
        self.initialized = initialized
end
java_overload(AllBinaryGameCanvas, "setInitialized", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function AllBinaryGameCanvas:isInitialized()
        return self.initialized
end
java_overload(AllBinaryGameCanvas, "isInitialized", 0)


function AllBinaryGameCanvas:getSourceId()
        return AllBinaryGameCanvas.id
end
java_overload(AllBinaryGameCanvas, "getSourceId", 0)


function AllBinaryGameCanvas:setProgressPaintable(paintable)
        self.progressPaintable = paintable
end
java_overload(AllBinaryGameCanvas, "setProgressPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PaintableInterface")) end)


function AllBinaryGameCanvas:getStartIntermissionInterface()
        return self.startIntermissionInterface
end
java_overload(AllBinaryGameCanvas, "getStartIntermissionInterface", 0)


function AllBinaryGameCanvas:getEndLevelIntermissionInterface()
        return self.endLevelIntermissionInterface
end
java_overload(AllBinaryGameCanvas, "getEndLevelIntermissionInterface", 0)


function AllBinaryGameCanvas:setTouchPaintableP(paintable)
        self.touchPaintable = paintable
end
java_overload(AllBinaryGameCanvas, "setTouchPaintableP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getTouchPaintableP()
        return self.touchPaintable
end
java_overload(AllBinaryGameCanvas, "getTouchPaintableP", 0)


function AllBinaryGameCanvas:setEndGamePaintable(endGamePaintable)
        self.endGamePaintable = endGamePaintable
end
java_overload(AllBinaryGameCanvas, "setEndGamePaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getEndGamePaintable()
        return self.endGamePaintable
end
java_overload(AllBinaryGameCanvas, "getEndGamePaintable", 0)


function AllBinaryGameCanvas:setIntermissionPaintable(intermissionPaintable)
        self.intermissionPaintable = intermissionPaintable
end
java_overload(AllBinaryGameCanvas, "setIntermissionPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getIntermissionPaintable()
        return self.intermissionPaintable
end
java_overload(AllBinaryGameCanvas, "getIntermissionPaintable", 0)


function AllBinaryGameCanvas:getEndGameInfoP()
        return self.endGameInfo
end
java_overload(AllBinaryGameCanvas, "getEndGameInfoP", 0)


function AllBinaryGameCanvas:setHighScoresPaintable(highScoresPaintable)
        self.highScoresPaintable = highScoresPaintable
end
java_overload(AllBinaryGameCanvas, "setHighScoresPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getHighScoresPaintable()
        return self.highScoresPaintable
end
java_overload(AllBinaryGameCanvas, "getHighScoresPaintable", 0)


function AllBinaryGameCanvas:getRealHighScoresPaintable()
        return self.realHighScoresPaintable
end
java_overload(AllBinaryGameCanvas, "getRealHighScoresPaintable", 0)


function AllBinaryGameCanvas:clearPlayerGameInputList()
        local playerGameInput = nil
        for index = self.localPlayerGameInputList:size() - 1, 0, -1 do
            playerGameInput = self.localPlayerGameInputList:get(index)
            self.gameKeyEventHandler:removeListener(playerGameInput)
        end
        self.localPlayerGameInputList:clear()
end
java_overload(AllBinaryGameCanvas, "clearPlayerGameInputList", 0)


function AllBinaryGameCanvas:addPlayerGameInput(playerGameInput)
        self.localPlayerGameInputList:add(playerGameInput)
end
java_overload(AllBinaryGameCanvas, "addPlayerGameInput", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PlayerGameInput")) end)


function AllBinaryGameCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end
java_overload(AllBinaryGameCanvas, "setMenuInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicMenuInputProcessor")) end)


function AllBinaryGameCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end
java_overload(AllBinaryGameCanvas, "getMenuInputProcessor", 0)


function AllBinaryGameCanvas:getMenuForm()
        return self.menuForm
end
java_overload(AllBinaryGameCanvas, "getMenuForm", 0)


function AllBinaryGameCanvas:setMenuForm(menuForm)
        self.menuForm = menuForm
end
java_overload(AllBinaryGameCanvas, "setMenuForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ScrollSelectionForm")) end)


function AllBinaryGameCanvas:getStartLevel()
        return self.startLevel
end
java_overload(AllBinaryGameCanvas, "getStartLevel", 0)


function AllBinaryGameCanvas:setStartLevel(startLevel)
        self.startLevel = startLevel
end
java_overload(AllBinaryGameCanvas, "setStartLevel", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AllBinaryGameCanvas:setTouchButtonsPaintable(touchButtonsPaintable)
        self.touchButtonsPaintable = touchButtonsPaintable
end
java_overload(AllBinaryGameCanvas, "setTouchButtonsPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getTouchButtonsPaintable()
        return self.touchButtonsPaintable
end
java_overload(AllBinaryGameCanvas, "getTouchButtonsPaintable", 0)


function AllBinaryGameCanvas:setGameInputProcessor(gameInputProcessor)
        self.gameInputProcessor = gameInputProcessor
end
java_overload(AllBinaryGameCanvas, "setGameInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Processor")) end)


function AllBinaryGameCanvas:getGameInputProcessor()
        return self.gameInputProcessor
end
java_overload(AllBinaryGameCanvas, "getGameInputProcessor", 0)


function AllBinaryGameCanvas:setEndGameProcessor(endGameProcessor)
        self.endGameProcessor = endGameProcessor
end
java_overload(AllBinaryGameCanvas, "setEndGameProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Processor")) end)


function AllBinaryGameCanvas:getEndGameProcessor()
        return self.endGameProcessor
end
java_overload(AllBinaryGameCanvas, "getEndGameProcessor", 0)


function AllBinaryGameCanvas:setEndGameStatePaintable(endGameStatePaintable)
        self.endGameStatePaintable = endGameStatePaintable
end
java_overload(AllBinaryGameCanvas, "setEndGameStatePaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getEndGameStatePaintable()
        return self.endGameStatePaintable
end
java_overload(AllBinaryGameCanvas, "getEndGameStatePaintable", 0)


function AllBinaryGameCanvas:setNonBotPaintableP(nonBotPaintable)
        self.nonBotPaintable = nonBotPaintable
end
java_overload(AllBinaryGameCanvas, "setNonBotPaintableP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getNonBotPaintableP()
        return self.nonBotPaintable
end
java_overload(AllBinaryGameCanvas, "getNonBotPaintableP", 0)


function AllBinaryGameCanvas:setStartIntermissionPaintable(startIntermissionPaintable)
        self.startIntermissionPaintable = startIntermissionPaintable
end
java_overload(AllBinaryGameCanvas, "setStartIntermissionPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "InitUpdatePaintable")) end)


function AllBinaryGameCanvas:getStartIntermissionPaintable()
        return self.startIntermissionPaintable
end
java_overload(AllBinaryGameCanvas, "getStartIntermissionPaintable", 0)


function AllBinaryGameCanvas:setMainStateProcessor(mainStateProcessor)
        self.mainStateProcessor = mainStateProcessor
end
java_overload(AllBinaryGameCanvas, "setMainStateProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Processor")) end)


function AllBinaryGameCanvas:getMainStateProcessor()
        return self.mainStateProcessor
end
java_overload(AllBinaryGameCanvas, "getMainStateProcessor", 0)


function AllBinaryGameCanvas:setProcessGameProcessor(processGameProcessor)
        self.processGameProcessor = processGameProcessor
end
java_overload(AllBinaryGameCanvas, "setProcessGameProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Processor")) end)


function AllBinaryGameCanvas:getProcessGameProcessor()
        return self.processGameProcessor
end
java_overload(AllBinaryGameCanvas, "getProcessGameProcessor", 0)


function AllBinaryGameCanvas:setOpenMenuPaintable(openMenuPaintable)
        self.openMenuPaintable = openMenuPaintable
end
java_overload(AllBinaryGameCanvas, "setOpenMenuPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getOpenMenuPaintable()
        return self.openMenuPaintable
end
java_overload(AllBinaryGameCanvas, "getOpenMenuPaintable", 0)


function AllBinaryGameCanvas:setPopupMenuInputProcessor(popupMenuInputProcessor)
        self.popupMenuInputProcessor = popupMenuInputProcessor
end
java_overload(AllBinaryGameCanvas, "setPopupMenuInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicMenuInputProcessor")) end)


function AllBinaryGameCanvas:getPopupMenuInputProcessor()
        return self.popupMenuInputProcessor
end
java_overload(AllBinaryGameCanvas, "getPopupMenuInputProcessor", 0)


function AllBinaryGameCanvas:getSensorGameUpdateProcessor()
        return self.sensorGameUpdateProcessor
end
java_overload(AllBinaryGameCanvas, "getSensorGameUpdateProcessor", 0)


function AllBinaryGameCanvas:getRawGameInputProcessor()
        return self.rawGameInputProcessor
end
java_overload(AllBinaryGameCanvas, "getRawGameInputProcessor", 0)


function AllBinaryGameCanvas:getRawInputProcessor()
        return self.rawInputProcessor
end
java_overload(AllBinaryGameCanvas, "getRawInputProcessor", 0)


function AllBinaryGameCanvas:setInputProcessor(inputProcessor)
        self.inputProcessor = inputProcessor
end
java_overload(AllBinaryGameCanvas, "setInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "InputProcessor")) end)


function AllBinaryGameCanvas:getInputProcessor()
        return self.inputProcessor
end
java_overload(AllBinaryGameCanvas, "getInputProcessor", 0)


function AllBinaryGameCanvas:setMenuPaintable(menuPaintable)
        self.menuPaintable = menuPaintable
end
java_overload(AllBinaryGameCanvas, "setMenuPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getMenuPaintable()
        return self.menuPaintable
end
java_overload(AllBinaryGameCanvas, "getMenuPaintable", 0)


function AllBinaryGameCanvas:setFormPaintable(formPaintable)
        self.formPaintable = formPaintable
end
java_overload(AllBinaryGameCanvas, "setFormPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getFormPaintable()
        return self.formPaintable
end
java_overload(AllBinaryGameCanvas, "getFormPaintable", 0)


function AllBinaryGameCanvas:setGameSpecificPaintableP(gameSpecificPaintable)
        self.gameSpecificPaintable = gameSpecificPaintable
end
java_overload(AllBinaryGameCanvas, "setGameSpecificPaintableP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function AllBinaryGameCanvas:getGameSpecificPaintableP()
        return self.gameSpecificPaintable
end
java_overload(AllBinaryGameCanvas, "getGameSpecificPaintableP", 0)


function AllBinaryGameCanvas:isSingleThread()
        return OpenGLFeatureUtil.getInstance():isAnyThreed() or SWTUtil.isSWT
end
java_overload(AllBinaryGameCanvas, "isSingleThread", 0)


function AllBinaryGameCanvas:isRunningInAnotherThread()
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
            return true
        else
            return self:isRunning()
        end
end
java_overload(AllBinaryGameCanvas, "isRunningInAnotherThread", 0)


function AllBinaryGameCanvas:getType()
        return AllBinaryGameCanvas.TYPE
end
java_overload(AllBinaryGameCanvas, "getType", 0)


function AllBinaryGameCanvas:getTitle()
        return java_super(RunnableCanvas, "getTitle", 0)(self)
end
java_overload(AllBinaryGameCanvas, "getTitle", 0)


function AllBinaryGameCanvas:isPaused()
        return java_super(RunnableCanvas, "isPaused", 0)(self)
end
java_overload(AllBinaryGameCanvas, "isPaused", 0)

AllBinaryGameCanvas.id = 0
AllBinaryGameCanvas.TYPE = 2

return AllBinaryGameCanvas

