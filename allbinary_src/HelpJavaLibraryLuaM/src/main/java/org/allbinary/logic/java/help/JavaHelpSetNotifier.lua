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
-- package org.allbinary.logic.java.help

-- local URL = require("java.net.URL")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HelpSet = require("javax.help.HelpSet")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local JavaHelpSetNotifier = {}
JavaHelpSetNotifier.__index = JavaHelpSetNotifier
JavaHelpSetNotifier.className = "JavaHelpSetNotifier"


function JavaHelpSetNotifier.new()
    local self = setmetatable({}, JavaHelpSetNotifier)
    return self
end


function JavaHelpSetNotifier.get()
        return JavaHelpSetNotifier.vector
end


function JavaHelpSetNotifier.isNotified(helpSet)
        local isNotified = false
        local url = helpSet:getHelpSetURL()
        local size = JavaHelpSetNotifier.vector:size()
        local urlArray = JavaHelpSetNotifier.vector:toArray()
        for i = 0, size - 1 do
            local nextURL = urlArray[i + 1]
            if ((tostring(url) < tostring(nextURL) and -1) or (tostring(url) > tostring(nextURL) and 1) or 0) == 0 then
                isNotified = true
            end
        end
        JavaHelpSetNotifier.vector:add(url)
        return isNotified
end

JavaHelpSetNotifier.vector = BasicArrayListD.new()

return JavaHelpSetNotifier

