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
-- package org.allbinary.string


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommonStateStrings = {}
CommonStateStrings.__index = CommonStateStrings
CommonStateStrings.className = "CommonStateStrings"

function CommonStateStrings:_init_fields()
    self.CONTEXT = "Context: "
    self.FINISH = "finish"
    self.CREATE = "onCreate"
    self.START = "onStart"
    self.RESTART = "onRestart"
    self.RESUME = "onResume"
    self.PAUSE = "onPause"
    self.STOP = "onStop"
    self.DESTROY = "onDestroy"
    self.BIND = "onBind"
    self.ON_SAVE_INSTANCE_STATE = "onSaveInstanceState"
    self.ON_START_COMMAND = "onStartCommand"
end

function CommonStateStrings.new()
    local self = setmetatable({}, CommonStateStrings)
    self:_init_fields()
    return self
end


function CommonStateStrings.getInstance()
        return CommonStateStrings.instance
end

CommonStateStrings.instance = CommonStateStrings.new()

return CommonStateStrings

