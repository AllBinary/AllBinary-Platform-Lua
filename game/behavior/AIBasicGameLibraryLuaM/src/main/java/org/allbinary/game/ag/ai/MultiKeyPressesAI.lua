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
-- package org.allbinary.game.ag.ai

local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local KeyPressesAI = require("org.allbinary.game.ag.ai.KeyPressesAI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultiKeyPressesAI = {}
MultiKeyPressesAI.__index = MultiKeyPressesAI
MultiKeyPressesAI.className = "MultiKeyPressesAI"
setmetatable(MultiKeyPressesAI, {__index = KeyPressesAI})

function MultiKeyPressesAI:_init_fields()
    self.toggleTimeHelper = TimeDelayHelper.new(600)
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function MultiKeyPressesAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(KeyPressesAI.new(hashtable, ownerLayerInterface, gameInput), MultiKeyPressesAI)
    self:_init_fields()
        -- super(...) made self above
        self:update()
    return self
end


-- throws Exception
function MultiKeyPressesAI:processAI(allBinaryLayerManager)
end


-- throws Exception
function MultiKeyPressesAI:update()
        local gameInput = self:getGameInput()
        local keys = self.keys
        local size = (keys.n or #keys)
        if self:isOn() then
            for index = 0, size - 1 do
                local key = math.tointeger(keys[index + 1] // 1)
                if key ~= -1 then
                    gameInput:add(self.gameKeyEventFactory:getInstanceForKey(self, key))
                end
            end
        else
            for index = 0, size - 1 do
                local key = math.tointeger(keys[index + 1] // 1)
                if key ~= -1 then
                    gameInput:addForRemoval(self.gameKeyEventFactory:getInstanceForKey(self, key))
                end
            end
        end
end


-- throws Exception
function MultiKeyPressesAI:toggle()
        if self.toggleTimeHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            KeyPressesAI.toggle(self)
            self:update()
        end
end


-- throws Exception
function MultiKeyPressesAI:disable()
        if self.toggleTimeHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            KeyPressesAI.disable(self)
            self:update()
        end
end


-- throws Exception
function MultiKeyPressesAI:enable()
        if self.toggleTimeHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            KeyPressesAI.enable(self)
            self:update()
        end
end

return MultiKeyPressesAI

