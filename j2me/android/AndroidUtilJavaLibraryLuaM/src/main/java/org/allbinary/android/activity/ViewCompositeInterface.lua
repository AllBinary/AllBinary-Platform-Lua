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
-- package org.allbinary.android.activity

local View = require("android.view.View")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ViewCompositeInterface = {}
ViewCompositeInterface.__index = ViewCompositeInterface
ViewCompositeInterface.className = "ViewCompositeInterface"


function ViewCompositeInterface:getRootView()
    error("abstract method getRootView")
end


function ViewCompositeInterface:getView()
    error("abstract method getView")
end


function ViewCompositeInterface:runOnUiThread(action)
    error("abstract method runOnUiThread")
end

return ViewCompositeInterface

