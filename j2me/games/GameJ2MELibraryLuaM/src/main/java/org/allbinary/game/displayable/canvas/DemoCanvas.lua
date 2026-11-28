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

local DemoCanvas = {}
package.loaded["org.allbinary.game.displayable.canvas.DemoCanvas"] = DemoCanvas

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
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
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
local HighScoresHelperBase = java_lazy("org.allbinary.game.score.HighScoresHelperBase")
local HighScoresPaintable = java_lazy("org.allbinary.game.score.HighScoresPaintable")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")
local GameState = java_lazy("org.allbinary.game.state.GameState")
local GameStateFactory = java_lazy("org.allbinary.game.state.GameStateFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local ResizableListenerHandler = java_lazy("org.allbinary.graphics.ResizableListenerHandler")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local MyCommandsFactory = java_lazy("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local FullScreenPaintableFactory = java_lazy("org.allbinary.graphics.displayable.screen.FullScreenPaintableFactory")
local CommandCurrentSelectionFormFactory = java_lazy("org.allbinary.graphics.form.CommandCurrentSelectionFormFactory")
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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local OperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local InApplicationPurchaseFactory = java_lazy("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")
local LockableFeature = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeature")
local LockableFeatureFactory = java_lazy("org.allbinary.logic.system.security.licensing.LockableFeatureFactory")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local AllBinaryMediaManager = java_lazy("org.allbinary.media.audio.AllBinaryMediaManager")
local EarlySoundsFactory = java_lazy("org.allbinary.media.audio.EarlySoundsFactory")
local PrimaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.PrimaryPlayerQueueFactory")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local NullThread = java_lazy("org.allbinary.thread.NullThread")
local ThreadFactoryUtil = java_lazy("org.allbinary.thread.ThreadFactoryUtil")
local ThreadUtil = java_lazy("org.allbinary.thread.ThreadUtil")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GameCanvasRunnableInterface = require("org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local DemoPaintableInterface = require("org.allbinary.game.displayable.canvas.DemoPaintableInterface")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local BasicMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.BasicMenuInputProcessor")
local CommandFormInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.CommandFormInputProcessor")
local DemoCanvasProgressUtil = java_lazy("org.allbinary.game.displayable.canvas.DemoCanvasProgressUtil")
local DemoGameRunnable = java_lazy("org.allbinary.game.displayable.canvas.DemoGameRunnable")
local DemoGameStartupRunnable = java_lazy("org.allbinary.game.displayable.canvas.DemoGameStartupRunnable")
local DemoLimitedCommandTextItemArrayFactory = java_lazy("org.allbinary.game.displayable.canvas.DemoLimitedCommandTextItemArrayFactory")
local FormUtil = java_lazy("org.allbinary.game.displayable.canvas.FormUtil")
local GameInputMappingCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingCanvas")
local GameRunnable = java_lazy("org.allbinary.game.displayable.canvas.GameRunnable")
local NoMenuInputProcessor = java_lazy("org.allbinary.game.displayable.canvas.NoMenuInputProcessor")
local NullGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.NullGameCanvas")
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

-- class table DemoCanvas is declared before the requires
DemoCanvas.__index = DemoCanvas
DemoCanvas.className = "DemoCanvas"
DemoCanvas.javaClassName = "org.allbinary.game.displayable.canvas.DemoCanvas"
setmetatable(DemoCanvas, {__index = RunnableCanvas})
DemoCanvas.java_implements = " GameCanvasRunnableInterface MenuListener DisplayChangeEventListener DemoPaintableInterface "
DemoCanvas.java_interfaces = function() return {GameCanvasRunnableInterface, MenuListener, DisplayChangeEventListener, DemoPaintableInterface} end

function DemoCanvas:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.myCommandsFactory = MyCommandsFactory.getInstance()
    self.gameAdStateFactory = GameAdStateFactory.getInstance()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.gameStateFactory = GameStateFactory.getInstance()
    self.threadFactoryUtil = ThreadFactoryUtil.getInstance()
    self.formUtil = FormUtil.getInstance()
    self.fullscreenPaintable = FullScreenPaintableFactory.getInstance().paintable
    self.basicGameDemoPaintable = StatePaintableFactory.getInstance()
    self.specialAnimationInterface = SpecialAnimation.getInstance()
    self.paintedSpecialAnimationInterface = SpecialAnimation.getInstance()
    self.fullScreenUtil = FullScreenUtil.getInstance()
    self.gameCanvas = NullGameCanvas.getInstance()
    self.highScoresHelper = HighScoresHelper.new()
    self.realHighScoresPaintable = HighScoresPaintable.new()
    self.highScoresPaintable = NullPaintable.getInstance()
    self.state = 0
    self.canvasThread = NullThread.NULL_THREAD
    self.timeDelayHelper = TimeDelayHelper.new(6000)
    self.basicColor = self.basicColorFactory.RED
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.highScoresFactoryInterface == nil then self.highScoresFactoryInterface = nil end
    self.menuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuForm = ScrollSelectionForm.getNullScrollSelectionForm()
    if self.gameInitializationInterfaceFactoryInterface == nil then self.gameInitializationInterfaceFactoryInterface = nil end
    if self.initialized == nil then self.initialized = false end
    if self.demoGameRunnable == nil then self.demoGameRunnable = nil end
    self.defaultPaintableInterface = NullPaintable.getInstance()
    self.paintableInterface = NullPaintable.getInstance()
    if self.overlayPaintable == nil then self.overlayPaintable = nil end
    self.progressPaintable = ProgressCanvasFactory.getLazyInstance()
    self.tempWait = NullWaitGameRunnable.getInstance().WAIT
    self.inputToGameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()
    self.gameRunnable = NullWaitGameRunnable.getInstance()
    self.isSingleKeyRepeatableProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
    self.NONE = GameKeyFactory.getInstance().NONE
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.lastKeyNotMapped = -1
    self.SET_STATE = "setState"
    self.baseGameStatistics = GameStatisticsFactory.getInstance()
end


function DemoCanvas._jinit(self, abeClientInformation, commandListener, highScoresFactoryInterface, paintable, overlayPaintable, gameInitializationInterfaceFactoryInterface, isContinue)
    java_super_init(RunnableCanvas, self, commandListener, CurrentDisplayableFactory.getInstance().DEFAULT_CHILD_NAME_LIST, true)
    DemoCanvas._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
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
        self.demoGameRunnable = DemoGameStartupRunnable.new(self)
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
    return self
end

function DemoCanvas.new(...)
    local self = setmetatable({}, DemoCanvas)
    DemoCanvas._jinit(self, ...)
    return self
end


function DemoCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(DemoCanvas, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function DemoCanvas:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonLabels.START_LABEL):append(tostring(self.displayInfo))), self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT)
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
java_overload(DemoCanvas, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


function DemoCanvas:getCustomCommands()
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
java_overload(DemoCanvas, "getCustomCommands", 0)


function DemoCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        local commandArray = self:getCustomCommands()
        local size = (commandArray.n or #commandArray)
        for index = 0, size - 1 do
            self:addCommand(commandArray[index + 1])
        end
        CustomGameMenuUtil.add(self)
        self:setCommandListener(cmdListener)
end
java_overload(DemoCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


-- throws Exception
function DemoCanvas:initPostPaint()
end
java_overload(DemoCanvas, "initPostPaint", 0)


-- throws Exception
function DemoCanvas:mediaInit()
        AllBinaryMediaManager.init(EarlySoundsFactory.getInstance())
end
java_overload(DemoCanvas, "mediaInit", 0)


function DemoCanvas:itemStateChanged(item)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end
java_overload(DemoCanvas, "itemStateChanged", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Item")) end)


-- throws Exception
function DemoCanvas:initMenu()
        self:close()
        local commandTextItemArrayFactory = DemoLimitedCommandTextItemArrayFactory.getInstance():getCommandTextItemArrayFactory()
        local items = commandTextItemArrayFactory:getInstance(self:getCommandStack(), self.basicColorFactory.BLACK, self.basicColorFactory.WHITE)
        local formType = FormTypeFactory.getInstance():getFormType()
        local rectangle = self.formUtil:createFormRectangle()
        PreLogUtil.put(tostring(StringMaker.new():append(self.commonLabels.START_LABEL):append(tostring(self.displayInfo))), self, "initMenu")
        local scrollSelectionForm = CommandCurrentSelectionFormFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, items, rectangle, formType, 15, true, self.basicColorFactory.BLACK, self.basicColorFactory.WHITE)
        self:setMenuForm(scrollSelectionForm)
        local formType2 = FormTypeFactory.getInstance():getFormType()
        local rectangle2 = self.formUtil:createFormRectangle()
        scrollSelectionForm:init(rectangle2, formType2)
        if not rawequal(self:getMenuForm(), ScrollSelectionFormNoneFactory.getInstance()) then
            self:setMenuInputProcessor(CommandFormInputProcessor.new(BasicArrayListD.new(), -1, self, self:getMenuForm()))
        end
        self:open()
end
java_overload(DemoCanvas, "initMenu", 0)


function DemoCanvas:open()
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():addListener(self:getMenuInputProcessor())
end
java_overload(DemoCanvas, "open", 0)


function DemoCanvas:close()
        BasicMotionGesturesHandler.getInstance():removeListener(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():removeListener(self:getMenuInputProcessor())
end
java_overload(DemoCanvas, "close", 0)


function DemoCanvas:getSourceId()
        return DemoCanvas.id
end
java_overload(DemoCanvas, "getSourceId", 0)


function DemoCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end
java_overload(DemoCanvas, "keyPressed", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DemoCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end
java_overload(DemoCanvas, "keyReleased", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DemoCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end
java_overload(DemoCanvas, "keyRepeated", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DemoCanvas:keyPressedByDevice(keyCode, deviceId)
        self:addGameKeyEvent(keyCode, false)
end
java_overload(DemoCanvas, "keyPressedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function DemoCanvas:keyReleasedByDevice(keyCode, deviceId)
        self:removeGameKeyEvent(keyCode, false)
end
java_overload(DemoCanvas, "keyReleasedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function DemoCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self:addGameKeyEvent(keyCode, true)
        end
end
java_overload(DemoCanvas, "keyRepeatedByDevice", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function DemoCanvas:addGameKeyEvent(keyCode, repeated)
        local try_ok, try_error, try_value = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if not rawequal(gameKey, self.NONE) then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                DownGameKeyEventHandler.getInstance():fireEvent(gameKeyEvent)
            else
                if not rawequal(self.lastKeyNotMapped, keyCode) then
                    self.lastKeyNotMapped = keyCode
                    self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.ADD_KEY_EVENT)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end
java_overload(DemoCanvas, "addGameKeyEvent", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "boolean" end)


function DemoCanvas:removeGameKeyEvent(keyCode, repeated)
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
java_overload(DemoCanvas, "removeGameKeyEvent", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "boolean" end)


function DemoCanvas:pause()
        self:close()
        self:setPaused(true)
        self.gameRunnable = NullWaitGameRunnable.getInstance()
        self.gameCanvas:pause()
end
java_overload(DemoCanvas, "pause", 0)


function DemoCanvas:unPause()
        self:open()
        self.gameCanvas:unPause()
        self.gameRunnable = self.gameCanvas.gameRunnable
        self:setPaused(false)
end
java_overload(DemoCanvas, "unPause", 0)


function DemoCanvas:isPausable()
        if rawequal(CurrentDisplayableFactory.getInstance():getUsedRunnable(), NullWaitGameRunnable.getInstance()) then
            return true
        else
            return false
        end
end
java_overload(DemoCanvas, "isPausable", 0)


function DemoCanvas:isGameOver()
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.NOT_IMPLEMENTED):append(" since not a game")), self, "isGameOver")
        return false
end
java_overload(DemoCanvas, "isGameOver", 0)


-- throws Exception
function DemoCanvas:setLoadStateHashtable(hashtable)
        self.logUtil:putF("Trying to continue a demo lol - only continue a game canvas not the demo", self, "setLoadStateHashtable")
end
java_overload(DemoCanvas, "setLoadStateHashtable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABHashtable")) end)


-- throws Exception
function DemoCanvas:getLoadStateHashtable()
        self.logUtil:putF("Trying to continue a demo lol - only continue a game canvas not the demo", self, "getLoadStateHashtable")
        return self.stdUtil.NULL_TABLE
end
java_overload(DemoCanvas, "getLoadStateHashtable", 0)


-- throws Exception
function DemoCanvas:getCurrentStateHashtable()
        self.logUtil:putF("Trying to save the AI lol", self, "getCurrentStateHashtable")
        return self.stdUtil.NULL_TABLE
end
java_overload(DemoCanvas, "getCurrentStateHashtable", 0)


function DemoCanvas:setHighScoreSubmitted(isNotUsed)
end
java_overload(DemoCanvas, "setHighScoreSubmitted", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function DemoCanvas:paint(graphics)
        self.paintableInterface:paint(graphics)
        self.paintedSpecialAnimationInterface:paintXY(graphics, 0, 0)
        self.highScoresPaintable:paint(graphics)
        self:getBasicGameDemoPaintable():paint(graphics)
        self.overlayPaintable:paint(graphics)
        self.fullscreenPaintable:paint(graphics)
        self.progressPaintable:paint(graphics)
end
java_overload(DemoCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function DemoCanvas:paintThreed(graphics)
        self.paintableInterface:paintThreed(graphics)
        self.paintedSpecialAnimationInterface:paintThreedXYZ(graphics, 0, 0, 0)
end
java_overload(DemoCanvas, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function DemoCanvas:processGameOver()
        self.logUtil:putF("Not Implemented since not a game", self, "setGameOver")
end
java_overload(DemoCanvas, "processGameOver", 0)


function DemoCanvas:demoStateChange()
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
java_overload(DemoCanvas, "demoStateChange", 0)


function DemoCanvas:updateDemoState()
        PreLogUtil.put(tostring(SmallIntegerSingletonFactory.getInstance():createInstance(self.state)), self, self.SET_STATE)
        self:getBasicGameDemoPaintable():setState(self.state)
        if rawequal(self.state, 0) then
            self.highScoresPaintable = NullPaintable.getInstance()
            self.paintedSpecialAnimationInterface = self:getSpecialAnimationInterface()
            if not (self.demoGameRunnable:isRunning()) and self.gameCanvas:isInitialized() then
                self:getSpecialAnimationInterface():reset()
            end
        elseif rawequal(self.state, 1) then
            self.paintedSpecialAnimationInterface = SpecialAnimation.getInstance()
        elseif rawequal(self.state, 2) then
            self.highScoresPaintable = self:getRealHighScoresPaintable()
        end
        local gameAdState = self.gameAdStateFactory:getCurrentInstance()
        gameAdState:processPageAdState()
end
java_overload(DemoCanvas, "updateDemoState", 0)


-- throws Exception
function DemoCanvas:getNextRandom()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(DemoCanvas, "getNextRandom", 0)


-- throws Exception
function DemoCanvas:createGameLayerManager(randomValue)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(DemoCanvas, "createGameLayerManager", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function DemoCanvas:createRunnable(randomLevel)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(DemoCanvas, "createRunnable", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function DemoCanvas:create()
        PreLogUtil.put(self.commonStrings.START, self, "create")
        self.highScoresPaintable = NullPaintable.getInstance()
        local randomLevel = self:getNextRandom()
        self.gameCanvas = self:createRunnable(randomLevel)
        self.basicColor = self.gameCanvas:getLayerManager():getForegroundBasicColor()
        self:getRealHighScoresPaintable():setBasicColorP(self.basicColor)
        self.gameCanvas:setGameCanvasStartListener(self)
        local gameInfo = self.gameCanvas:getLayerManager():getGameInfo()
        self:getHighScoresFactoryInterface():fetchHighScores(gameInfo, self.highScoresHelper)
end
java_overload(DemoCanvas, "create", 0)


-- throws Exception
function DemoCanvas:start()
        local gameCanvas = self.gameCanvas
        PreLogUtil.put(tostring(StringMaker.new():append("Game Thread in DemoCanvas: "):append(self.stringUtil:toString(gameCanvas))), self, self.commonStrings.START)
        self.canvasThread = self.threadFactoryUtil:getInstanceGameCanvasRunnable(gameCanvas)
        self.gameCanvas:setThread(self.canvasThread)
        self.threadFactoryUtil:start(self.canvasThread)
        if rawequal(self:getWait(), NullWaitGameRunnable.getInstance().WAIT) then
            self:setWait(self:getTempWait())
        end
end
java_overload(DemoCanvas, "start", 0)


function DemoCanvas:preDemoProcess()
        if not (self.gameCanvas:isInitialized()) or rawequal(self.gameCanvas:getTitle(), NullGameCanvas.NO_GAME) then
            if AllBinaryMediaManager.update() then
                if not (PrimaryPlayerQueueFactory.getInstance():process()) then
                    SecondaryPlayerQueueFactory.getInstance():process()
                end
            end
        end
        self.overlayPaintable:update()
end
java_overload(DemoCanvas, "preDemoProcess", 0)


-- throws Exception
function DemoCanvas:process()
        java_super(RunnableCanvas, "process", 0)(self)
        self:getMenuInputProcessor():processInputList()
        self:preDemoProcess()
        if rawequal(self.state, 0) then
            local indexedAnimationBehavior = (self:getSpecialAnimationInterface():getAnimationBehavior())
            if indexedAnimationBehavior.loopIndex < 1 then
                self.timeDelayHelper:setStartTimeTNT()
            end
            local demoGameMidlet = self:getCustomCommandListener()
            if not rawequal(self.gameCanvas, NullGameCanvas.getInstance()) and self.gameCanvas:isGameOver() then
                self:stopGameDemo()
                local randomLevel = self:getNextRandom()
                local gameInfo = self.gameCanvas:getLayerManager():getGameInfo()
                gameInfo:setCurrentLevel(randomLevel)
                self.gameCanvas:setGameOver(false)
                self:start()
            elseif rawequal(self.gameCanvas, NullGameCanvas.getInstance()) and demoGameMidlet:isReady() then
                if not (self.demoGameRunnable:isRunning()) then
                    self:startDemoGame()
                    self.demoGameRunnable:setRunning(true)
                    local thread = self.threadFactoryUtil:getInstanceForRunnable(self.demoGameRunnable)
                    self.demoGameRunnable:setThread(thread)
                    self.threadFactoryUtil:start(thread)
                end
            end
        end
end
java_overload(DemoCanvas, "process", 0)


-- throws Exception
function DemoCanvas:startDemoGame()
        DemoCanvasProgressUtil.showProgress(self)
end
java_overload(DemoCanvas, "startDemoGame", 0)


-- throws Exception
function DemoCanvas:stopGameDemo()
        if not rawequal(self.gameCanvas, NullGameCanvas.getInstance()) then
            self.logUtil:putF("Set Running False", self, "stopGameDemo")
            self.gameCanvas:setRunning(false)
        end
        ThreadUtil.getInstance():join(self.canvasThread)
end
java_overload(DemoCanvas, "stopGameDemo", 0)


function DemoCanvas:showGamePaintable()
        local METHOD_NAME = "showGamePaintable"
        PreLogUtil.put(self.commonStrings.START, self, METHOD_NAME)
        local isDefault = J2MEUtil.isHTML()
        if not rawequal(self.gameCanvas, NullGameCanvas.getInstance()) and (self.gameCanvas:isRunning() or isDefault or SWTUtil.isSWT) and not (rawequal(self.gameCanvas:getType(), NullGameCanvas.TYPE)) then
            self.gameRunnable = self.gameCanvas.gameRunnable
            PreLogUtil.put("Showing Game", self, METHOD_NAME)
            self:setPaintableInterface(self.gameCanvas)
        else
            self.gameRunnable = NullWaitGameRunnable.getInstance()
            PreLogUtil.put("Not Showing Game", self, METHOD_NAME)
            self:setPaintableInterface(self:getDefaultPaintableInterface())
        end
end
java_overload(DemoCanvas, "showGamePaintable", 0)


function DemoCanvas:isReadyForStateChange()
        return not (self.demoGameRunnable:isRunning()) and self.gameCanvas:isInitialized()
end
java_overload(DemoCanvas, "isReadyForStateChange", 0)


-- throws Exception
function DemoCanvas:processGame()
        self.gameRunnable:run()
        if not (self.specialAnimationInterface:isComplete()) and self:isReadyForStateChange() then
            self.specialAnimationInterface:nextFrame()
        end
        if self.timeDelayHelper:isTimeTNT() and self:isReadyForStateChange() then
            self:demoStateChange()
        else
            self:process()
        end
end
java_overload(DemoCanvas, "processGame", 0)


function DemoCanvas:run()
        self.logUtil:putF(self.commonStrings.START_RUNNABLE, self, self.commonStrings.RUN)
        local try_ok, try_error, try_value = pcall(function()
            local progressCanvas = ProgressCanvasFactory.getInstance()
            local features = Features.getInstance()
            local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
            progressCanvas:addNormalPortion(50, "Demo Thread")
            self:setCurrentThread()
            self:setRunning(true)
            if features:isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND) then
                progressCanvas:end_()
            else
                progressCanvas:addNormalPortion(50, "Demo Thread Running")
            end
            self.fullScreenUtil:initOnRun(self, self:getCustomCommandListener())
            self:initMenu()
            self:initPostPaint()
            self:updateDemoState()
            if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
                while rawequal(self.gameCanvas, NullGameCanvas.getInstance()) or not (self.gameCanvas:isInitialized()) do
                    self.loopTimeHelper:setStartTimeTNT()
                    self:processGame()
                    self:processLoopSleep()
                end
                local demoGameRunnable = DemoGameRunnable.new(self)
                local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                currentDisplayableFactory:setRunnable(demoGameRunnable)
                currentDisplayableFactory:setMyCanvas(self)
                OpenGLThreadUtil.getInstance():onResume()
            end
            if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) or J2MEUtil.isHTML() then
                local demoGameRunnable = DemoGameRunnable.new(self)
                local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                currentDisplayableFactory:setRunnable(demoGameRunnable)
                currentDisplayableFactory:setMyCanvas(self)
            else
                self:runCanvasLoop()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
        self.logUtil:putF(self.commonStrings.END_RUNNABLE, self, self.commonStrings.RUN)
end
java_overload(DemoCanvas, "run", 0)


-- throws Exception
function DemoCanvas:runCanvasLoop()
        while self:isRunning() do
            self:run3()
        end
        self:end_()
end
java_overload(DemoCanvas, "runCanvasLoop", 0)


-- throws Exception
function DemoCanvas:run3()
        self.loopTimeHelper:setStartTimeTNT()
        self:processGame()
        self:processLoopSleep()
end
java_overload(DemoCanvas, "run3", 0)


function DemoCanvas:setRunning(running)
        java_super(RunnableCanvas, "setRunning", 1)(self, running)
        local try_ok, try_error, try_value = pcall(function()
            local features = Features.getInstance()
            local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
            if running then
            else
                if (features:isDefault(openGLFeatureFactory.OPENGL) or J2MEUtil.isHTML()) or SWTUtil.isSWT then
                    local currentDisplayableFactory = CurrentDisplayableFactory.getInstance()
                    currentDisplayableFactory:clearRunnable()
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
java_overload(DemoCanvas, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


-- throws Exception
function DemoCanvas:end_()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        local features = Features.getInstance()
        self.baseGameStatistics:add(tostring(StringMaker.new():append(DemoCanvas.BOT_GAME_STATS):append(tostring(self.baseGameStatistics)):append(CommonSeps.getInstance().NEW_LINE)))
        self.baseGameStatistics:init()
        if features:isFeature(MainFeatureFactory.getInstance().LOAD_ONDEMAND) then
            progressCanvas:start()
        end
        self.logUtil:putF("Demo End", self, self.commonStrings.RUN)
        self:close()
        DisplayChangeEventHandler.getInstance():removeListener(self)
        self:stopGameDemo()
end
java_overload(DemoCanvas, "end_", 0)


function DemoCanvas:setGameState(gameState)
end
java_overload(DemoCanvas, "setGameState", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameState")) end)


function DemoCanvas:getGameState()
        return self.gameStateFactory.PLAYING_GAME_STATE
end
java_overload(DemoCanvas, "getGameState", 0)


function DemoCanvas:getGameCanvasRunnableInterface()
        return self.gameCanvas
end
java_overload(DemoCanvas, "getGameCanvasRunnableInterface", 0)


function DemoCanvas:isDemoLoading()
        local gameCanvas = self.gameCanvas
        if rawequal(gameCanvas, NullGameCanvas.getInstance()) then
            return true
        elseif gameCanvas:isInitialized() then
            return false
        end
        return true
end
java_overload(DemoCanvas, "isDemoLoading", 0)


function DemoCanvas:getState()
        return self.state
end
java_overload(DemoCanvas, "getState", 0)


function DemoCanvas:setState(state)
        self.state = state
end
java_overload(DemoCanvas, "setState", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DemoCanvas:isHighScoreSubmitted()
        self.logUtil:putF("Wow the AI got a high score!", self, "isHighScoreSubmitted")
        return false
end
java_overload(DemoCanvas, "isHighScoreSubmitted", 0)


function DemoCanvas:getRealHighScoresPaintable()
        return self.realHighScoresPaintable
end
java_overload(DemoCanvas, "getRealHighScoresPaintable", 0)


function DemoCanvas:setSpecialAnimationInterface(specialAnimationInterface)
        specialAnimationInterface:setFrame(0)
        self.specialAnimationInterface = specialAnimationInterface
end
java_overload(DemoCanvas, "setSpecialAnimationInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "SpecialAnimation")) end)


function DemoCanvas:getSpecialAnimationInterface()
        return self.specialAnimationInterface
end
java_overload(DemoCanvas, "getSpecialAnimationInterface", 0)


function DemoCanvas:setPaintableInterface(paintableInterface)
        self.paintableInterface = paintableInterface
end
java_overload(DemoCanvas, "setPaintableInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PaintableInterface")) end)


function DemoCanvas:getPaintableInterface()
        return self.paintableInterface
end
java_overload(DemoCanvas, "getPaintableInterface", 0)


function DemoCanvas:setDefaultPaintableInterface(defaultPaintableInterface)
        self.defaultPaintableInterface = defaultPaintableInterface
end
java_overload(DemoCanvas, "setDefaultPaintableInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)


function DemoCanvas:getDefaultPaintableInterface()
        return self.defaultPaintableInterface
end
java_overload(DemoCanvas, "getDefaultPaintableInterface", 0)


function DemoCanvas:getHighScoresFactoryInterface()
        return self.highScoresFactoryInterface
end
java_overload(DemoCanvas, "getHighScoresFactoryInterface", 0)


function DemoCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end
java_overload(DemoCanvas, "setMenuInputProcessor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicMenuInputProcessor")) end)


function DemoCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end
java_overload(DemoCanvas, "getMenuInputProcessor", 0)


function DemoCanvas:getMenuForm()
        return self.menuForm
end
java_overload(DemoCanvas, "getMenuForm", 0)


function DemoCanvas:setMenuForm(menuForm)
        self.menuForm = menuForm
end
java_overload(DemoCanvas, "setMenuForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ScrollSelectionForm")) end)


function DemoCanvas:isInitialized()
        return self.initialized
end
java_overload(DemoCanvas, "isInitialized", 0)


function DemoCanvas:getOverlayPaintable()
        return self.overlayPaintable
end
java_overload(DemoCanvas, "getOverlayPaintable", 0)


function DemoCanvas:setBasicGameDemoPaintable(basicGameDemoPaintable)
        self.basicGameDemoPaintable = basicGameDemoPaintable
end
java_overload(DemoCanvas, "setBasicGameDemoPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StatePaintable")) end)


function DemoCanvas:getBasicGameDemoPaintable()
        return self.basicGameDemoPaintable
end
java_overload(DemoCanvas, "getBasicGameDemoPaintable", 0)


function DemoCanvas:setTempWait(tempWait)
        self.tempWait = tempWait
end
java_overload(DemoCanvas, "setTempWait", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DemoCanvas:getTempWait()
        return self.tempWait
end
java_overload(DemoCanvas, "getTempWait", 0)


function DemoCanvas:isSingleThread()
        return OpenGLFeatureUtil.getInstance():isAnyThreed() or SWTUtil.isSWT
end
java_overload(DemoCanvas, "isSingleThread", 0)


function DemoCanvas:isRunningInAnotherThread()
        local features = Features.getInstance()
        local openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
        if features:isDefault(openGLFeatureFactory.OPENGL_AS_GAME_THREAD) then
            return true
        else
            return self:isRunning()
        end
end
java_overload(DemoCanvas, "isRunningInAnotherThread", 0)


function DemoCanvas:getGameInitializationInterfaceFactoryInterface()
        return self.gameInitializationInterfaceFactoryInterface
end
java_overload(DemoCanvas, "getGameInitializationInterfaceFactoryInterface", 0)


function DemoCanvas:getType()
        return DemoCanvas.TYPE
end
java_overload(DemoCanvas, "getType", 0)


function DemoCanvas:getTitle()
        return java_super(RunnableCanvas, "getTitle", 0)(self)
end
java_overload(DemoCanvas, "getTitle", 0)


function DemoCanvas:isPaused()
        return java_super(RunnableCanvas, "isPaused", 0)(self)
end
java_overload(DemoCanvas, "isPaused", 0)

DemoCanvas.id = 0
DemoCanvas.BOT_GAME_STATS = "Bot Game Statistics: "
DemoCanvas.TYPE = 3

return DemoCanvas

