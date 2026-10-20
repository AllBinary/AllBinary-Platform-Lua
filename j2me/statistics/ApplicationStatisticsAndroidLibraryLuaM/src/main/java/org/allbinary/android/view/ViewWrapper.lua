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
-- package org.allbinary.android.view

local View = require("android.view.View")
local BaseViewWrapper = require("org.allbinary.android.view.BaseViewWrapper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ViewWrapper = {}
ViewWrapper.__index = ViewWrapper
ViewWrapper.className = "ViewWrapper"
setmetatable(ViewWrapper, {__index = BaseViewWrapper})

function ViewWrapper:_init_fields()
    self.view = nil
end


function ViewWrapper.new(view)
    local self = setmetatable(BaseViewWrapper.new(), ViewWrapper)
    self:_init_fields()
        self.view = view
    return self
end


function ViewWrapper:invalidate()
        self.view:invalidate()
end


function ViewWrapper:postInvalidate()
        self.view:postInvalidate()
end

return ViewWrapper

