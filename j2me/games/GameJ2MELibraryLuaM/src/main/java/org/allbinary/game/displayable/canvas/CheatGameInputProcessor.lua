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

local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventUtil = require("org.allbinary.game.input.event.GameKeyEventUtil")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local SpecialGameInputFactory = require("org.allbinary.game.layer.special.SpecialGameInputFactory")
local SpecialGameInputInterface = require("org.allbinary.game.layer.special.SpecialGameInputInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CheatGameInputProcessor = {}
CheatGameInputProcessor.__index = CheatGameInputProcessor
CheatGameInputProcessor.className = "CheatGameInputProcessor"
setmetatable(CheatGameInputProcessor, {__index = PlayerGameInput})

function CheatGameInputProcessor:_init_fields()
    self.PROCESS_GAME = "processGame"
    self.gameCanvas = nil
    self.gameKeyFactory = GameKeyFactory.getInstance()
end


function CheatGameInputProcessor.new(gameCanvas)
    local self = setmetatable(PlayerGameInput.new(BasicArrayListD.new(), BasicArrayListD.new(), -1), CheatGameInputProcessor)
    self:_init_fields()
        -- super(...) made self above
        self.gameCanvas = gameCanvas
    return self
end


function CheatGameInputProcessor:update()
        local try_ok, try_error = pcall(function()
            local gameLayerManager = self.gameCanvas:getLayerManager()
            local list = self:getGameKeyEventList()
            local size = list:size()
            for index = 0, size - 1 do
                local anyType = list.objectArray[index + 1]
                local key = GameKeyEventUtil.getKey(anyType)
                if key == self.gameKeyFactory.LEVEL_DOWN:getId() then
                    CheatGameInputProcessor.inputProcessor:strafeLeft()
                    break
                elseif key == self.gameKeyFactory.LEVEL_UP:getId() then
                    CheatGameInputProcessor.inputProcessor:strafeRight()
                    break
                end
                if key == self.gameKeyFactory.LEFT:getId() then
                    CheatGameInputProcessor.inputProcessor:left()
                    break
                elseif key == self.gameKeyFactory.RIGHT:getId() then
                    CheatGameInputProcessor.inputProcessor:right()
                    break
                elseif key == self.gameKeyFactory.UP:getId() then
                    CheatGameInputProcessor.inputProcessor:up()
                    break
                elseif key == self.gameKeyFactory.DOWN:getId() then
                    CheatGameInputProcessor.inputProcessor:down()
                    break
                elseif key == self.gameKeyFactory.KEY_NUM1:getId() then
                    CheatGameInputProcessor.inputProcessor:special1(gameLayerManager, GameKeyEvent.NONE)
                    break
                elseif key == self.gameKeyFactory.KEY_NUM3:getId() then
                    CheatGameInputProcessor.inputProcessor:special2(gameLayerManager, GameKeyEvent.NONE)
                    break
                end
            end
            list:clear()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end

CheatGameInputProcessor.inputProcessor = SpecialGameInputFactory.NO_SPECIAL_GAME_INPUT

return CheatGameInputProcessor

