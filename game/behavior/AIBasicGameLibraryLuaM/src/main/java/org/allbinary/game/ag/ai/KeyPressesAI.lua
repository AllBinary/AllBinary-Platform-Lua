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
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local KeyPressesAI = {}
KeyPressesAI.__index = KeyPressesAI
KeyPressesAI.className = "KeyPressesAI"
setmetatable(KeyPressesAI, {__index = BasicAI})

function KeyPressesAI:_init_fields()
    self.on = true
    self.keys = nil
end


function KeyPressesAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), KeyPressesAI)
    self:_init_fields()
        -- super(...) made self above
        self.keys = java_new_array(nil, hashtable:size())
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local size = (objectArray.n or #objectArray)
        for index = 0, size - 1 do
            self.keys[index + 1] = hashtable:get(objectArray[index + 1])
        end
    return self
end


-- throws Exception
function KeyPressesAI:processAI(allBinaryLayerManager)
        if self.on then
            for index = 0, (self.keys.n or #self.keys) - 1 do
                BasicAI.processKeyAI(self, math.tointeger(self.keys[index + 1] // 1))
            end
        end
end


-- throws Exception
function KeyPressesAI:toggle()
        if self:isOn() then
            self:setOn(false)
        else
            self:setOn(true)
        end
end


-- throws Exception
function KeyPressesAI:disable()
        self:setOn(false)
end


-- throws Exception
function KeyPressesAI:enable()
        self:setOn(true)
end


function KeyPressesAI:setOn(on)
        self.on = on
end


function KeyPressesAI:isOn()
        return self.on
end

return KeyPressesAI

