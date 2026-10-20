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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local Processor = require("org.allbinary.canvas.Processor")
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local RepaintBehavior = require("org.allbinary.game.displayable.RepaintBehavior")
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
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = require("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local ScreenRepaintProcessorFactory = require("org.allbinary.graphics.displayable.screen.ScreenRepaintProcessorFactory")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local CommandCurrentSelectionFormFactory = require("org.allbinary.graphics.form.CommandCurrentSelectionFormFactory")
local FormPaintable = require("org.allbinary.graphics.form.FormPaintable")
local FormTypeFactory = require("org.allbinary.graphics.form.FormTypeFactory")
local PaintableForm = require("org.allbinary.graphics.form.PaintableForm")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local ScrollSelectionFormNoneFactory = require("org.allbinary.graphics.form.ScrollSelectionFormNoneFactory")
local CommandTextItemArrayFactory = require("org.allbinary.graphics.form.item.CommandTextItemArrayFactory")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local AllCommandsVisitor = require("org.allbinary.graphics.form.item.validation.AllCommandsVisitor")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local BasicMotionGesturesHandler = require("org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
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

local GameCommandCanvas = {}
GameCommandCanvas.__index = GameCommandCanvas
GameCommandCanvas.className = "GameCommandCanvas"
setmetatable(GameCommandCanvas, {__index = MyCanvas})

function GameCommandCanvas:_init_fields()
    self.repaintProcessor = ScreenRepaintProcessorFactory.getInstance():create(self)
    self.gameInputStrings = GameInputStrings.getInstance()
    self.foregroundBasicColor = nil
    self.backgroundBasicColor = nil
    self.inputToGameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()
    self.gameKeyFactory = GameKeyFactory.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.repaintBehavior = nil
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.foregroundColor = nil
    self.backgroundColor = nil
    self.menuInputProcessor = NoMenuInputProcessor.getInstance()
    self.menuPaintable = NullPaintable.getInstance()
    self.menuForm = PaintableForm.getNullPaintableForm()
    self.isSingleKeyRepeatableProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
    self.fontHeight = 0
end


function GameCommandCanvas.new(cmdListener, name, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(MyCanvas.new(name, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST), GameCommandCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.repaintBehavior = RepaintBehavior.getInstance()
        self.foregroundBasicColor = foregroundBasicColor
        self.backgroundBasicColor = backgroundBasicColor
        self.foregroundColor = math.tointeger(self.foregroundBasicColor // 1)
        self.backgroundColor = math.tointeger(self.backgroundBasicColor // 1)
        self:initCommands(cmdListener)
        if cmdListener ~= NullCommandListener.NULL_COMMAND_LISTENER then
            local try_ok, try_error = pcall(function()
                self:initMenu()
                self.repaintProcessor:process()
            end)
            if not try_ok then
                local e = try_error
                error(java_exception("RuntimeException"), 0)
            end
        end
    return self
end


function GameCommandCanvas:updateMeasurement(graphics)
        local try_ok, try_error = pcall(function()
            local font = graphics:getFont()
            self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(self.canvasStrings.FD_WIDTH):appendint(java_int(MyFontProcessor.defaultCharWidth(font))):append(self.canvasStrings.FD_HEIGHT):appendint(java_int(font:getHeight()))), self, self.canvasStrings.UPDATE_MEASUREMENT)
            self.fontHeight = font:getHeight()
            local rectangle = self:createRectangle(self.menuForm:size())
            self.menuForm:init(rectangle, FormTypeFactory.getInstance().VERTICAL_CENTER_FORM)
            self:update()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT, e)
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function GameCommandCanvas:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function GameCommandCanvas:onDisplayChangeEvent(displayChangeEvent)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(tostring(DisplayInfoSingleton.getInstance()))), self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT)
        self.myFontProcessor = self.updateMyFontProcessor
end


function GameCommandCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end


-- throws Exception
function GameCommandCanvas:initMenu()
        local form = self:createForm()
        self.menuForm = form
        if form ~= ScrollSelectionFormNoneFactory.getInstance() then
            self:setMenuInputProcessor(ImmediateCommandFormInputProcessor.new(BasicArrayListD.new(), -1, self, form))
            self.menuPaintable = FormPaintable.new(form)
        end
        self.repaintBehavior:onChangeRepaint(self)
end


-- throws Exception
function GameCommandCanvas:createForm()
        local items = CommandTextItemArrayFactory.new(AllCommandsVisitor.new()):getInstance(self:getCommandStack(), self.backgroundBasicColor, self.foregroundBasicColor)
        local rectangle = self:createRectangle((items.n or #items))
        return CommandCurrentSelectionFormFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, items, rectangle, FormTypeFactory.getInstance().VERTICAL_CENTER_FORM, 15, false, self.backgroundBasicColor, self.foregroundBasicColor)
end


function GameCommandCanvas:createRectangle(size)
        local height = size * self.fontHeight
        local startY = (self.displayInfo:getLastHeight() * 2 / 3) - height
        local pointFactory = PointFactory.getInstance()
        local rectangle = Rectangle.new(pointFactory:createXY(30, startY), self.displayInfo:getLastWidth() - 30, startY)
        return rectangle
end


function GameCommandCanvas:open()
        self.logUtil:putF(self.commonStrings.START, self, "open")
        BasicMotionGesturesHandler.getInstance():addListenerInterface(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():addListener(self:getMenuInputProcessor())
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
end


-- throws Exception
function GameCommandCanvas:close()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CLOSE)
        BasicMotionGesturesHandler.getInstance():removeListener(self:getMenuInputProcessor())
        GameKeyEventHandler.getInstance():removeListener(self:getMenuInputProcessor())
        DisplayChangeEventHandler.getInstance():removeListener(self)
end


-- throws Exception
function GameCommandCanvas:update()
        self.repaintProcessor:process()
end


function GameCommandCanvas:getSourceId()
        return GameCommandCanvas.id
end


function GameCommandCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end


function GameCommandCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end


function GameCommandCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end


function GameCommandCanvas:keyPressedByDevice(keyCode, deviceId)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonSeps.getInstance().SPACE):appendint(keyCode)), self, self.gameInputStrings.KEY_PRESSED)
        self:addGameKeyEvent(keyCode, 0, false)
end


function GameCommandCanvas:keyReleasedByDevice(keyCode, deviceId)
        self:removeGameKeyEvent(keyCode, deviceId, false)
end


function GameCommandCanvas:keyRepeatedByDevice(keyCode, deviceId)
        if self.isSingleKeyRepeatableProcessing then
            self:addGameKeyEvent(keyCode, deviceId, true)
        end
end


function GameCommandCanvas:addGameKeyEvent(keyCode, deviceId, repeated)
        local try_ok, try_error = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if gameKey ~= self.gameKeyFactory.NONE then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                self.downGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.downGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.ADD_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end


function GameCommandCanvas:removeGameKeyEvent(keyCode, deviceId, repeated)
        local try_ok, try_error = pcall(function()
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            if gameKey ~= self.gameKeyFactory.NONE then
                local gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
                self.upGameKeyEventHandler:fireEvent(gameKeyEvent)
                self.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.gameInputStrings.NO_KEY):appendint(keyCode)), self, self.gameInputStrings.REMOVE_KEY_EVENT)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.REMOVE_KEY_EVENT, e)
        end
end


function GameCommandCanvas:paint(graphics)
        self.myFontProcessor:process(graphics)
        self.menuPaintable:paint(graphics)
        self.repaintBehavior:repaint(self)
end


function GameCommandCanvas:setMenuInputProcessor(menuInputProcessor)
        self.menuInputProcessor = menuInputProcessor
end


function GameCommandCanvas:getMenuInputProcessor()
        return self.menuInputProcessor
end

GameCommandCanvas.id = 0

return GameCommandCanvas

