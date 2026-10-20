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
local ABRunnable = require("org.allbinary.thread.ABRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoGameStartupRunnable = {}
DemoGameStartupRunnable.__index = DemoGameStartupRunnable
DemoGameStartupRunnable.className = "DemoGameStartupRunnable"
setmetatable(DemoGameStartupRunnable, {__index = ABRunnable})

function DemoGameStartupRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.demoCanvas = nil
end


function DemoGameStartupRunnable.new(demoCanvas)
    local self = setmetatable(ABRunnable.new(), DemoGameStartupRunnable)
    self:_init_fields()
        self.demoCanvas = demoCanvas
    return self
end


function DemoGameStartupRunnable:run()
        local try_ok, try_error = pcall(function()
            self:setRunning(true)
            self.demoCanvas:stopGameDemo()
            self.demoCanvas:create()
            self.demoCanvas:start()
            self:setRunning(false)
        end)
        if not try_ok then
            local e = try_error
            self:setRunning(false)
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end


function DemoGameStartupRunnable:getType()
        return DemoGameStartupRunnable.TYPE
end

DemoGameStartupRunnable.TYPE = 4

return DemoGameStartupRunnable

