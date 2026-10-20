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
-- package org.allbinary.util

local JsType = require("jsinterop.annotations.JsType")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicArrayListD = {}
BasicArrayListD.__index = BasicArrayListD
BasicArrayListD.className = "BasicArrayListD"
setmetatable(BasicArrayListD, {__index = BasicArrayListS})


function BasicArrayListD.new()
    local self = setmetatable(BasicArrayListS.new(7), BasicArrayListD)
        -- super(...) made self above
    return self
end

return BasicArrayListD

