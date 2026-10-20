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

local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
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

local GameConfigurationSingleton = {}
GameConfigurationSingleton.__index = GameConfigurationSingleton
GameConfigurationSingleton.className = "GameConfigurationSingleton"

function GameConfigurationSingleton:_init_fields()
    self.list = nil
    self.hashtable = nil
end


function GameConfigurationSingleton.getInstance()
        return GameConfigurationSingleton.SINGLETON
end


function GameConfigurationSingleton.new()
    local self = setmetatable({}, GameConfigurationSingleton)
    self:_init_fields()
        self.list = BasicArrayListD.new()
        self.hashtable = StdUtil.getInstance():createHashtable()
    return self
end


function GameConfigurationSingleton:getInstanceByName(name)
        return self.hashtable:get(name)
end


function GameConfigurationSingleton:getOptionsBasicArrayList()
        return self.list
end


function GameConfigurationSingleton:add(gameConfiguration)
        self.list:add(gameConfiguration)
end


function GameConfigurationSingleton:getHashtable()
        return self.hashtable
end

GameConfigurationSingleton.SINGLETON = GameConfigurationSingleton.new()

return GameConfigurationSingleton

