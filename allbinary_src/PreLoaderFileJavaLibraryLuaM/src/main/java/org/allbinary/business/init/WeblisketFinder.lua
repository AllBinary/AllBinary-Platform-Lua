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
-- package org.allbinary.business.init

local WeblisketFinder = {}
package.loaded["org.allbinary.business.init.WeblisketFinder"] = WeblisketFinder

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local SubDirectory = java_lazy("org.allbinary.logic.io.file.directory.SubDirectory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table WeblisketFinder is declared before the requires
WeblisketFinder.__index = WeblisketFinder
WeblisketFinder.className = "WeblisketFinder"
WeblisketFinder.javaClassName = "org.allbinary.business.init.WeblisketFinder"

function WeblisketFinder:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.subDirectory = SubDirectory.getInstance()
end


function WeblisketFinder.getInstance()
        return WeblisketFinder.instance_f
end


function WeblisketFinder._jinit(self)
    WeblisketFinder._init_fields(self)
    return self
end

function WeblisketFinder.new(...)
    local self = setmetatable({}, WeblisketFinder)
    WeblisketFinder._jinit(self, ...)
    return self
end


function WeblisketFinder:findAll(path)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "findAll")
            do return "__jreturn", self.subDirectory:search(WeblisketFinder.KEY, AbFile.createAbFile(path)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "findAll", e)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "findAll", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function WeblisketFinder:getInstallationPath(file)
        local try_ok, try_error, try_value = pcall(function()
            local filePath = file:getPath()
            local end_ = ((string.find(filePath, WeblisketFinder.KEY, 1, true) or 0) - 1)
            if end_ < 0 then
                do return "__jreturn", nil end
            end
            do return "__jreturn", string.sub(filePath, (0) + 1, end_) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstallationPath", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function WeblisketFinder.main(args)
        local stringUtil = StringUtil.getInstance()
        local vector = WeblisketFinder.getInstance():findAll(stringUtil.EMPTY_STRING)
        print(vector:size())
end

WeblisketFinder.instance_f = WeblisketFinder.new()
WeblisketFinder.KEY = "installerdata.dat"

return WeblisketFinder

