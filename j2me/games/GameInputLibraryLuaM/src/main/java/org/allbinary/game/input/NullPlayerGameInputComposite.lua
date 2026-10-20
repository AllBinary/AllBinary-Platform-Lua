-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullPlayerGameInputComposite = {}
NullPlayerGameInputComposite.__index = NullPlayerGameInputComposite
NullPlayerGameInputComposite.className = "NullPlayerGameInputComposite"

function NullPlayerGameInputComposite.new()
    local self = setmetatable({}, NullPlayerGameInputComposite)
    return self
end


function NullPlayerGameInputComposite:getName()
        return StringUtil.getInstance().EMPTY_STRING
end


-- throws Exception
function NullPlayerGameInputComposite:processInput(layerManager)
end


function NullPlayerGameInputComposite:initInputProcessors()
end


function NullPlayerGameInputComposite:getPlayerGameInput()
        return NoPlayerGameInput.getInstance()
end

NullPlayerGameInputComposite.NULL_PLAYER_GAME_INPUT_COMPOSITE = NullPlayerGameInputComposite.new()

return NullPlayerGameInputComposite

