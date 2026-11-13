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
-- package org.allbinary.graphics.form

local Processor = require("org.allbinary.canvas.Processor")
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

local FormPlayerGameInputProcessor = {}
FormPlayerGameInputProcessor.__index = FormPlayerGameInputProcessor
FormPlayerGameInputProcessor.className = "FormPlayerGameInputProcessor"
setmetatable(FormPlayerGameInputProcessor, {__index = Processor})

function FormPlayerGameInputProcessor:_init_fields()
    self.playerGameInputCompositeInterface = nil
end


function FormPlayerGameInputProcessor.new(playerGameInputCompositeInterface)
    local self = setmetatable(Processor.new(), FormPlayerGameInputProcessor)
    self:_init_fields()
        self.playerGameInputCompositeInterface = playerGameInputCompositeInterface
    return self
end


-- throws Exception
function FormPlayerGameInputProcessor:process()
        self.playerGameInputCompositeInterface:getPlayerGameInput():update()
end

return FormPlayerGameInputProcessor

