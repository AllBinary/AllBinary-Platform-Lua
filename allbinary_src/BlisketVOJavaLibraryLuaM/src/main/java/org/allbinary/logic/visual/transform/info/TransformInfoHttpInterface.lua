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
-- package org.allbinary.logic.visual.transform.info

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

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
local TransformInfoHttpInterface = {}
TransformInfoHttpInterface.__index = TransformInfoHttpInterface
TransformInfoHttpInterface.className = "TransformInfoHttpInterface"
setmetatable(TransformInfoHttpInterface, {__index = TransformInfoInterface})


function TransformInfoHttpInterface:getWeblisketSession()
    error("abstract method getWeblisketSession")
end


function TransformInfoHttpInterface:getPageContext()
    error("abstract method getPageContext")
end


function TransformInfoHttpInterface:getPropertiesHashMap()
    error("abstract method getPropertiesHashMap")
end

return TransformInfoHttpInterface

