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
-- package org.allbinary.graphics.canvas.transition.progress

local Activity = require("android.app.Activity")
local MidletActivityBase = require("org.allbinary.android.activity.MidletActivityBase")
local SimpleProgressActivityInterface = require("org.allbinary.android.activity.SimpleProgressActivityInterface")
local ARunnable = require("org.allbinary.thread.ARunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProgressRunnable = {}
ProgressRunnable.__index = ProgressRunnable
ProgressRunnable.className = "ProgressRunnable"
setmetatable(ProgressRunnable, {__index = ARunnable})

function ProgressRunnable:_init_fields()
    self.midletActivity = nil
    self.progressCanvas = nil
end


function ProgressRunnable.new(midletActivity, progressCanvas)
    local self = setmetatable(ARunnable.new(), ProgressRunnable)
    self:_init_fields()
        local midletActivity2 = midletActivity
        self.midletActivity = midletActivity2
        self.progressCanvas = progressCanvas
    return self
end


function ProgressRunnable:run()
end

return ProgressRunnable

