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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local GameRunnable = require("org.allbinary.game.displayable.canvas.GameRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoGameRunnable = {}
DemoGameRunnable.__index = DemoGameRunnable
DemoGameRunnable.className = "DemoGameRunnable"
setmetatable(DemoGameRunnable, {__index = GameRunnable})

function DemoGameRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.demoCanvas = nil
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function DemoGameRunnable.new(demoCanvas)
    local self = setmetatable(GameRunnable.new(), DemoGameRunnable)
    self:_init_fields()
        self.demoCanvas = demoCanvas
    return self
end


function DemoGameRunnable:run()
        local try_ok, try_error = pcall(function()
            self.demoCanvas:getLoopTimeHelperP():setStartTime(self.gameTickTimeDelayHelper:setStartTime())
            self.demoCanvas:processGame()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end


-- throws Exception
function DemoGameRunnable:processLoopSleep()
        self.demoCanvas:processLoopSleep()
end

return DemoGameRunnable

