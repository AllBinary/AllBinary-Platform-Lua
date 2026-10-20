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
-- package org.allbinary.game.configuration

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameOptionsFormFactory = {}
GameOptionsFormFactory.__index = GameOptionsFormFactory
GameOptionsFormFactory.className = "GameOptionsFormFactory"

function GameOptionsFormFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function GameOptionsFormFactory.new()
    local self = setmetatable({}, GameOptionsFormFactory)
    self:_init_fields()
    return self
end


function GameOptionsFormFactory.getInstance()
        return GameOptionsFormFactory.instance
end


function GameOptionsFormFactory:init(commandListener, title, backgrounBasicColor, foregroundBasicColor)
        local try_ok, try_error = pcall(function()
            return GameOptionsForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
            return CommandForm.getNullCommandForm()
        end
end

GameOptionsFormFactory.instance = GameOptionsFormFactory.new()

return GameOptionsFormFactory

