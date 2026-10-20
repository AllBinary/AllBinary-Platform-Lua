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

local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
-- java.lang.Runnable has no Lua module
local Runnable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local GameRunnable = {}
GameRunnable.__index = GameRunnable
GameRunnable.className = "GameRunnable"

function GameRunnable:_init_fields()
    self.WAIT = 240
    self.FAST = 60
    self.waitInMillis = self.WAIT
end


function GameRunnable.new()
    local self = setmetatable({}, GameRunnable)
    self:_init_fields()
    return self
end


function GameRunnable:run()
        DisplayInfoSingleton.getInstance():process()
end


-- throws Exception
function GameRunnable:processLoopSleep()
        java_sleep(self.waitInMillis)
end

return GameRunnable

