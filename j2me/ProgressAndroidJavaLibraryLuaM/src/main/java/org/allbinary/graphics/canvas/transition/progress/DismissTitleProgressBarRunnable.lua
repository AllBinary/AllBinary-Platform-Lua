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

local TransistionTypes = require("org.allbinary.animation.transition.TransistionTypes")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Activity = require("android.app.Activity")
local ProgressRunnable = require("org.allbinary.graphics.canvas.transition.progress.ProgressRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DismissTitleProgressBarRunnable = {}
DismissTitleProgressBarRunnable.__index = DismissTitleProgressBarRunnable
DismissTitleProgressBarRunnable.className = "DismissTitleProgressBarRunnable"
setmetatable(DismissTitleProgressBarRunnable, {__index = ProgressRunnable})

function DismissTitleProgressBarRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.ZOOM_OUT_AND_IN = {TransistionTypes.getInstance().ZOOM_OUT, TransistionTypes.getInstance().ZOOM_IN}
end


function DismissTitleProgressBarRunnable.new(midletActivity, progressCanvas)
    local self = setmetatable(ProgressRunnable.new(midletActivity, progressCanvas), DismissTitleProgressBarRunnable)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function DismissTitleProgressBarRunnable:run()
        local try_ok, try_error = pcall(function()
            self.midletActivity:onDismissProgress(self.ZOOM_OUT_AND_IN)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end

return DismissTitleProgressBarRunnable

