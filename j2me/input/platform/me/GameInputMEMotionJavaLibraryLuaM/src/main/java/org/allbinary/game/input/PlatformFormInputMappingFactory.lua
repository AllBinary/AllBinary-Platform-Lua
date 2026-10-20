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
-- package org.allbinary.game.input

local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local NullUtil = require("org.allbinary.logic.NullUtil")
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

local PlatformFormInputMappingFactory = {}
PlatformFormInputMappingFactory.__index = PlatformFormInputMappingFactory
PlatformFormInputMappingFactory.className = "PlatformFormInputMappingFactory"

function PlatformFormInputMappingFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputToGameKeyMapping = InputToGameKeyMapping.getNullInstance()
end

function PlatformFormInputMappingFactory.new()
    local self = setmetatable({}, PlatformFormInputMappingFactory)
    self:_init_fields()
    return self
end


function PlatformFormInputMappingFactory.getInstance()
        if PlatformFormInputMappingFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            PlatformFormInputMappingFactory.instance = PlatformFormInputMappingFactory.new()
        end
        return PlatformFormInputMappingFactory.instance
end


function PlatformFormInputMappingFactory:getOrCreate()
        local try_ok, try_error = pcall(function()
            if self.inputToGameKeyMapping == InputToGameKeyMapping.getNullInstance() then
                local inputToGameKeyMapping = InputToGameKeyMapping.new()
                local gameKeyFactory = GameKeyFactory.getInstance()
                inputToGameKeyMapping:add(gameKeyFactory.UP, gameKeyFactory.UP)
                inputToGameKeyMapping:add(gameKeyFactory.DOWN, gameKeyFactory.DOWN)
                inputToGameKeyMapping:add(gameKeyFactory.LEFT, gameKeyFactory.LEFT)
                inputToGameKeyMapping:add(gameKeyFactory.RIGHT, gameKeyFactory.RIGHT)
                inputToGameKeyMapping:add(gameKeyFactory.KEY_NUM1, gameKeyFactory.GAME_A)
                self.inputToGameKeyMapping = inputToGameKeyMapping
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
        end
        return self.inputToGameKeyMapping
end

PlatformFormInputMappingFactory.instance = NullUtil.getInstance().NULL_OBJECT

return PlatformFormInputMappingFactory

