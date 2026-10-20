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
local GameCommandsFactory = require("org.allbinary.game.commands.GameCommandsFactory")
local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local InputMappingInterface = require("org.allbinary.game.input.mapping.InputMappingInterface")
local PersistentInputMapping = require("org.allbinary.game.input.mapping.PersistentInputMapping")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = require("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = require("org.allbinary.game.paint.ColorFillPaintableFactory")
local HelpPaintable = require("org.allbinary.game.paint.help.HelpPaintable")
local InputMappingHelpPaintable = require("org.allbinary.game.paint.help.InputMappingHelpPaintable")
local ProcessPaintable = require("org.allbinary.graphics.paint.ProcessPaintable")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")

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

local GameInputMappingCanvas = {}
GameInputMappingCanvas.__index = GameInputMappingCanvas
GameInputMappingCanvas.className = "GameInputMappingCanvas"
setmetatable(GameInputMappingCanvas, {__index = GameCommandCanvas})

function GameInputMappingCanvas:_init_fields()
    self.paintable = nil
    self.helpPaintable = nil
    self.colorFillPaintable = nil
    self.inputMapping = nil
    self.NONE = GameKeyFactory.getInstance().NONE
    self.abeClientInformation = nil
    self.selectedGameKey = self.NONE
    self.selectedInput = self.NONE
    self.inputFactory = InputFactory.getInstance()
end


function GameInputMappingCanvas.new(abeClientInformation, commandListener, allBinaryGameLayerManager, helpPaintable)
    local self = setmetatable(GameCommandCanvas.new(commandListener, GameInputMappingCanvas.NAME, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor()), GameInputMappingCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        if helpPaintable == nil then
            error(java_exception("Exception", "Help Paintable Exception"), 0)
        end
        self.abeClientInformation = abeClientInformation
        self.helpPaintable = helpPaintable
        self.inputMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance()
        self.paintable = ProcessPaintable.new()
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
    return self
end


-- throws Exception
function GameInputMappingCanvas:close()
        GameCommandCanvas.close(self)
        self.paintable:process()
        self.selectedGameKey = self.NONE
        self.selectedInput = self.NONE
        self:update()
end


function GameInputMappingCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:addCommand(GameInputMappingCanvas.DEFAULT)
        self:addCommand(GameInputMappingInstructionsCanvas.DISPLAY)
        self:setCommandListener(cmdListener)
end


function GameInputMappingCanvas:keyPressed(keyCode)
        self:keyPressedByDevice(keyCode, 0)
end


function GameInputMappingCanvas:keyReleased(keyCode)
        self:keyReleasedByDevice(keyCode, 0)
end


function GameInputMappingCanvas:keyRepeated(keyCode)
        self:keyRepeatedByDevice(keyCode, 0)
end


function GameInputMappingCanvas:keyPressedByDevice(keyCode, deviceId)
        self:addGameKey(keyCode, false)
        GameCommandCanvas.keyPressedByDevice(self, keyCode, 0)
end


function GameInputMappingCanvas:addGameKey(keyCode, repeated)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Raw Device Key Code: "):append(string.format("%x", keyCode))), self, self.gameInputStrings.ADD_KEY_EVENT)
            local gameKey = self.inputToGameKeyMapping:getInstanceForCanvas(self, keyCode)
            local input = self.inputFactory:getInstanceById(keyCode)
            self:processInputMapping(gameKey, input)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Key Event Error", self, self.gameInputStrings.ADD_KEY_EVENT, e)
        end
end


-- throws Exception
function GameInputMappingCanvas:processInputMapping(gameKey, input)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Start Passed GameKey: ")
        stringBuffer:append(self.stringUtil:toString(gameKey))
        stringBuffer:append(" Input: ")
        stringBuffer:append(self.stringUtil:toString(input))
        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.PROCESS)
        if self.selectedGameKey ~= self.NONE then
            self:gameActionCrud(gameKey, input)
        else
            self:setSelectedAction(gameKey)
        end
end


function GameInputMappingCanvas:setSelectedAction(gameKey)
        self.logUtil:putF(tostring(StringMaker.new():append("Selected GameKey: "):append(self.stringUtil:toString(gameKey))), self, "setSelectedAction")
        self.selectedGameKey = gameKey
        self.selectedInput = self.NONE
        self.helpPaintable:update(self.selectedGameKey, self.selectedInput)
        self.repaintBehavior:onChangeRepaint(self)
end


-- throws Exception
function GameInputMappingCanvas:gameActionCrud(gameKey, input)
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Start GameKey: ")
        stringBuffer:append(self.stringUtil:toString(self.selectedGameKey))
        stringBuffer:append(" Input: ")
        stringBuffer:append(self.stringUtil:toString(self.selectedInput))
        self.logUtil:putF(tostring(stringBuffer), self, "gameActionCrud")
        if self.selectedInput == self.NONE then
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


-- throws Exception
function GameInputMappingCanvas:addNewMapping(gameKey, input)
        local METHOD_NAME = "addNewMapping"
        self.logUtil:putF(self.commonStrings.START, self, METHOD_NAME)
        local isInputAlreadyMapped = self.inputMapping:getInputMapping():isMapped(input)
        if not isInputAlreadyMapped and not self.inputMapping:isSystemInput(input) then
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


-- throws Exception
function GameInputMappingCanvas:setDefault()
        self.inputMapping:setDefault(self.abeClientInformation)
        self.helpPaintable:update(self.NONE, self.NONE)
        self.repaintBehavior:onChangeRepaint(self)
end


-- throws Exception
function GameInputMappingCanvas:update()
        self.inputMapping:update(self.abeClientInformation)
        self.helpPaintable:update(self.selectedGameKey, self.selectedInput)
        self.repaintBehavior:onChangeRepaint(self)
end


function GameInputMappingCanvas:paint(graphics)
        self.colorFillPaintable:paint(graphics)
        self.helpPaintable:paint(graphics)
        self.paintable:paint(graphics)
        GameCommandCanvas.paint(self, graphics)
end

GameInputMappingCanvas.NAME = "GameInputMappingCanvas"
GameInputMappingCanvas.DISPLAY = Command.new("Controls", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)
GameInputMappingCanvas.DEFAULT = Command.new("Default", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)

return GameInputMappingCanvas

