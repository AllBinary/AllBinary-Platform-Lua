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
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = require("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = require("org.allbinary.game.paint.ColorFillPaintableFactory")
local Anchor = require("org.allbinary.graphics.Anchor")
local DrawStringUtil = require("org.allbinary.graphics.draw.DrawStringUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputMappingInstructionsCanvas = {}
GameInputMappingInstructionsCanvas.__index = GameInputMappingInstructionsCanvas
GameInputMappingInstructionsCanvas.className = "GameInputMappingInstructionsCanvas"
setmetatable(GameInputMappingInstructionsCanvas, {__index = GameCommandCanvas})

function GameInputMappingInstructionsCanvas:_init_fields()
    self.drawStringUtil = DrawStringUtil.getInstance()
    self.TITLE = "Input Instructions"
    self.instructions = {"Add Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the '1' key to select the Fire action)", "2. Make the newly desired input for the selected action.", "(Example: Press 'f' to add it to the selected action)", "Note: If the input is already mapped to another action then it will not be added. You", "will need to deleted from the other action before adding it to another.", "Warning: Not all keys map for a given platform and show as Unknown.", StringUtil.getInstance().EMPTY_STRING, "Remove Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the key '1' to select the Fire action)", "2. Select a mapped input for the selected action.", "(Example: Press the key '1' to select the '1' key input for the selected Fire action)", "3. Press the Delete Key."}
    self.colorFillPaintable = nil
    self.anchor = Anchor.TOP_LEFT
end


function GameInputMappingInstructionsCanvas.new(commandListener, allBinaryGameLayerManager)
    local self = setmetatable(GameCommandCanvas.new(commandListener, GameInputMappingInstructionsCanvas.NAME, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor()), GameInputMappingInstructionsCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
    return self
end


function GameInputMappingInstructionsCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameInputMappingInstructionsCanvas.CLOSE)
        self:setCommandListener(cmdListener)
end


function GameInputMappingInstructionsCanvas:paint(graphics)
        self.myFontProcessor:process(graphics)
        self.colorFillPaintable:paint(graphics)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        local beginWidth = (((graphics:getFont():stringWidth(self.TITLE)) // (1 << (1))))
        graphics:setColor(self.foregroundColor)
        graphics:drawString(self.TITLE, halfWidth - beginWidth, self.fontHeight, self.anchor)
        self.drawStringUtil:drawCenterStrings(graphics, self.instructions, self.displayInfo:getLastWidth(), self.fontHeight, halfWidth, 3 * self.fontHeight)
        GameCommandCanvas.paint(self, graphics)
end

GameInputMappingInstructionsCanvas.DISPLAY = Command.new("Help", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
GameInputMappingInstructionsCanvas.CLOSE = Command.new("Close", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
GameInputMappingInstructionsCanvas.NAME = "GameInputMappingInstructionsCanvas"

return GameInputMappingInstructionsCanvas

