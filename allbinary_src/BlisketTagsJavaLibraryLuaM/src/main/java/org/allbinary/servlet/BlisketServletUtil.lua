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
-- package org.allbinary.servlet

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local AppUrlGlobals = require("org.allbinary.globals.AppUrlGlobals")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local WebappClassLoaderInfo = require("org.allbinary.logic.system.loader.WebappClassLoaderInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BlisketServletUtil = {}
BlisketServletUtil.__index = BlisketServletUtil
BlisketServletUtil.className = "BlisketServletUtil"

function BlisketServletUtil.new()
    local self = setmetatable({}, BlisketServletUtil)
    return self
end


function BlisketServletUtil.getInstance()
        return BlisketServletUtil.instance
end


function BlisketServletUtil:init(request)
        local urlGlobals = AppUrlGlobals.new()
        urlGlobals:setWebappPath(request:getServletContext():getRealPath(AbPathData.getInstance().SEPARATOR))
        self.URLGLOBALS:init(urlGlobals)
        WebappClassLoaderInfo.setLoader(getmetatable(self):getClassLoader())
end

BlisketServletUtil.instance = BlisketServletUtil.new()

return BlisketServletUtil

