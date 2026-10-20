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

local Init = require("org.allbinary.init.Init")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local KeyFactoryInitializer = {}
KeyFactoryInitializer.__index = KeyFactoryInitializer
KeyFactoryInitializer.className = "KeyFactoryInitializer"
setmetatable(KeyFactoryInitializer, {__index = Init})

function KeyFactoryInitializer:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function KeyFactoryInitializer.new()
    local self = setmetatable(Init.new(), KeyFactoryInitializer)
    self:_init_fields()
    return self
end


function KeyFactoryInitializer:init()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.INIT)
        SmallIntegerSingletonFactory.getInstance():initWithRange(0x2D0, 6)
end

return KeyFactoryInitializer

