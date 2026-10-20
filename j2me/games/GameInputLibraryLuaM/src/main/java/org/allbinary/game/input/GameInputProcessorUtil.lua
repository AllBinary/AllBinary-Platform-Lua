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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputProcessorUtil = {}
GameInputProcessorUtil.__index = GameInputProcessorUtil
GameInputProcessorUtil.className = "GameInputProcessorUtil"

function GameInputProcessorUtil.new()
    local self = setmetatable({}, GameInputProcessorUtil)
    return self
end


function GameInputProcessorUtil.init(inputProcessorArray)
        local noInputProcessor = GameInputProcessor.getInstance()
        local total = InputFactory.getInstance().MAX
        for index = 0, total - 1 do
            local inputProcessorCanBeNull = inputProcessorArray[index + 1]
            if inputProcessorCanBeNull == nil then
                inputProcessorArray[index + 1] = noInputProcessor
            end
        end
end

return GameInputProcessorUtil

