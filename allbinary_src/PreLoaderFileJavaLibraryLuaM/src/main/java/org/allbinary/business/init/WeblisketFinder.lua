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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local SubDirectory = require("org.allbinary.logic.io.file.directory.SubDirectory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeblisketFinder = {}
WeblisketFinder.__index = WeblisketFinder
WeblisketFinder.className = "WeblisketFinder"

function WeblisketFinder:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.subDirectory = SubDirectory.getInstance()
end


function WeblisketFinder.getInstance()
        return WeblisketFinder.instance
end


function WeblisketFinder.new()
    local self = setmetatable({}, WeblisketFinder)
    self:_init_fields()
    return self
end


function WeblisketFinder:findAll(path)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "findAll")
            return self.subDirectory:search(WeblisketFinder.KEY, AbFile.createAbFile(path))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "findAll", e)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PRELOADERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "findAll", e)
            end
            return nil
        end
end


function WeblisketFinder:getInstallationPath(file)
        local try_ok, try_error = pcall(function()
            local filePath = file:getPath()
            local end_ = ((string.find(filePath, WeblisketFinder.KEY, 1, true) or 0) - 1)
            if end_ < 0 then
                return nil
            end
            return string.sub(filePath, (0) + 1, end_)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRELOADERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstallationPath", e)
            end
            return nil
        end
end


-- throws Exception
function WeblisketFinder.main(args)
        local stringUtil = StringUtil.getInstance()
        local vector = WeblisketFinder.getInstance():findAll(stringUtil.EMPTY_STRING)
        print(vector:size())
end

WeblisketFinder.instance = WeblisketFinder.new()
WeblisketFinder.KEY = "installerdata.dat"

return WeblisketFinder

